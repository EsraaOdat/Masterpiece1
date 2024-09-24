using System;
using System.Collections.Generic;

namespace E_Commerce.Models;

public partial class SubCategory
{
    public int SubcategoryId { get; set; }

    public int? CategoryId { get; set; }

    public string? SubcategoryName { get; set; }

    public virtual Category? Category { get; set; }

    public virtual ICollection<Product> Products { get; set; } = new List<Product>();
}
