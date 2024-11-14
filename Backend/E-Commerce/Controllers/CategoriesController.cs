using E_Commerce.dto;
using E_Commerce.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

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
                .Include(c => c.SubCategories) // Include subcategories in the query
                .Select(category => new
                {
                    categoryId = category.CategoryId,
                    name = category.Name,
                    image = category.Image, // Ensure this property exists in your model
                    description = category.Description, // Ensure this property exists in your model
                    subCategories = category.SubCategories // Directly access the related subcategories
                        .Select(sub => new
                        {
                            subCategoryId = sub.SubcategoryId,
                            subcategoryName = sub.SubcategoryName
                        }).ToList()
                }).ToList();

            return Ok(categories);
        }









        [HttpGet]
        [Route("Categories")]
        public IActionResult Categories()
        {
            var data = _db.Categories.ToList();
            return Ok(data);
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

        /*[HttpPost]
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
        }*/
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
                categoryDto.Image.CopyTo(stream);
            }

            // إنشاء الـ Category
            var category = new Category
            {
                Image = categoryDto.Image.FileName,
                Name = categoryDto.Name,
                Description = categoryDto.Description,
                CreatedAt = DateOnly.FromDateTime(DateTime.Now)
            };

            _db.Categories.Add(category);
            _db.SaveChanges();

            if (categoryDto.Subcategories != null && categoryDto.Subcategories.Count > 0)
            {
                foreach (var subcategoryName in categoryDto.Subcategories)
                {
                    var subcategory = new SubCategory
                    {
                        SubcategoryName = subcategoryName,
                        CategoryId = category.CategoryId 
                    };

                    _db.SubCategories.Add(subcategory);
                }

                _db.SaveChanges();
            }

            return Ok(new { message = "Category and subcategories added successfully", category });
        }









        [HttpPut]
        [Route("UpdateCategory/{id}")]
        public IActionResult UpdateCategory(int id, [FromForm] categoryRequestDTO categoryDto)
        {
            // Retrieve the existing category from the database
            var category = _db.Categories.FirstOrDefault(c => c.CategoryId == id);
            if (category == null)
            {
                return NotFound(new { message = "Category not found" });
            }

            // Update the category's properties
            category.Name = categoryDto.Name;
            category.Description = categoryDto.Description;

            // Check if there's a new image and update it
            if (categoryDto.Image != null)
            {
                var uploadedFolder = Path.Combine(Directory.GetCurrentDirectory(), "Categories");
                if (!Directory.Exists(uploadedFolder))
                {
                    Directory.CreateDirectory(uploadedFolder);
                }

                var fileImage = Path.Combine(uploadedFolder, categoryDto.Image.FileName);
                using (var stream = new FileStream(fileImage, FileMode.Create))
                {
                    categoryDto.Image.CopyTo(stream);
                }

                category.Image = categoryDto.Image.FileName; // Update the image
            }

            // Save the updated category
            _db.Categories.Update(category);
            _db.SaveChanges();

            // Manage subcategories (add, update, or remove)

            // Get existing subcategories for the category
            var existingSubcategories = _db.SubCategories.Where(sc => sc.CategoryId == category.CategoryId).ToList();

            // If new subcategories are provided, update or add them
            if (categoryDto.Subcategories != null && categoryDto.Subcategories.Count > 0)
            {
                // Remove subcategories that are not in the updated list
                var subcategoriesToRemove = existingSubcategories
                    .Where(sc => !categoryDto.Subcategories.Contains(sc.SubcategoryName))
                    .ToList();

                foreach (var subcategoryToRemove in subcategoriesToRemove)
                {
                    _db.SubCategories.Remove(subcategoryToRemove);
                }

                // Add or update subcategories
                foreach (var subcategoryName in categoryDto.Subcategories)
                {
                    var existingSubcategory = existingSubcategories
                        .FirstOrDefault(sc => sc.SubcategoryName == subcategoryName);

                    if (existingSubcategory == null)
                    {
                        // If the subcategory doesn't exist, add it
                        var newSubcategory = new SubCategory
                        {
                            SubcategoryName = subcategoryName,
                            CategoryId = category.CategoryId
                        };
                        _db.SubCategories.Add(newSubcategory);
                    }
                }

                // Save changes for subcategories
                _db.SaveChanges();
            }

            return Ok(new { message = "Category and subcategories updated successfully", category });
        }






        /*


                [HttpPost]
                [Route("EditCategory")]
                public IActionResult EditCategory([FromForm] CategoryEditRequestDTO categoryDto)
                {

                    // Find the category by ID
                    var category = _db.Categories
                        .Include(c => c.SubCategories)
                        .FirstOrDefault(c => c.CategoryId == categoryDto.CategoryId);

                    if (category == null)
                    {
                        return NotFound(new { message = "Category not found." });
                    }

                    // Update category details
                    category.Name = categoryDto.Name;
                    category.Description = categoryDto.Description;

                    // Handle image update if provided
                    if (categoryDto.Image != null)
                    {
                        var uploadedFolder = Path.Combine(Directory.GetCurrentDirectory(), "Categories");
                        if (!Directory.Exists(uploadedFolder))
                        {
                            Directory.CreateDirectory(uploadedFolder);
                        }
                        var fileImage = Path.Combine(uploadedFolder, categoryDto.Image.FileName);
                        using (var stream = new FileStream(fileImage, FileMode.Create))
                        {
                            categoryDto.Image.CopyTo(stream);
                        }
                        category.Image = categoryDto.Image.FileName;
                    }

                    // Handle subcategories
                    if (categoryDto.Subcategories != null)
                    {
                        // Clear existing subcategories and add new ones
                        _db.SubCategories.RemoveRange(category.SubCategories);

                        foreach (var subDto in categoryDto.Subcategories)
                        {
                            var subcategory = new SubCategory
                            {
                                SubcategoryName = subDto.SubcategoryName,
                                CategoryId = category.CategoryId // Link subcategory to the category
                            };
                            category.SubCategories.Add(subcategory);
                        }
                    }

                    _db.SaveChanges();

                    return Ok(new { message = "Category and subcategories updated successfully", category });
                }




        */


        [HttpGet]
        [Route("GetCategoryById/{categoryId}")]
        public IActionResult GetCategoryById(int categoryId)
        {
            var category = _db.Categories
                .Include(c => c.SubCategories)
                .FirstOrDefault(c => c.CategoryId == categoryId);

            if (category == null)
            {
                return NotFound(new { message = "Category not found." });
            }

            var result = new
            {
                categoryId = category.CategoryId,
                name = category.Name,
                description = category.Description,
                image = category.Image,
                subCategories = category.SubCategories.Select(sub => new
                {
                    subCategoryId = sub.SubcategoryId,
                    subcategoryName = sub.SubcategoryName
                }).ToList()
            };

            return Ok(result);
        }







        [HttpGet]
        [Route("CategoriesWithSubcategories")]
        public IActionResult GetCategoriesWithSubcategories()
        {
            var categories = _db.Categories
                .Include(c => c.SubCategories)
                .Select(category => new
                {
                    categoryId = category.CategoryId,
                    name = category.Name,
                    image = category.Image,
                    description = category.Description,
                    subCategories = category.SubCategories.Select(sub => new
                    {
                        subCategoryId = sub.SubcategoryId,
                        subcategoryName = sub.SubcategoryName
                    }).ToList()
                }).ToList();

            return Ok(categories);
        }









        //-------------------------------------------------------------------------------------------------------------------------------------
        //-------------------------------------------------------------------------------------------------------------------------------------
        [HttpDelete]
        [Route("DeleteCategory/{id}")]
        public IActionResult DeleteCategory(int id)
        {
            var category = _db.Categories.Include(c => c.SubCategories)
                                         .FirstOrDefault(c => c.CategoryId == id);

            if (category == null)
            {
                return NotFound(new { message = "Category not found" });
            }

            _db.SubCategories.RemoveRange(category.SubCategories);

            _db.Categories.Remove(category);

            _db.SaveChanges();

            return Ok(new { message = "Category and related subcategories deleted successfully" });
        }

    }




}
