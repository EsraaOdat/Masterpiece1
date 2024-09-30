using E_Commerce.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace E_Commerce.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductImagesController : ControllerBase
    {
        private readonly MyDbContext _db;

        public ProductImagesController(MyDbContext db)
        {
            _db = db;
        }



        [HttpGet]
        [Route("ProductImages")]
        public IActionResult GetProductImages()
        {
            var data = _db.ProductImages.ToList();
          
            return Ok(data);
        }


        [HttpGet]
        [Route("ProductImages/{productId}")]
        public IActionResult GetProductImages(int productId)
        {
            var data = _db.ProductImages
                           .Where(img => img.ProductId == productId) 
                           .ToList();

            // Check if any images were found
            if (data == null || !data.Any())
            {
                return NotFound(); // Return 404 if no images found
            }

            return Ok(data); // Return the list of images
        }

    }
}
