using System;
using System.Collections.Generic;

namespace E_Commerce.Models;

public partial class Subscription
{
    public int Id { get; set; }

    public int? UserId { get; set; }

    public string? SubscriptionPlan { get; set; }

    public DateTime? StartDate { get; set; }

    public DateTime? EndDate { get; set; }

    public bool? AutoRenew { get; set; }

    public string? Status { get; set; }
}
