namespace E_Commerce.dto
{
    public class UpdateSubscriptionDTO
    {
        public string PlanName { get; set; }  // Plan name (e.g., "monthly", "yearly")
        public string PlanType { get; set; }  // Plan type
        public decimal Amount { get; set; }   // Amount for the subscription

    }
}
