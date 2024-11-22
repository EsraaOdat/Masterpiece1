using E_Commerce.dto;
using E_Commerce.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using PayPal.Api;
using System.Linq;

namespace E_Commerce.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class StoresController : ControllerBase
    {
        private readonly MyDbContext _context;

        public StoresController(MyDbContext context)
        {
            _context = context;
        }
        //----------------------------------------------------------------------------------------------------------------------------------
        //----------------------------------------------------------------------------------------------------------------------------------

        private void UpdateStoreStatuses()
        {
            var expiredStores = _context.Stores
                                        .Where(s => s.EndDate < DateTime.Now && s.Status == "active")
                                        .ToList();

            foreach (var store in expiredStores)
            {
                store.Status = "inactive";
            }

            _context.SaveChanges();
        }


        //----------------------------------------------------------------------------------------------------------------------------------
        //----------------------------------------------------------------------------------------------------------------------------------


        //  all stores active and inactive (Admin dashboard)
        [HttpGet]
        public IActionResult GetAllStores()
        {
            UpdateStoreStatuses();

            var data = _context.Stores.ToList();
            return Ok(data);
        }

        //----------------------------------------------------------------------------------------------------------------------------------
        //----------------------------------------------------------------------------------------------------------------------------------

        // Return store by ID (user Interface & Admin dashboard )
        [HttpGet("{id}")]
        public IActionResult GetStoreById(int id)
        {
            var store = _context.Stores.Find(id);

            if (store == null)
            {
                return NotFound();
            }

            return Ok(store);
        }
        //----------------------------------------------------------------------------------------------------------------------------------
        //----------------------------------------------------------------------------------------------------------------------------------
        // Create Store (User interface)
        [HttpPost]
        public IActionResult CreateStore([FromForm] StoreDTO storeDTO)
        {
            DateTime startDate = DateTime.Now;

            DateTime endDate;
            //1month
            if (storeDTO.PlanName.ToLower() == "monthly")
            {
                endDate = startDate.AddMonths(1);  
            }
            //3month
            else if (storeDTO.PlanName.ToLower() == "quarterly")  //  quarterly plan 3 month
            {
                endDate = startDate.AddMonths(3);  
            }
            //year
            else if (storeDTO.PlanName.ToLower() == "yearly")
            {
                endDate = startDate.AddYears(1); 
            }

            else
            {
                return BadRequest("Invalid plan type. Must be 'monthly', 'quarterly', or 'yearly'.");
            }

            var uploadedFolder = Path.Combine(Directory.GetCurrentDirectory(), "StoreImages");
            if (!Directory.Exists(uploadedFolder))
            {
                Directory.CreateDirectory(uploadedFolder);
            }

            string storeLogoPath = null;
            string backgroundImagePath = null;

            if (storeDTO.StoreLogo != null)
            {
                var fileLogo = Path.Combine(uploadedFolder, storeDTO.StoreLogo.FileName);
                using (var stream = new FileStream(fileLogo, FileMode.Create))
                {
                    storeDTO.StoreLogo.CopyTo(stream);
                }

                storeLogoPath = storeDTO.StoreLogo.FileName;
            }

            if (storeDTO.BackgroundImage != null)
            {
                var fileBgImage = Path.Combine(uploadedFolder, storeDTO.BackgroundImage.FileName);
                using (var stream = new FileStream(fileBgImage, FileMode.Create))
                {
                    storeDTO.BackgroundImage.CopyTo(stream);
                }

                backgroundImagePath = storeDTO.BackgroundImage.FileName;
            }

            var store = new Store
            {
                StoreName = storeDTO.StoreName,
                StoreDescription = storeDTO.StoreDescription,
                StoreLogo = storeLogoPath,              
                BackgroundImage = backgroundImagePath,  
                Address = storeDTO.Address,
                City = storeDTO.City,
                ZipCode = storeDTO.ZipCode,
                Country = storeDTO.Country,
                PhoneNumber = storeDTO.PhoneNumber,
                Status = "active",                      
                PlanName = storeDTO.PlanName,
                PlanType = storeDTO.PlanType,
                StartDate = startDate,                
                EndDate = endDate,
                Amount=storeDTO.Amount
            };

            _context.Stores.Add(store);
            _context.SaveChanges();

            return Ok(new { message = "Store created successfully", storeId = store.StoreId });
        }



        //----------------------------------------------------------------------------------------------------------------------------------
        //----------------------------------------------------------------------------------------------------------------------------------


        // Return only stores with "active" status (Admin dashboard , User side)
        [HttpGet("active")]
        public IActionResult GetActiveStores()
        {
            UpdateStoreStatuses();

            var activeStores = _context.Stores.Where(s => s.Status == "active").ToList();
            return Ok(activeStores);
        }

        //----------------------------------------------------------------------------------------------------------------------------------
        //----------------------------------------------------------------------------------------------------------------------------------


        // Return only stores with "inactive" status (Admin dashboard)
        [HttpGet("inactive")]
        public IActionResult GetInactiveStores()
        {
            UpdateStoreStatuses();

            var inactiveStores = _context.Stores.Where(s => s.Status == "inactive").ToList();
            return Ok(inactiveStores);
        }


        //----------------------------------------------------------------------------------------------------------------------------------
        //----------------------------------------------------------------------------------------------------------------------------------




        [HttpPut("UpdateSubscription/{storeId}")]
        public IActionResult UpdateSubscription(int storeId, [FromBody] UpdateSubscriptionDTO updateDto)
        {
            var store = _context.Stores.FirstOrDefault(s => s.StoreId == storeId);
            if (store == null)
            {
                return NotFound(new { message = "Store not found" });
            }

            DateTime newStartDate = DateTime.Now;

            DateTime newEndDate;
            if (updateDto.PlanName.ToLower() == "monthly")
            {
                newEndDate = newStartDate.AddMonths(1);  
            }
            else if (updateDto.PlanName.ToLower() == "yearly")
            {
                newEndDate = newStartDate.AddYears(1);  
            }
            else
            {
                return BadRequest("Invalid plan type. Must be 'monthly' or 'yearly'.");
            }

            store.PlanName = updateDto.PlanName;
            store.PlanType = updateDto.PlanType;
            store.Amount = updateDto.Amount;
            store.StartDate = newStartDate;  
            store.EndDate = newEndDate;      

            _context.SaveChanges();

            return Ok(new { message = "Subscription updated successfully", store });
        }
        //----------------------------------------------------------------------------------------------------------------------------------
        //----------------------------------------------------------------------------------------------------------------------------------

        //last 3 store (home page ) TOP SELLING (Store Most Orders)

        [HttpGet("top-stores")]
        public IActionResult GetTopStores(int top = 3)
        {
            var topStores = _context.Stores
                                    .Include(s => s.Orders)  
                                    .OrderByDescending(s => s.Orders.Count).Where(s => s.Status == "active")  
                                    .Take(top)  
                                    .ToList();

            return Ok(topStores);
        }
    }
}
