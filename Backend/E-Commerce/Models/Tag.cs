using System;
using System.Collections.Generic;

namespace E_Commerce.Models;

public partial class Tag
{
    public int TagId { get; set; }

    public string TagName { get; set; } = null!;

    public virtual ICollection<Variant> Variants { get; set; } = new List<Variant>();

    public virtual ICollection<Product> Products { get; set; } = new List<Product>();
}
