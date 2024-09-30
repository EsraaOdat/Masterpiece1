using System;
using System.Collections.Generic;

namespace E_Commerce.Models;

public partial class Color
{
    public int ColorId { get; set; }

    public string ColorName { get; set; } = null!;

    public virtual ICollection<Variant> Variants { get; set; } = new List<Variant>();

    public virtual ICollection<Product> Products { get; set; } = new List<Product>();
}
