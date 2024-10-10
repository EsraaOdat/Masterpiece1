using E_Commerce.dto;
using E_Commerce.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace E_Commerce.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class Sub_Category : ControllerBase
    {
        private readonly MyDbContext _db;

        public Sub_Category(MyDbContext db)
        {
            _db = db;
        }

        [HttpGet]
        [Route("AllSubCategories")]
        public IActionResult GetAllSubCategories()
        {
            var data = _db.SubCategories.ToList();
            return Ok(data);
        }


        [HttpGet]
        [Route("SubCategoriesByCategory/{categoryId}")]
        public IActionResult GetSubCategoriesByCategory(int categoryId)
        {
            var data = _db.SubCategories.Where(sc => sc.CategoryId == categoryId).ToList();

            // Check if the list is empty using !data.Any()
            if (data == null || !data.Any())
            {
                return NotFound();
            }

            return Ok(data);
        }





        [HttpPost]
        [Route("AddSubCategory")]
        public IActionResult AddSubCategory([FromForm] SubCategoryRequestDTO subCategoryDto)
        {
            var subCategory = new SubCategory // Assuming you have a SubCategory model
            {
                SubcategoryId = subCategoryDto.SubCategoryId,
                SubcategoryName = subCategoryDto.SubcategoryName
            };

            _db.SubCategories.Add(subCategory);
            _db.SaveChanges();

            return Ok(new { message = "Subcategory added successfully", subCategory });
        }




        [HttpDelete]
        [Route("DeleteSubCategory/{subCategoryId}")]
        public IActionResult DeleteSubCategory(int subCategoryId)
        {
            // Find the subcategory by ID
            var subcategory = _db.SubCategories.FirstOrDefault(sub => sub.SubcategoryId == subCategoryId);

            if (subcategory == null)
            {
                return NotFound(new { message = "Subcategory not found." });
            }

            // Remove the subcategory
            _db.SubCategories.Remove(subcategory);
            _db.SaveChanges();

            return Ok(new { message = "Subcategory deleted successfully." });
        }


    }
}
