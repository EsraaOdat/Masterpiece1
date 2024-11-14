using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using E_Commerce.Models;
using E_Commerce.dto;

namespace E_Commerce.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CartItemsController : ControllerBase
    {
        private readonly MyDbContext _db;

        public CartItemsController(MyDbContext db)
        {
            _db = db;
        }

        // Get all Items

        // Get all Cart Items
        [HttpGet]
        [Route("AllItems")]
        public IActionResult GetAllCartItems()
        {
            var CartItems = _db.CartItems.Select(x =>

            new CartItemsResponsive
            {
                CartId = x.CartId,
                CartItemId = x.CartItemId,
                Quantity = x.Quantity,
                Product = new ProductDto
                {
                    Name = x.Product.Name,
                    Price = x.Product.Price,
                    Image = x.Product.Image,
                    StoreId=x.Product.StoreId
                }
            });

            return Ok(CartItems);
        }




        [HttpGet]
        [Route("AllItems/{userId}")]
        public IActionResult GetAllCartItems(int userId)
        {
            // Filter cart items by UserId and where the Cart status is "open"
            var cartItems = _db.CartItems
                .Where(x => x.Cart.UserId == userId && x.Cart.Status == "open") // Filter by UserId and open status
                .Select(x => new CartItemsResponsive
                {
                    CartId = x.CartId,
                    CartItemId = x.CartItemId,
                    Quantity = x.Quantity,
                    Product = new ProductDto
                    {
                        Name = x.Product.Name,
                        Price = x.Product.Price,
                        Image = x.Product.Image,
                        ProductId = x.ProductId,
                        StoreId=x.StoreId
                    }
                }).ToList();

            return Ok(cartItems);
        }








        [HttpPost]
        [Route("AddItem")]
        public IActionResult AddCartItem([FromBody] AddCartItemsDto newItem)
        {
            // Retrieve the product based on the provided ProductId
            var product = _db.Products.SingleOrDefault(p => p.ProductId == newItem.ProductId);

            // Check if the product exists
            if (product == null)
            {
                return NotFound(new { Message = "Product not found." });
            }

            // Check if the cart item already exists for the given CartId and ProductId
            var existingCartItem = _db.CartItems
                .SingleOrDefault(ci => ci.CartId == newItem.CartId && ci.ProductId == newItem.ProductId);

            if (existingCartItem != null)
            {
                // If the cart item exists, increment the quantity
                existingCartItem.Quantity += newItem.Quantity;
                _db.SaveChanges();
                return Ok(new { Message = "Cart item quantity updated successfully.", CartItem = existingCartItem });
            }
            else
            {
                // If the cart item doesn't exist, create a new one
                var cartItem = new CartItem
                {
                    CartId = newItem.CartId,
                    ProductId = newItem.ProductId,
                    Quantity = newItem.Quantity,
                    StoreId = product.StoreId // Assuming CartItem has a StoreId property
                };

                // Add the new cart item to the database
                _db.CartItems.Add(cartItem);
                _db.SaveChanges();

                return Ok(new { Message = "Item added to cart successfully.", CartItem = cartItem });
            }
        }








        [HttpPut("{id}")]
        public IActionResult UpdateCartItem(int id, [FromForm] UpdateCartController cartItem)
        {
            var existingCart = _db.CartItems.Find(id);
            if (existingCart == null)
            {
                return NotFound(new { message = "Cart not found" });
            }

            existingCart.Quantity = cartItem.Quantity;


            _db.CartItems.Update(existingCart);
            _db.SaveChanges();

            return Ok(new { message = "Cart updated successfully", CartItem = existingCart });
        }
         


        [HttpDelete("{cartItemId}")]
        public IActionResult DeleteCartItem(int cartItemId)
        {
            // Assuming the correct property name is 'CartItemId' in your CartItem entity class
            var cartItemToDelete = _db.CartItems.FirstOrDefault(x => x.CartItemId == cartItemId);

            if (cartItemToDelete == null)
            {
                return NotFound(new { message = "Cart item not found" });
            }

            _db.CartItems.Remove(cartItemToDelete);
            _db.SaveChanges();

            return Ok(new { message = "Cart item deleted successfully", DeletedItem = cartItemToDelete });
        }
        //-------------------------------------------------------------------------------------------------------------------------
        //-------------------------------------------------------------------------------------------------------------------------



        [HttpPost]
        [Route("MoveCartToOrder/{userId}")]
        public IActionResult MoveCartToOrder(int userId)
        {
            // Find the user's active cart
            var cart = _db.Carts.Include(c => c.CartItems)
                                 .ThenInclude(ci => ci.Product) // Include product details to access StoreId
                                 .FirstOrDefault(c => c.UserId == userId && c.Status == "open");

            if (cart == null)
            {
                return NotFound(new { Message = "No active cart found for this user." });
            }

            // Group cart items by StoreId
            var groupedItems = cart.CartItems
                .GroupBy(ci => ci.Product.StoreId)
                .ToList();

            // Create orders for each store
            foreach (var group in groupedItems)
            {
                var order = new Order
                {
                    UserId = userId,
                    Status = "Pending",
                    Date = DateOnly.FromDateTime(DateTime.UtcNow), // Use this for DateOnly
                    StoreId = group.Key, // Save StoreId in the Order
                    OrderItems = group.Select(ci => new OrderItem
                    {
                        ProductId = ci.ProductId,
                        Quantity = ci.Quantity
                    }).ToList()
                };

                // Add order to the database
                _db.Orders.Add(order);
            }

            // Remove cart items after transferring to orders
            _db.CartItems.RemoveRange(cart.CartItems);

            // Save changes to the database
            _db.SaveChanges();

            return Ok(new { Message = "Orders created successfully." });
        }


    }

}