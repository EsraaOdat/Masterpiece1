using System;
using System.Collections.Generic;

namespace E_Commerce.Models;

public partial class Variant
{
    public int VariantId { get; set; }

    public int? ProductId { get; set; }

    public int? ColorId { get; set; }

    public int? SizeId { get; set; }

    public int? TagId { get; set; }

    public int? Quantity { get; set; }

    public string? Image { get; set; }

    public virtual Color? Color { get; set; }

    public virtual Product? Product { get; set; }

    public virtual Size? Size { get; set; }

    public virtual Tag? Tag { get; set; }
}
