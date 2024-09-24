using System;
using System.Collections.Generic;

namespace E_Commerce.Models;

public partial class ShippingAddress
{
    public int AddressId { get; set; }

    public int? UserId { get; set; }

    public string? Address { get; set; }

    public string? City { get; set; }

    public string? ZipCode { get; set; }

    public string? Country { get; set; }

    public virtual User? User { get; set; }
}
