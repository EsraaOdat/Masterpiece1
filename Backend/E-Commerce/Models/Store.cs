using System;
using System.Collections.Generic;

namespace E_Commerce.Models;

public partial class Store
{
    public int StoreId { get; set; }

    public string? StoreName { get; set; }

    public string? StoreDescription { get; set; }

    public string? StoreLogo { get; set; }

    public string? BackgroundImage { get; set; }

    public string? Address { get; set; }

    public string? City { get; set; }

    public string? ZipCode { get; set; }

    public string? Country { get; set; }

    public string? PhoneNumber { get; set; }

    public DateTime? CreatedAt { get; set; }

    public string? Status { get; set; }

    public string? PlanName { get; set; }

    public string? PlanType { get; set; }

    public decimal? Amount { get; set; }

    public DateTime? StartDate { get; set; }

    public DateTime? EndDate { get; set; }

    public virtual ICollection<Order> Orders { get; set; } = new List<Order>();

    public virtual ICollection<Product> Products { get; set; } = new List<Product>();

    public virtual ICollection<Shipment> Shipments { get; set; } = new List<Shipment>();

    public virtual ICollection<StoreOwner> StoreOwners { get; set; } = new List<StoreOwner>();
}
