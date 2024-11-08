using E_Commerce.Dto;
using E_Commerce.Dto_Esraa;
using E_Commerce.DTOs;
using E_Commerce.Models;
using Microsoft.AspNetCore.Mvc;
using System.Linq;

namespace E_Commerce.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class OrdersController : ControllerBase
    {
        private readonly MyDbContext _db;

        public OrdersController(MyDbContext db)
        {
            _db = db;
        }

        // 1. الحصول على جميع الطلبات
        [HttpGet]
        [Route("AllOrders")]
        public IActionResult GetAllOrders()
        {
            var orders = _db.Orders
                .OrderByDescending(order => order.Date) 
                .Select(order => new OrderResponseDto
                {
                    OrderId = order.OrderId,
                    Date = order.Date,
                    Customer = order.User != null ? new UserDto { Name = order.User.Name } : null,
                    Store = new StoreDto
                    {
                        StoreId = order.StoreId ?? 0,
                        StoreName = _db.Stores
                            .Where(store => store.StoreId == order.StoreId)
                            .Select(store => store.StoreName)
                            .FirstOrDefault() ?? "Unknown Store"
                    },
                    NumberOfItems = order.OrderItems.Sum(oi => oi.Quantity ?? 0),
                    Total = order.OrderItems.Sum(oi => (oi.Quantity ?? 0) * (oi.Product.Price ?? 0)),
                    Status = order.Status,
                    OrderItem = order.OrderItems.Select(oi => new OrderItemDto
                    {
                        ProductId = oi.Product.ProductId,
                        ProductName = oi.Product.Name,
                        Quantity = oi.Quantity,
                        Price = oi.Product.Price
                    }).ToList()
                })
                .ToList();

            return Ok(orders);
        }


        // 2. الحصول على الطلبات حسب المتجر
        [HttpGet]
        [Route("OrdersByStore/{storeId}")]
        public IActionResult GetOrdersByStore(int storeId)
        {
            var orders = _db.Orders
                .Where(order => order.StoreId == storeId)
                .Select(order => new OrderResponseDto
                {
                    OrderId = order.OrderId,
                    Date = order.Date,
                    Customer = order.User != null ? new UserDto { Name = order.User.Name } : null,
                    Store = new StoreDto
                    {
                        StoreId = order.StoreId ?? 0,
                        StoreName = _db.Stores
                            .Where(store => store.StoreId == order.StoreId)
                            .Select(store => store.StoreName)
                            .FirstOrDefault() ?? "Unknown Store"
                    },
                    NumberOfItems = order.OrderItems.Sum(oi => oi.Quantity ?? 0),
                    Total = order.OrderItems.Sum(oi => (oi.Quantity ?? 0) * (oi.Product.Price ?? 0)),
                    Status = order.Status,
                    OrderItem = order.OrderItems.Select(oi => new OrderItemDto
                    {
                        ProductId = oi.Product.ProductId,
                        ProductName = oi.Product.Name,
                        Quantity = oi.Quantity,
                        Price = oi.Product.Price
                    }).ToList()
                })
                .ToList();

            if (!orders.Any())
            {
                return NotFound($"No orders found for store ID {storeId}.");
            }

            return Ok(orders);
        }

        // 3. الحصول على الطلبات حسب المستخدم
        [HttpGet]
        [Route("GetOrdersByUser/{userId}")]
        public IActionResult GetOrdersByUserId(int userId)
        {
            var orders = _db.Orders
                .Where(order => order.UserId == userId)
                .Select(order => new OrderResponseDto
                {
                    OrderId = order.OrderId,
                    Date = order.Date,
                    Customer = order.User != null ? new UserDto { Name = order.User.Name } : null,
                    Store = new StoreDto
                    {
                        StoreId = order.StoreId ?? 0,
                        StoreName = _db.Stores
                            .Where(store => store.StoreId == order.StoreId)
                            .Select(store => store.StoreName)
                            .FirstOrDefault() ?? "Unknown Store"
                    },
                    NumberOfItems = order.OrderItems.Sum(oi => oi.Quantity ?? 0),
                    Total = order.OrderItems.Sum(oi => (oi.Quantity ?? 0) * (oi.Product.Price ?? 0)),
                    Status = order.Status,
                    OrderItem = order.OrderItems.Select(oi => new OrderItemDto
                    {
                        ProductId = oi.Product.ProductId,
                        ProductName = oi.Product.Name,
                        Quantity = oi.Quantity,
                        Price = oi.Product.Price
                    }).ToList()
                })
                .ToList();

            if (!orders.Any())
            {
                return NotFound(new { message = "No orders found for this user." });
            }

            return Ok(orders);
        }

        // 4. الحصول على عناصر الطلب حسب معرف الطلب
        [HttpGet]
        [Route("GetOrderItemsByOrderId/{orderId}")]
        public IActionResult GetOrderItemsByOrderId(int orderId)
        {
            var orderItems = _db.OrderItems
                .Where(oi => oi.OrderId == orderId)
                .Select(oi => new OrderItemDto
                {
                    ProductId = oi.Product.ProductId,
                    ProductName = oi.Product.Name,
                    Quantity = oi.Quantity,
                    Price = oi.Product.Price
                })
                .ToList();

            if (!orderItems.Any())
            {
                return NotFound(new { message = "No items found for this order." });
            }

            return Ok(orderItems);
        }

        // 5. الحصول على تفاصيل الطلب حسب معرف الطلب
        [HttpGet]
        [Route("GetOrderDetails/{orderId}")]
        public IActionResult GetOrderDetails(int orderId)
        {
            var order = _db.Orders
                .Where(o => o.OrderId == orderId)
                .Select(o => new OrderDetailsDto
                {
                    OrderId = o.OrderId,
                    Date = o.Date,
                    Status = o.Status,
                    TotalAmount = o.OrderItems.Sum(oi => (oi.Quantity ?? 0) * (oi.Product.Price ?? 0)),
                    OrderItems = o.OrderItems.Select(oi => new OrderDetailsDto.OrderItemDto
                    {
                        ProductId = oi.Product.ProductId,
                        ProductName = oi.Product.Name,
                        Quantity = oi.Quantity ?? 0,
                        Price = oi.Product.Price ?? 0,
                        ProductImage = oi.Product.Image // Assuming Image field exists in Product
                    }).ToList(),
                    Customer = new OrderDetailsDto.CustomerDto
                    {
                        Name = o.User.Name,
                        Email = o.User.Email,
                        Image = o.User.Image,
                        PhoneNumber = o.User.PhoneNumber
                    },
                    Coupon = new OrderDetailsDto.CouponDto
                    {
                        Name = o.Copon.Name ?? "No Coupon Applied",
                        Amount = o.Copon.Amount ?? 0
                    }
                })
                .FirstOrDefault();

            if (order == null)
            {
                return NotFound(new { message = "Order not found." });
            }

            return Ok(order);
        }

        // 6. تحديث حالة الطلب
        [HttpPut]
        [Route("UpdateOrderStatus/{orderId}")]
        public IActionResult UpdateOrderStatus(int orderId, [FromBody] UpdateOrderStatusDto updateOrderStatusDto)
        {
            var order = _db.Orders.FirstOrDefault(o => o.OrderId == orderId);

            if (order == null)
            {
                return NotFound(new { message = "Order not found." });
            }

            order.Status = updateOrderStatusDto.Status;
            _db.SaveChanges();

            return Ok(new { message = "Order status updated successfully.", orderId = orderId, newStatus = updateOrderStatusDto.Status });
        }
    }
}
