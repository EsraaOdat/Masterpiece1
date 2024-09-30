using System;
using System.Collections.Generic;

namespace E_Commerce.Models;

public partial class Product
{
    public int ProductId { get; set; }

    public string? Name { get; set; }

    public string? Description { get; set; }

    public decimal? Price { get; set; }

    public int? StoreId { get; set; }

    public int? SubcategoryId { get; set; }

    public DateTime? CreatedAt { get; set; }

    public string? Image { get; set; }

    public int? Quantity { get; set; }

    public virtual ICollection<CartItem> CartItems { get; set; } = new List<CartItem>();

    public virtual ICollection<Comment1> Comment1s { get; set; } = new List<Comment1>();

    public virtual ICollection<Comment> Comments { get; set; } = new List<Comment>();

    public virtual ICollection<OrderItem> OrderItems { get; set; } = new List<OrderItem>();

    public virtual ICollection<ProductDiscount> ProductDiscounts { get; set; } = new List<ProductDiscount>();

    public virtual ICollection<ProductImage> ProductImages { get; set; } = new List<ProductImage>();

    public virtual Store? Store { get; set; }

    public virtual SubCategory? Subcategory { get; set; }

    public virtual ICollection<Variant> Variants { get; set; } = new List<Variant>();

    public virtual ICollection<Wishlist> Wishlists { get; set; } = new List<Wishlist>();

    public virtual ICollection<Color> Colors { get; set; } = new List<Color>();

    public virtual ICollection<Size> Sizes { get; set; } = new List<Size>();

    public virtual ICollection<Tag> Tags { get; set; } = new List<Tag>();
}
