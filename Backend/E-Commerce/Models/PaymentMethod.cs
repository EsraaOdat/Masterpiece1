using System;
using System.Collections.Generic;

namespace E_Commerce.Models;

public partial class PaymentMethod
{
    public int MethodId { get; set; }

    public string? MethodName { get; set; }

    public virtual ICollection<Order> Orders { get; set; } = new List<Order>();
}
