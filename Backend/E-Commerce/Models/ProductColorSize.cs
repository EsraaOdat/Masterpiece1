using System;
using System.Collections.Generic;

namespace E_Commerce.Models;

public partial class ProductColorSize
{
    public int ProductColorSizeId { get; set; }

    public int ProductId { get; set; }

    public int? ColorId { get; set; }

    public int? SizeId { get; set; }

    public int Stock { get; set; }

    public virtual Color? Color { get; set; }

    public virtual Product Product { get; set; } = null!;

    public virtual Size? Size { get; set; }
}
