using System;
using System.Collections.Generic;

namespace E_Commerce.Models;

public partial class ProductColorImage
{
    public int ProductColorImageId { get; set; }

    public int ProductId { get; set; }

    public int ColorId { get; set; }

    public string ImagePath { get; set; } = null!;

    public virtual Color Color { get; set; } = null!;

    public virtual Product Product { get; set; } = null!;
}
