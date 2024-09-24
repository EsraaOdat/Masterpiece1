using System;
using System.Collections.Generic;

namespace E_Commerce.Models;

public partial class ProductDiscount
{
    public int DiscountId { get; set; }

    public int? ProductId { get; set; }

    public decimal? DiscountPercentage { get; set; }

    public DateTime? StartDate { get; set; }

    public DateTime? EndDate { get; set; }

    public virtual Product? Product { get; set; }
}
