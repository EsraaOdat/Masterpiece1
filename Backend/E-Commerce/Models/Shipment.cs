using System;
using System.Collections.Generic;

namespace E_Commerce.Models;

public partial class Shipment
{
    public int ShipmentId { get; set; }

    public int? OrderId { get; set; }

    public int? StoreId { get; set; }

    public string? ShippingProvider { get; set; }

    public string? TrackingNumber { get; set; }

    public string? ShipmentStatus { get; set; }

    public DateTime? ShippedDate { get; set; }

    public DateTime? EstimatedDelivery { get; set; }

    public virtual Order? Order { get; set; }

    public virtual Store? Store { get; set; }
}
