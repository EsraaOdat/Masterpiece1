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

            if (data == null || !data.Any())
            {
                return NotFound(); 
            }

            return Ok(data); 
        }

    }
}
