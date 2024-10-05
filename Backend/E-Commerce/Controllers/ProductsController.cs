using E_Commerce.dto;
using E_Commerce.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using PayPal.Api;


namespace E_Commerce.Controllers
{
    [Route("api/[controller]")]
    [ApiController]

    public class ProductsController : ControllerBase
    {
        private readonly MyDbContext _db;

        public ProductsController(MyDbContext db)
        {
            _db = db;
        }

        // Get all products for admin dashboard
        [HttpGet("AllProducts")]
        public IActionResult GetAllProducts()
        {
            var data = _db.Products
                          .Include(p => p.CartItems)
                          .Include(p => p.Comments)
                          .Include(p => p.Comment1s)
                          .Include(p => p.ProductDiscounts)
                          .Include(p => p.ProductImages)
                          .Include(p => p.Variants)
                          .Include(p => p.Colors)
                          .Include(p => p.Sizes)
                          .Include(p => p.Tags)
                          .OrderByDescending(p => p.ProductId)
                          .ToList();

            return Ok(data);
        }





        //لازم برضو البرودكت يلي محلات فيهم active

        [HttpGet("Products")]
        public IActionResult GetProducts()
        {
            var data = _db.Products
                .Where(p => _db.Stores
                    .Any(s => s.StoreId == p.StoreId && s.Status == "active"))
                .OrderByDescending(p => p.ProductId)
                          .ToList();
            return Ok(data);
        }


        // Get all products for admin dashboard
        /*  [HttpGet("Products")]
          public IActionResult GetProducts()
          {
              var products = _db.Products.Where(x => x.CategoryId == categoryId).ToList();
              return Ok(products);
          }

  */
        /*
                [HttpPost("CreateProduct")]
                public async Task<IActionResult> CreateProduct([FromBody] ProductRequestDTO productDto)
                {
                    if (productDto == null)
                    {
                        return BadRequest("Product data is required.");
                    }

                    // Create a new product instance
                    var newProduct = new Product
                    {
                        Name = productDto.Name,
                        Description = productDto.Description,
                        Price = productDto.Price,
                        Quantity = productDto.Quantity,
                        CreatedAt = DateTime.UtcNow
                    };

                    // Add the new product to the database
                    _db.Products.Add(newProduct);
                    await _db.SaveChangesAsync();

                    // Add product images
                    foreach (var image in productDto.ProductImages)
                    {
                        var productImage = new ProductImage
                        {
                            ProductId = newProduct.ProductId,
                            ImagePath = image
                        };
                        _db.ProductImages.Add(productImage);
                    }

                    // Add colors
                    foreach (var colorId in productDto.ColorIds)
                    {
                        var productColor = new ProductColor
                        {
                            ProductId = newProduct.ProductId,
                            ColorId = colorId
                        };
                        _db.ProductColors.Add(productColor);
                    }

                    // Add sizes
                    foreach (var sizeId in productDto.SizeIds)
                    {
                        var productSize = new ProductSize
                        {
                            ProductId = newProduct.ProductId,
                            SizeId = sizeId
                        };
                        _db.ProductSizes.Add(productSize);
                    }

                    // Add tags
                    foreach (var tagId in productDto.TagIds)
                    {
                        var productTag = new ProductTag
                        {
                            ProductId = newProduct.ProductId,
                            TagId = tagId
                        };
                        _db.ProductTags.Add(productTag);
                    }

                    // Save all changes in one go
                    await _db.SaveChangesAsync();

                    return CreatedAtAction(nameof(CreateProduct), new { id = newProduct.ProductId }, newProduct);
                }







        */



        // Get Last8 INDEX products
        [HttpGet("GetLast8Products")]
        public IActionResult GetLast8Products()
        {

            var lastEightProducts = _db.Products
          .Where(p => _db.Stores.Any(s => s.StoreId == p.StoreId && s.Status == "active"))
          .OrderByDescending(p => p.CreatedAt) // Order by creation date (or ID, depending on your logic)
          .Take(8) // Take the last 8 products
          .ToList();

            return Ok(lastEightProducts);


        }

        // Get products by category ID
        [HttpGet("ProductsByCategoryId/{SubcategoryId}")]
        public IActionResult GetProductsByCategoryId(int SubcategoryId)
        {
            var products = _db.Products.Where(x => x.SubcategoryId == SubcategoryId).ToList();
            return Ok(products);
        }

        // Get a single product by ID
        [HttpGet("Product/{id}")]
        public IActionResult GetProductById(int id)
        {
            var data = _db.Products
                          .Include(p => p.CartItems)
                          .Include(p => p.Comment1s)
                          .Include(p => p.Comments)
                          .Include(p => p.OrderItems)
                          .Include(p => p.ProductDiscounts)
                          .Include(p => p.ProductImages)
                          .Include(p => p.Variants).ThenInclude(s => s.Tag)
                          .Include(p => p.Store)
                          .Include(p => p.Wishlists)
                          .Include(p => p.Colors)
                          .Include(p => p.Sizes)
                          .Include(p => p.Tags)
                          .Include(p => p.Subcategory).ThenInclude(s => s.Category)
                          .FirstOrDefault(p => p.ProductId == id);
            if (data == null)
            {
                return NotFound();
            }

            return Ok(data);
        }





