﻿using System;
using System.Collections.Generic;

namespace E_Commerce.Models;

public partial class Order
{
    public int OrderId { get; set; }

    public int? UserId { get; set; }

    public int? StoreId { get; set; }

    public decimal? TotalAmount { get; set; }

    public DateTime? OrderDate { get; set; }

    public string? Status { get; set; }

    public int? PaymentMethodId { get; set; }

    public string? TransactionId { get; set; }

    public virtual ICollection<OrderItem> OrderItems { get; set; } = new List<OrderItem>();

    public virtual PaymentMethod? PaymentMethod { get; set; }

    public virtual ICollection<Shipment> Shipments { get; set; } = new List<Shipment>();

    public virtual Store? Store { get; set; }

    public virtual User? User { get; set; }
}