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
                                  .Where(p => p.IsDeleted == false) // Filter out deleted products

                          .Include(p => p.CartItems)
                          .Include(p => p.Comments)
                          .Include(p => p.Comment1s)
                          .Include(p => p.ProductDiscounts)
                          .Include(p => p.ProductImages)
                          .Include(p => p.Variants)
                          .Include(p => p.Colors)
                          .Include(p => p.Sizes)
                          .Include(p => p.Tags)
                          .Include(p => p.Store)
                          .OrderByDescending(p => p.ProductId)
                          .ToList();

            return Ok(data);
        }




        //----------------------------------------------------------------------------------------------------------------------------------
        //----------------------------------------------------------------------------------------------------------------------------------

        // Get all products with status pending for admin dashboard
        [HttpGet("PendingProducts")]
        public IActionResult GetPendingProducts()
        {
            var data = _db.Products
                                  .Where(p => p.Status == "pending" && p.IsDeleted == false)

                          .Include(p => p.CartItems)
                          .Include(p => p.Comments)
                          .Include(p => p.Comment1s)
                          .Include(p => p.ProductDiscounts)
                          .Include(p => p.ProductImages)
                          .Include(p => p.Variants)
                          .Include(p => p.Colors)
                          .Include(p => p.Sizes)
                          .Include(p => p.Tags)
                          .Include(p => p.Store)
                          .OrderByDescending(p => p.ProductId)
                          .ToList();

            return Ok(data);
        }


        //----------------------------------------------------------------------------------------------------------------------------------
        //----------------------------------------------------------------------------------------------------------------------------------

        // Get all products with status rejected for admin dashboard
        [HttpGet("RejectedProducts")]
        public IActionResult GetRejectedProducts()
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
                          .Include(p => p.Store)
                          .Where(p => p.Status == "rejected" && p.IsDeleted == false) // Filter for products with status "rejected"
                          .OrderByDescending(p => p.ProductId)
                          .ToList();

            return Ok(data);
        }

        //----------------------------------------------------------------------------------------------------------------------------------
        //----------------------------------------------------------------------------------------------------------------------------------


        //لازم برضو البرودكت يلي محلات فيهم active
        //shop page +admin (propuct approved)

        [HttpGet("Products")]
        public IActionResult GetProducts()
        {
            var data = _db.Products
                .Include(p => p.ProductImages)   // Include product images
                .Include(p => p.Comments)         // Include comments related to products
                .Include(p => p.Tags)             // Include tags associated with products
                .Include(p => p.Store)             // Include store information


                      //.Include(p=>p.Comments)
                      .Where(p => p.Status == "approved" && p.IsDeleted == false && _db.Stores.Any(s => s.StoreId == p.StoreId && s.Status == "active"))
        .OrderByDescending(p => p.ProductId)

                .ToList();

            return Ok(data);
        }









        //----------------------------------------------------------------------------------------------------------------------------------
        //----------------------------------------------------------------------------------------------------------------------------------
        //home page 
        [HttpGet("GetLast8Products")]
        public IActionResult GetLast8Products()
        {
            var lastEightProducts = _db.Products
                .Where(p => p.Status == "approved" // Product status must be approved
                  && p.IsDeleted == false && _db.Stores.Any(s => s.StoreId == p.StoreId && s.Status == "active")) // Store status must be active
                .OrderByDescending(p => p.CreatedAt) // Order by creation date
                .Take(8) // Take the last 8 products
                .ToList();

            return Ok(lastEightProducts);
        }


        //----------------------------------------------------------------------------------------------------------------------------------
        //----------------------------------------------------------------------------------------------------------------------------------


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
                .Include(p => p.Variants).ThenInclude(v => v.Tag)
                .Include(p => p.Store)
                .Include(p => p.Wishlists)
                .Include(p => p.Colors)
                .Include(p => p.Sizes)
                .Include(p => p.Tags)
                .Include(p => p.Subcategory).ThenInclude(s => s.Category)
                .FirstOrDefault(p => p.ProductId == id && p.IsDeleted == false &&
                                     p.Status == "approved" && // Product must be approved
                                     p.Store.Status == "active"); // Store must be active

            if (data == null)
            {
                return NotFound();
            }

            return Ok(data);
        }




        //----------------------------------------------------------------------------------------------------------------------------------
        //----------------------------------------------------------------------------------------------------------------------------------

           // this for edit product 
      [HttpGet("AllProduct/{id}")]
        public IActionResult GetAllProductById(int id)
        {
            var data = _db.Products
                .Include(p => p.CartItems)
                .Include(p => p.Comment1s)
                .Include(p => p.Comments)
                .Include(p => p.OrderItems)
                .Include(p => p.ProductDiscounts)
                .Include(p => p.ProductImages)
                .Include(p => p.Variants).ThenInclude(v => v.Tag)
                .Include(p => p.Store)
                .Include(p => p.Wishlists)
                .Include(p => p.Colors)
                .Include(p => p.Sizes)
                .Include(p => p.Tags)
                .Include(p => p.Subcategory).ThenInclude(s => s.Category)
                .FirstOrDefault(p => p.ProductId == id && p.IsDeleted == false);

            if (data == null)
            {
                return NotFound();
            }

            return Ok(data);
        }

        //----------------------------------------------------------------------------------------------------------------------------------
        //----------------------------------------------------------------------------------------------------------------------------------

        [HttpGet("ProductsByStore/{storeId}")]
        public IActionResult GetProductsByStore(int storeId)
        {
            // Check if the store exists and is active
            var store = _db.Stores.FirstOrDefault(s => s.StoreId == storeId && s.Status == "active");

            if (store == null)
            {
                return NotFound(new { message = "Store not found or inactive" });
            }

            // Fetch only approved products by storeId, ordered by ProductId descending
            var products = _db.Products
                              .Where(p => p.StoreId == storeId && p.Status == "approved" && p.IsDeleted == false) // Filter by approved status
                              .OrderByDescending(p => p.ProductId)
                              .ToList();

            return Ok(products);
        }





        //----------------------------------------------------------------------------------------------------------------------------------
        [HttpGet("Products/{storeId}")]
        public IActionResult GetProductsByStoreWithoutStatusCheck(int storeId)

        {
            var store = _db.Stores.FirstOrDefault(s => s.StoreId == storeId);

            if (store == null)
            {
                return NotFound(new { message = "Store not found or inactive" });
            }

            var products = _db.Products
                              .Where(p => p.StoreId == storeId && p.Status == "approved" && p.IsDeleted == false) // Filter by approved status
                              .OrderByDescending(p => p.ProductId)
                              .ToList();

            return Ok(products);
        }

        //----------------------------------------------------------------------------------------------------------------------------------

        //----------------------------------------------------------------------------------------------------------------------------------
        //----------------------------------------------------------------------------------------------------------------------------------
        //for store owner 
        [HttpGet("FetchAllProductsByStore/{storeId}")]
        public IActionResult FetchAllProductsByStore(int storeId)
        {
            // Check if the store exists and is active
            var store = _db.Stores.FirstOrDefault(s => s.StoreId == storeId && s.Status == "active");

            if (store == null)
            {
                return NotFound(new { message = "Store not found or inactive" });
            }

            // Fetch all products by storeId, ordered by ProductId descending
            var products = _db.Products
                              .Where(p => p.StoreId == storeId && p.IsDeleted == false) // Remove the status filter
                              .OrderByDescending(p => p.ProductId)
                              .ToList();

            return Ok(products);
        }

        //----------------------------------------------------------------------------------------------------------------------------------
        //----------------------------------------------------------------------------------------------------------------------------------
        //for store owner 


        [HttpGet("ApprovedProductsByStore/{storeId}")]
        public IActionResult GetApprovedProductsByStore(int storeId)
        {
            // Fetch approved products that belong to the specified store
            var approvedProducts = _db.Products

                                      .Where(p => p.StoreId == storeId && p.Status == "approved" && p.IsDeleted == false)
                                      .OrderByDescending(p => p.ProductId)
                                      .ToList();

            // Check if any approved products were found
            if (approvedProducts == null || !approvedProducts.Any())
            {
                return NotFound(new { message = "No approved products found for this store." });
            }

            return Ok(approvedProducts);
        }

        //----------------------------------------------------------------------------------------------------------------------------------
        //----------------------------------------------------------------------------------------------------------------------------------
        //for store owner 

        [HttpGet("RejectedProductsByStore/{storeId}")]
        public IActionResult GetRejectedProductsByStore(int storeId)
        {
            // Fetch rejected products that belong to the specified store
            var rejectedProducts = _db.Products
                                      .Where(p => p.StoreId == storeId && p.Status == "rejected" && p.IsDeleted == false)
                                      .OrderByDescending(p => p.ProductId)
                                      .ToList();

            // Check if any rejected products were found
            if (rejectedProducts == null || !rejectedProducts.Any())
            {
                return NotFound(new { message = "No rejected products found for this store." });
            }

            return Ok(rejectedProducts);
        }

        //----------------------------------------------------------------------------------------------------------------------------------
        //----------------------------------------------------------------------------------------------------------------------------------





        // Count the total number of elements in the array

       // testc not used

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






        //----------------------------------------------------------------------------------------------------------------------------------
        //----------------------------------------------------------------------------------------------------------------------------------

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
            await _db.SaveChangesAsync(); // Save the new product to get the ProductId

            // Handle additional images
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

           

          

            // Handle tags
            if (productDto.TagIds != null)
            {
                foreach (var tagId in productDto.TagIds)
                {
                    var variant = new Variant
                    {
                        ProductId = newProduct.ProductId,
                        TagId = tagId,
                        // You can also set ColorId and SizeId here as needed
                    };

                    _db.Variants.Add(variant);
                }
            }

            await _db.SaveChangesAsync();  // Save all changes to the database

            return Ok(new { message = "Product and images added successfully." });
        }






        //----------------------------------------------------------------------------------------------------------------------------------
        //----------------------------------------------------------------------------------------------------------------------------------



        // Get all products for admin dashboard
        [HttpGet("AllTag")]
        public IActionResult GetAllTag()
        {
            var data = _db.Tags

                         
                          .ToList();

            return Ok(data);
        }










        //----------------------------------------------------------------------------------------------------------------------------------
        //----------------------------------------------------------------------------------------------------------------------------------


        [HttpGet]
        [Route("TopSellingProducts")]
        public IActionResult GetTopSellingProducts()
        {
            var topSellingProducts = _db.OrderItems
                .GroupBy(oi => oi.ProductId)
                .Where(g => g.All(oi => oi.Product.Status == "approved" && oi.Product.Store.Status == "active" && oi.Product.IsDeleted == false))
                .Select(g => new
                {
                    ProductId = g.Key,
                    QuantitySold = g.Sum(oi => oi.Quantity ?? 0),
                    Product = g.FirstOrDefault().Product
                })
                .OrderByDescending(p => p.QuantitySold)
                .Take(4)
                .ToList();

            if (!topSellingProducts.Any())
            {
                return NotFound(new { message = "No products found." }); // إرجاع رسالة في حال عدم وجود منتجات
            }

            return Ok(topSellingProducts.Select(p => new
            {
                p.ProductId,
                p.QuantitySold,
                Product = p.Product
            }));
        }


        //----------------------------------------------------------------------------------------------------------------------------------
        //----------------------------------------------------------------------------------------------------------------------------------
        [HttpPut]
        [Route("EditProduct/{id}")]
        public async Task<IActionResult> EditProduct(int id, [FromForm] ProductRequestDTO productDto)
        {
            if (productDto == null)
            {
                return BadRequest("Invalid product data.");
            }

            // Retrieve the product to edit
            var existingProduct = await _db.Products
                                            .Include(p => p.ProductImages)
                                            .FirstOrDefaultAsync(p => p.ProductId == id);

            if (existingProduct == null)
            {
                return NotFound("Product not found.");
            }

            // Update product properties if not null
            existingProduct.Name = !string.IsNullOrWhiteSpace(productDto.Name) ? productDto.Name : existingProduct.Name;
            existingProduct.Description = !string.IsNullOrWhiteSpace(productDto.Description) ? productDto.Description : existingProduct.Description;
            existingProduct.Price = productDto.Price ?? existingProduct.Price;
            existingProduct.Quantity = productDto.Quantity ?? existingProduct.Quantity;
            existingProduct.SubcategoryId = productDto.SubcategoryId ?? existingProduct.SubcategoryId;

            // Set status to pending
            existingProduct.Status = "pending";

            var uploadedFolder = Path.Combine(Directory.GetCurrentDirectory(), "Product");
            if (!Directory.Exists(uploadedFolder))
            {
                Directory.CreateDirectory(uploadedFolder);
            }

            // Update main image if a new one is uploaded
            if (productDto.Image != null)
            {
                var sanitizedMainImageFileName = Path.GetFileName(productDto.Image.FileName); // sanitize filename
                var oldImagePath = Path.Combine(uploadedFolder, existingProduct.Image);

                if (System.IO.File.Exists(oldImagePath))
                {
                    System.IO.File.Delete(oldImagePath);
                }

                var mainImagePath = Path.Combine(uploadedFolder, sanitizedMainImageFileName);
                using (var stream = new FileStream(mainImagePath, FileMode.Create))
                {
                    await productDto.Image.CopyToAsync(stream);
                }

                existingProduct.Image = sanitizedMainImageFileName;
            }

            // Update additional images if provided
            if (productDto.AdditionalImages != null && productDto.AdditionalImages.Any())
            {
                // Delete existing additional images
                foreach (var existingImage in existingProduct.ProductImages.ToList())
                {
                    var oldImagePath = Path.Combine(uploadedFolder, existingImage.ImagePath);
                    if (System.IO.File.Exists(oldImagePath))
                    {
                        System.IO.File.Delete(oldImagePath);
                    }
                    _db.ProductImages.Remove(existingImage);
                }

                // Save new additional images
                foreach (var image in productDto.AdditionalImages)
                {
                    var sanitizedAdditionalImageFileName = Path.GetFileName(image.FileName); // sanitize filename
                    var additionalImagePath = Path.Combine(uploadedFolder, sanitizedAdditionalImageFileName);

                    using (var stream = new FileStream(additionalImagePath, FileMode.Create))
                    {
                        await image.CopyToAsync(stream);
                    }

                    var productImage = new ProductImage
                    {
                        ProductId = existingProduct.ProductId,
                        ImagePath = sanitizedAdditionalImageFileName
                    };

                    _db.ProductImages.Add(productImage);
                }
            }

            // Save all changes to the database
            await _db.SaveChangesAsync();

            return Ok(new { message = "Product updated successfully." });
        }


        //----------------------------------------------------------------------------------------------------------------------------------
        //----------------------------------------------------------------------------------------------------------------------------------
        [HttpGet]
        [Route("TopReviewedProducts")]
        public IActionResult GetTopReviewedProducts()
        {
            var topReviewedProducts = _db.Comments
                .GroupBy(r => r.ProductId) // Group by ProductId
                                .Where(g => g.All(oi => oi.Product.Status == "approved" && oi.Product.Store.Status == "active" && oi.Product.IsDeleted == false))

                .Select(g => new
                {
                    ProductId = g.Key,
                    ReviewCount = g.Count(), // Count of reviews for each product
                    AverageRating = g.Average(r => r.Rating ?? 0), // Average rating for each product
                    Product = g.FirstOrDefault().Product // Retrieve product details
                })
                .OrderByDescending(p => p.ReviewCount) // Sort by review count
                .Take(4)
                .ToList();

            if (!topReviewedProducts.Any())
            {
                return NotFound(new { message = "No products found." });
            }

            return Ok(topReviewedProducts.Select(p => new
            {
                p.ProductId,
                p.ReviewCount,
                p.AverageRating,
                Product = p.Product // Return the product details
            }));
        }
        //----------------------------------------------------------------------------------------------------------------------------------
        //----------------------------------------------------------------------------------------------------------------------------------

        [HttpDelete("Delete/{id}")]
        public IActionResult Delete(int id)
        {
            var product = _db.Products
                             .Include(p => p.ProductImages) // Include related images
                             .FirstOrDefault(p => p.ProductId == id);

            if (product == null)
            {
                return NotFound();
            }
            // Remove related ProductColors

            // Remove related OrderItems
            _db.OrderItems.RemoveRange(product.OrderItems);

            // Remove related ProductImages
            _db.ProductImages.RemoveRange(product.ProductImages);

            // Finally, remove the product
            _db.Products.Remove(product);

            _db.SaveChanges();

            return Ok(product);
        }

        //----------------------------------------------------------------------------------------------------------------------------------
        //----------------------------------------------------------------------------------------------------------------------------------
        //shop page


        [HttpGet("ByPriceRange")]
        public IActionResult GetProductsByPriceRange(decimal minPrice, decimal maxPrice)
        {
            // Validate input values
            if (minPrice < 0 || maxPrice < 0 || minPrice > maxPrice)
            {
                return BadRequest("Invalid price range.");
            }

            var products = _db.Products
                .Where(p => p.Price >= minPrice && p.Price <= maxPrice
                             && p.Status == "approved" // Ensure the product is approved
                             && p.Store.Status == "active" && p.IsDeleted == false) // Ensure the store is active
                .Select(p => new
                {
                    p.ProductId,
                    p.Name,
                    p.Description,
                    p.Price,
                    p.StoreId,
                    p.SubcategoryId,
                    p.CreatedAt,
                    p.Image,
                    p.Quantity,
                    p.Status,
                    StoreName = p.Store.StoreName, // Assuming you have a Name property in the Store model
                    SubcategoryName = p.Subcategory.SubcategoryName, // Assuming you have a Name property in the Subcategory model

                    // Add more properties as needed
                })
                .ToList();

            return Ok(products);
        }

        //--------------------------------------------------------------------------------------------------------
        //--------------------------------------------------------------------------------------------------------
        [HttpPut("Delete/{id}")]
        public IActionResult MarkAsDeleted(int id)
        {
            // Find the product by ID
            var product = _db.Products.FirstOrDefault(p => p.ProductId == id);

            if (product == null)
            {
                return NotFound();
            }

            // Set is_deleted to 1 to mark as deleted
            product.IsDeleted = true;

            // Save changes to the database
            _db.SaveChanges();

            return Ok(product);
        }



















        //----------------------------------------------------------------------------------------------------------------------------------


        //----------------------------------------------------------------------------------------------------------------------------------
        //----------------------------------------------------------------------------------------------------------------------------------



        [HttpGet]
        [Route("GetProductsBySubcategory/{subcategoryId}")]
        public IActionResult GetProductsBySubcategory(int subcategoryId)
        {
            var products = _db.Products
                .Where(p => p.SubcategoryId == subcategoryId
                             && p.Status == "approved" // Ensure the product is approved
                             && p.Store.Status == "active" && p.IsDeleted == false) // Ensure the store is active
                .Select(product => new
                {
                    productId = product.ProductId,
                    name = product.Name,
                    description = product.Description,
                    price = product.Price,
                    image = product.Image
                })
                .ToList();

            return Ok(products);
        }


        //----------------------------------------------------------------------------------------------------------------------------------
        //----------------------------------------------------------------------------------------------------------------------------------


        // Approve a product by ID
        [HttpPut("ApproveProduct/{productId}")]
        public IActionResult ApproveProduct(int productId)
        {
            var product = _db.Products.FirstOrDefault(p => p.ProductId == productId);
            if (product == null)
            {
                return NotFound("Product not found");
            }

            product.Status = "approved"; // Set status to "approved"
            _db.SaveChanges();

            return Ok("Product approved successfully");
        }

        //----------------------------------------------------------------------------------------------------------------------------------
        //----------------------------------------------------------------------------------------------------------------------------------

        // Reject a product by ID
        [HttpPut("RejectProduct/{productId}")]
        public IActionResult RejectProduct(int productId)
        {
            var product = _db.Products.FirstOrDefault(p => p.ProductId == productId);
            if (product == null)
            {
                return NotFound("Product not found");
            }

            product.Status = "rejected"; // Set status to "rejected"
            _db.SaveChanges();

            return Ok("Product rejected successfully");
        }










        [HttpGet]
        [Route("GetRandom3ProductsBySubcategory/{productId}")]
        public IActionResult GetRandom3ProductsBySubcategory(int productId)
        {
            // Find the product to get its subcategory
            var product = _db.Products
                .FirstOrDefault(p => p.ProductId == productId); // Fetch the specific product by ID

            if (product == null)
            {
                return NotFound("Product not found");
            }

            var subcategoryId = product.SubcategoryId; // Get the subcategory ID from the found product

            // Get three random approved products from the same subcategory excluding the specified product
            // Get three random approved products from the same subcategory excluding the specified product
            var randomProducts = _db.Products
                .Where(p => p.SubcategoryId == subcategoryId
                             && p.Status == "approved"
                             && p.Store.Status == "active"
                             && p.ProductId != productId // Exclude the specific product
                             && (p.IsDeleted == false || p.IsDeleted == null)) // Include only products that are not deleted
                .OrderBy(r => Guid.NewGuid()) // Randomize the results
                .Take(4)
                .Select(p => new
                {
                    productId = p.ProductId,
                    name = p.Name,
                    description = p.Description,
                    price = p.Price,
                    image = p.Image
                })
                .ToList();


            return Ok(randomProducts);
        }

    }
}