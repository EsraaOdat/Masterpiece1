namespace E_Commerce.dto
{
    public class ProductDto
    {
        public string? Name { get; set; }

        public string? Description { get; set; }

        public decimal? Price { get; set; }

        public int? StoreId { get; set; }

        public int? SubcategoryId { get; set; }


        public IFormFile? Image { get; set; }

        public int? Quantity { get; set; }

    }
}
