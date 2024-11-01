using E_Commerce.dto;
using E_Commerce.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
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

        // Method to check for expired subscriptions and update store status
        private void UpdateStoreStatuses()
        {
            // Find all stores where the end date has passed and are still marked as active
            var expiredStores = _context.Stores
                                        .Where(s => s.EndDate < DateTime.Now && s.Status == "active")
                                        .ToList();

            foreach (var store in expiredStores)
            {
                // Mark the store as inactive
                store.Status = "inactive";
            }

            // Save changes to the database
            _context.SaveChanges();
        }

        // Return all stores
        [HttpGet]
        public IActionResult GetAllStores()
        {
            // Automatically update store statuses based on the end date before fetching all stores
            UpdateStoreStatuses();

            var data = _context.Stores.ToList();
            return Ok(data);
        }

        // Return store by ID
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

        // Create Store
        [HttpPost]
        public IActionResult CreateStore([FromForm] StoreDTO storeDTO)
        {
            // Automatically set the start date to the current date
            DateTime startDate = DateTime.Now;

            // Calculate the subscription end date based on the plan type
            DateTime endDate;
            if (storeDTO.PlanName.ToLower() == "monthly")
            {
                endDate = startDate.AddMonths(1);  // Monthly subscription
            }
            else if (storeDTO.PlanName.ToLower() == "yearly")
            {
                endDate = startDate.AddYears(1);  // Yearly subscription
            }
            else
            {
                return BadRequest("Invalid plan type. Must be 'monthly' or 'yearly'.");
            }

            // Ensure the "StoreImages" directory exists
            var uploadedFolder = Path.Combine(Directory.GetCurrentDirectory(), "StoreImages");
            if (!Directory.Exists(uploadedFolder))
            {
                Directory.CreateDirectory(uploadedFolder);
            }

            string storeLogoPath = null;
            string backgroundImagePath = null;

            // Save the uploaded logo image file if provided
            if (storeDTO.StoreLogo != null)
            {
                var fileLogo = Path.Combine(uploadedFolder, storeDTO.StoreLogo.FileName);
                using (var stream = new FileStream(fileLogo, FileMode.Create))
                {
                    storeDTO.StoreLogo.CopyTo(stream);
                }

                // Update the logo image path
                storeLogoPath = storeDTO.StoreLogo.FileName;
            }

            // Save the uploaded background image file if provided
            if (storeDTO.BackgroundImage != null)
            {
                var fileBgImage = Path.Combine(uploadedFolder, storeDTO.BackgroundImage.FileName);
                using (var stream = new FileStream(fileBgImage, FileMode.Create))
                {
                    storeDTO.BackgroundImage.CopyTo(stream);
                }

                // Update the background image path
                backgroundImagePath = storeDTO.BackgroundImage.FileName;
            }

            // Create a new store with all subscription-related details
            var store = new Store
            {
                StoreName = storeDTO.StoreName,
                StoreDescription = storeDTO.StoreDescription,
                StoreLogo = storeLogoPath,              // Assign logo image path
                BackgroundImage = backgroundImagePath,  // Assign background image path
                Address = storeDTO.Address,
                City = storeDTO.City,
                ZipCode = storeDTO.ZipCode,
                Country = storeDTO.Country,
                PhoneNumber = storeDTO.PhoneNumber,
                Status = "active",                      // Store is active upon creation
                PlanName = storeDTO.PlanName,
                PlanType = storeDTO.PlanType,
                StartDate = startDate,                  // Set start date automatically
                EndDate = endDate                       // Store the calculated subscription end date
            };

            _context.Stores.Add(store);
            _context.SaveChanges();

            return Ok(new { message = "Store created successfully", storeId = store.StoreId });
        }



















        // Return only stores with "active" status
        [HttpGet("active")]
        public IActionResult GetActiveStores()
        {
            // Automatically update store statuses before fetching active stores
            UpdateStoreStatuses();

            var activeStores = _context.Stores.Where(s => s.Status == "active").ToList();
            return Ok(activeStores);
        }








        [HttpPut("UpdateSubscription/{storeId}")]
        public IActionResult UpdateSubscription(int storeId, [FromBody] UpdateSubscriptionDTO updateDto)
        {
            // Find the existing store by ID
            var store = _context.Stores.FirstOrDefault(s => s.StoreId == storeId);
            if (store == null)
            {
                return NotFound(new { message = "Store not found" });
            }

            // Set the new start date to the current date and time
            DateTime newStartDate = DateTime.Now;

            // Validate the plan type and calculate the new end date
            DateTime newEndDate;
            if (updateDto.PlanName.ToLower() == "monthly")
            {
                newEndDate = newStartDate.AddMonths(1);  // Monthly subscription
            }
            else if (updateDto.PlanName.ToLower() == "yearly")
            {
                newEndDate = newStartDate.AddYears(1);   // Yearly subscription
            }
            else
            {
                return BadRequest("Invalid plan type. Must be 'monthly' or 'yearly'.");
            }

            // Update the subscription details
            store.PlanName = updateDto.PlanName;
            store.PlanType = updateDto.PlanType;
            store.Amount = updateDto.Amount;
            store.StartDate = newStartDate;  // Update the start date to the current date and time
            store.EndDate = newEndDate;      // Set the new calculated end date

            // Save changes to the database
            _context.SaveChanges();

            return Ok(new { message = "Subscription updated successfully", store });
        }

        //last 3 store (home page )

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
