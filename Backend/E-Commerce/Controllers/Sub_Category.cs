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
        [Route("AllCategories")]
        public IActionResult GetAllCategories()
        {
            var data = _db.Categories.ToList();
            return Ok(data);
        }



        [HttpPost]
        [Route("AddSubCategory")]
        public IActionResult AddSubCategory([FromForm] SubCategoryRequestDTO subCategoryDto)
        {
            var subCategory = new SubCategory // Assuming you have a SubCategory model
            {
                CategoryId = subCategoryDto.CategoryId,
                SubcategoryName = subCategoryDto.SubcategoryName
            };

            _db.SubCategories.Add(subCategory);
            _db.SaveChanges();

            return Ok(new { message = "Subcategory added successfully", subCategory });
        }

    }
}