        /*
                        ----------------------------------------------------------------------------------------------------
                        ----------------------------------------------------------------------------------------------------

                *//*
                        [HttpPost]
                [Route("AddProduct")]
                public IActionResult CreateProduct([FromForm] ProductRequestDTO productDto)
                {
                    // Ensure the "Product" directory exists
                    var uploadedFolder = Path.Combine(Directory.GetCurrentDirectory(), "Product");
                    if (!Directory.Exists(uploadedFolder))
                    {
                        Directory.CreateDirectory(uploadedFolder);
                    }

                    // Save the uploaded image file
                    var fileImage = Path.Combine(uploadedFolder, productDto.Image.FileName);
                    using (var stream = new FileStream(fileImage, FileMode.Create))
                    {
                        productDto.Image.CopyTo(stream);
                    }

                    // Prepare the data to be saved in the database as a new Product
                    var product = new Product
                    {
                        ProductName = productDto.ProductName,
                        Description = productDto.Description,
                        Price = productDto.Price,
                        CategoryId = productDto.CategoryId,
                        Image = productDto.Image.FileName
                    };

                    // Add the product to the database and save changes
                    _db.Products.Add(product);
                    _db.SaveChanges();

                    // Return a success response
                    return Ok(new { message = "Product added successfully", product });
                }



                        ----------------------------------------------------------------------------------------------------
                ----------------------------------------------------------------------------------------------------
        */


        /* [HttpPut("UpdateProduct/{id}")]
        public IActionResult UpdateProduct(int id, [FromForm] ProductRequestDTO Product)
        {
            // Find the existing product by ID
            var existingProduct = _db.Products.FirstOrDefault(p => p.ProductId == id);
            if (existingProduct == null)
            {
                return NotFound(new { message = "Product not found" });
            }

            // Validate the incoming model
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            // Ensure the "Product" directory exists
            var uploadedFolder = Path.Combine(Directory.GetCurrentDirectory(), "Product");
            if (!Directory.Exists(uploadedFolder))
            {
                Directory.CreateDirectory(uploadedFolder);
            }

            // Save the uploaded image file if provided
            if (Product.Image != null)
            {
                var fileImage = Path.Combine(uploadedFolder, Product.Image.FileName);
                using (var stream = new FileStream(fileImage, FileMode.Create))
                {
                    Product.Image.CopyTo(stream);
                }

                // Update the image path
                existingProduct.Image = Product.Image.FileName;
            }

            // Update the existing product's properties with the new values
            existingProduct.Name = Product.ProductName;
            existingProduct.Description = Product.Description;
            existingProduct.Price = Product.Price;

            // Save changes to the database
            _db.Products.Update(existingProduct);
            _db.SaveChanges();

            // Return a success response with the updated product
            return Ok(new { message = "Product updated successfully", product = existingProduct });
        }*/

        /*
                        ----------------------------------------------------------------------------------------------------
                        ----------------------------------------------------------------------------------------------------

        */


        [HttpGet("ProductsByStore/{storeId}")]
        public IActionResult GetProductsByStore(int storeId)
        {
            // Optionally, check if the store exists and is active
            var store = _db.Stores.FirstOrDefault(s => s.StoreId == storeId && s.Status == "active");

            if (store == null)
            {
                return NotFound(new { message = "Store not found or inactive" });
            }
            // Fetch products by storeId and order by ProductId descending
            var products = _db.Products
                              .Where(p => p.StoreId == storeId)
                              .OrderByDescending(p => p.ProductId)
                              .ToList();

            return Ok(products);

        }





