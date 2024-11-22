namespace E_Commerce.dto
{
    public class StoreDTO
    {

        public string? StoreName { get; set; }

        public string? StoreDescription { get; set; }

        public IFormFile StoreLogo { get; set; }

        public IFormFile BackgroundImage { get; set; }

        public string? Address { get; set; }

        public string? City { get; set; }

        public string? ZipCode { get; set; }

        public string? Country { get; set; }

        public string? PhoneNumber { get; set; }

        public string? PlanName { get; set; }

        public string? PlanType { get; set; }
        public decimal? Amount { get; set; }



    }
}
