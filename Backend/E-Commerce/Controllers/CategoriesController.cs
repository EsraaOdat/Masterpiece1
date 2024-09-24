using E_Commerce.dto;
using E_Commerce.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace E_Commerce.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CategoriesController : ControllerBase
    {
        private readonly MyDbContext _db;

        public CategoriesController(MyDbContext db)
        {
            _db = db;
        }

        [HttpGet]
        [Route("AllCategories")]
        public IActionResult GetAllCategories()
        {
            var categories = _db.Categories
                .Select(category => new
                {
                    categoryId = category.CategoryId,
                    name = category.Name,
                    image = category.Image, // Ensure this property exists in your model
                    description = category.Description, // Ensure this property exists
                    subCategories = _db.SubCategories
                        .Where(sub => sub.CategoryId == category.CategoryId)
                        .Select(sub => new
                        {
                            sub.CategoryId,
                            sub.SubcategoryName
                        }).ToList()
                }).ToList();

            return Ok(categories);
        }

        //--------------------------------------------------------------------------------------------------------------------
        //--------------------------------------------------------------------------------------------------------------------




        [HttpGet]
        [Route("Category/{name}")]
        public IActionResult GetCategoryByName(string name)
        {
            var data = _db.Categories.FirstOrDefault(c => c.Name == name);
            if (data == null)
            {
                return NotFound(new { message = "Category not found" });
            }
            return Ok(data);
        }

        //--------------------------------------------------------------------------------------------------------------------
        //--------------------------------------------------------------------------------------------------------------------



        // AddCategory

        /*      [HttpPost("AddProduct")]
              public async Task<IActionResult> AddProduct([FromForm] ProductDto productDto)
              {
                  if (productDto == null)
                  {
                      return BadRequest("Product data is required.");
                  }

                  // Validate required fields
                  if (string.IsNullOrWhiteSpace(productDto.Name) ||
                      productDto.Price <= 0 ||
                      productDto.StoreId <= 0 ||
                      productDto.SubcategoryId <= 0 ||
                      productDto.Quantity < 0 ||
                      productDto.Image == null)
                  {
                      return BadRequest("Invalid product data.");
                  }

                  // Prepare folder for uploads
                  var uploadedFolder = Path.Combine(Directory.GetCurrentDirectory(), "Uploads");
                  if (!Directory.Exists(uploadedFolder))
                  {
                      Directory.CreateDirectory(uploadedFolder);
                  }

                  // Generate a unique file name to prevent overwriting
                  var uniqueFileName = Guid.NewGuid().ToString() + Path.GetExtension(productDto.Image.FileName);
                  var fileImage = Path.Combine(uploadedFolder, uniqueFileName);

                  // Save the uploaded file
                  using (var stream = new FileStream(fileImage, FileMode.Create))
                  {
                      await productDto.Image.CopyToAsync(stream);
                  }

                  // Create a new product object
                  var newProduct = new Product
                  {
                      Name = productDto.Name,
                      Description = productDto.Description,
                      Price = productDto.Price,
                      StoreId = productDto.StoreId,
                      SubcategoryId = productDto.SubcategoryId,
                      Quantity = productDto.Quantity,
                      Image = uniqueFileName, // Store the unique file name in the database
                      CreatedAt = DateTime.UtcNow // Set creation date
                  };

                  // Add product to the database
                  _db.Products.Add(newProduct);
                  await _db.SaveChangesAsync(); // Use async save to improve performance

                  return Ok(newProduct);
              }*/


        /*        --------------------------------------------------------------------------------------
*/

        [HttpPost]
        [Route("AddCategory")]
        public IActionResult AddCategory([FromForm] categoryRequestDTO categoryDto)
        {
            
            var uploadedFolder = Path.Combine(Directory.GetCurrentDirectory(), "Categories");
            if (!Directory.Exists(uploadedFolder))
            {
                Directory.CreateDirectory(uploadedFolder);
            }
            var fileImage = Path.Combine(uploadedFolder, categoryDto.Image.FileName);
            using (var stream = new FileStream(fileImage, FileMode.Create))
            {
                categoryDto.Image.CopyToAsync(stream);

            }

            var dataResponse = new Category
            {
                Image = categoryDto.Image.FileName,
                Name = categoryDto.Name,
                Description=categoryDto.Description
     
                
            };

            _db.Categories.Add(dataResponse);
            _db.SaveChanges();

            return Ok(new { message = "Category added successfully", dataResponse });
        }
        /*        ----------------------------------------------------------------------------------------------------
*/


        /* [HttpDelete]
         [Route("{id:int}")]
         public IActionResult DeleteCategory(int id)
         {
             var data = _db.Categories.Find(id);
             if (data == null)
             {
                 return NotFound(new { message = "Category not found" });
             }
             _db.Products.RemoveRange(data.Products);
             _db.Categories.Remove(data);
             _db.SaveChanges();
             return Ok(new { message = "Category deleted", category = data });
         }*/
    }
}