        /*
                // POST: api/products
                [HttpPost]
                public async Task<ActionResult> PostProduct([FromForm] AddProductDto productDto)
                {
                    // 1. Save the main product image
                    var productImagePath = await SaveImage(productDto.ProductImage, "products");

                    // 2. Create the product entity
                    var product = new E_Commerce.Models.Product
                    {
                        Name = productDto.Name,
                        Description = productDto.Description,
                        Price = productDto.Price,
                        Quantity = productDto.Quantity,
                        Image = productImagePath, // Save the main product image path
                        CreatedAt = DateTime.Now
                    };

                    // Save the product to the database
                    _db.Products.Add(product);
                    await _db.SaveChangesAsync();

                    // 3. Handle colors and their images
                    foreach (var colorDto in productDto.Colors)
                    {
                        // Save the color image
                        var colorImagePath = await SaveImage(colorDto.ColorImage, "colors");

                        // Create and save the color-product relationship with its image
                        var productColorImage = new E_Commerce.Models.ProductImage
                        {
                            ProductId = product.ProductId,
                            ColorId = colorDto.ColorID,
                            ImagePath = colorImagePath
                        };

                        _db.ProductColorImages.Add(ProductImage);
                    }

                    // Save changes to the database for the colors
                    await _db.SaveChangesAsync();

                    // 4. Handle sizes
                    foreach (var sizeId in productDto.Sizes)
                    {
                        var productColorSize = new E_Commerce.Models.ProductColorSize
                        {
                            ProductId = product.ProductId,
                            SizeId = sizeId,
                            Stock = productDto.Quantity // You can customize the stock logic here
                        };

                        _db.ProductColorSizes.Add(productColorSize);
                    }

                    // Save changes to the database for the sizes
                    await _db.SaveChangesAsync();

                    return CreatedAtAction(nameof(GetProduct), new { id = product.ProductId }, product);
                }

                // Helper method to save the images to the file system
                private async Task<string> SaveImage(IFormFile imageFile, string folder)
                {
                    if (imageFile == null || imageFile.Length == 0)
                        return null;

                    var uploadPath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", folder);
                    Directory.CreateDirectory(uploadPath);

                    var fileName = $"{Guid.NewGuid()}_{Path.GetFileName(imageFile.FileName)}";
                    var filePath = Path.Combine(uploadPath, fileName);

                    using (var stream = new FileStream(filePath, FileMode.Create))
                    {
                        await imageFile.CopyToAsync(stream);
                    }

                    return $"/{folder}/{fileName}";
                }

                // For demonstration purposes, a simple GetProduct method
                [HttpGet("{id}")]
                public async Task<ActionResult<E_Commerce.Models.Product>> GetProduct(int id)
                {
                    var product = await _db.Products
                        .Include(p => p.ProductColorImages)
                        .Include(p => p.ProductColorSizes)
                        .FirstOrDefaultAsync(p => p.ProductId == id);

                    if (product == null)
                    {
                        return NotFound();
                    }

                    return Ok(product);
                }
        */

















        /* // POST: api/sort
         [HttpPost]
         public IActionResult SortWords([FromForm] int[] words)
         {
             if (words == null || words.Length == 0)
             {
                 return BadRequest("Please provide a valid array of words.");
             }

             // Sort the array by word length
             //  Array.Sort(words, (w1, w2) => w1.Length.CompareTo(w2.Length));
             int i, j, tep;
             for (i = 0; i < words.Length; i++)
             {
                 for (j = i + 1; j < words.Length; j++)
                 {
                     if (words[i] > words[j])
                     {
                         tep = words[j];
                         words[j] = words[i];
                         words[i] = tep;



                     }

                 }




             }


                 // Return the sorted array
                 return Ok(words);

         }*/



        [HttpPost]
        public IActionResult CountNumbers([FromBody] int[] numbers)
        {
            if (numbers == null || numbers.Length == 0)
            {
                return BadRequest("Please provide a valid array of numbers.");
            }

            var countResult = numbers.GroupBy(n => n)
                                      .ToDictionary(g => g.Key, g => g.Count());

            return Ok(countResult);
        }























        [HttpPost]
        [Route("CreateProductWithImages")]
        public async Task<IActionResult> CreateProductWithImages([FromForm] ProductRequestDTO productDto)
        {
            if (productDto == null)
            {
                return BadRequest("Invalid product data.");
            }

            var uploadedFolder = Path.Combine(Directory.GetCurrentDirectory(), "Product");
            if (!Directory.Exists(uploadedFolder))
            {
                Directory.CreateDirectory(uploadedFolder);
            }

            var mainImagePath = Path.Combine(uploadedFolder, productDto.Image.FileName);
            using (var stream = new FileStream(mainImagePath, FileMode.Create))
            {
                await productDto.Image.CopyToAsync(stream);
            }

            var newProduct = new Product
            {
                Name = productDto.Name,
                Description = productDto.Description,
                Price = productDto.Price,
                Quantity = productDto.Quantity,
                CreatedAt = DateTime.UtcNow,
                StoreId = productDto.StoreId,
                SubcategoryId = productDto.SubcategoryId,
                Image = productDto.Image.FileName
            };

            _db.Products.Add(newProduct);
            await _db.SaveChangesAsync();

            foreach (var image in productDto.AdditionalImages)
            {
                var additionalImagePath = Path.Combine(uploadedFolder, image.FileName);

                using (var stream = new FileStream(additionalImagePath, FileMode.Create))
                {
                    await image.CopyToAsync(stream);
                }

                var productImage = new ProductImage
                {
                    ProductId = newProduct.ProductId,
                    ImagePath = image.FileName
                };

                _db.ProductImages.Add(productImage);
            }




            await _db.SaveChangesAsync();  // Save all changes to the database

            return Ok(new { message = "Product and images added successfully." });
        }










        // Delete a product by ID

        [HttpDelete("Delete/{id}")]
        public IActionResult Delete(int id)
        {
            var data = _db.Products.Find(id);
            if (data == null)
            {
                return NotFound();
            }
            _db.Products.Remove(data);
            _db.SaveChanges();
            return Ok(data);
        }
    }
}