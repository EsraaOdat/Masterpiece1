using System;
using System.Collections.Generic;

namespace E_Commerce.Models;

public partial class Size
{
    public int SizeId { get; set; }

    public string SizeName { get; set; } = null!;

    public virtual ICollection<Variant> Variants { get; set; } = new List<Variant>();

    public virtual ICollection<Product> Products { get; set; } = new List<Product>();
}
