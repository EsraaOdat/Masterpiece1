using System;
using System.Collections.Generic;

namespace E_Commerce.Models;

public partial class Subscription
{
    public int SubscriptionId { get; set; }

    public int? UserId { get; set; }

    public string? PlanName { get; set; }

    public string? PlanType { get; set; }

    public decimal? Amount { get; set; }

    public DateTime? StartDate { get; set; }

    public DateTime? EndDate { get; set; }

    public string? Status { get; set; }

    public int? PaymentMethodId { get; set; }

    public int? StoreId { get; set; }

    public virtual PaymentMethod? PaymentMethod { get; set; }

    public virtual Store? Store { get; set; }

    public virtual User? User { get; set; }
}
