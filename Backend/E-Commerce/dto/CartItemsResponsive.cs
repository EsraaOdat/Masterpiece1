namespace E_Commerce.dto
{
    public class CartItemsResponsive
    {
        public int CartItemId { get; set; }

        public int? CartId { get; set; }


        public int? Quantity { get; set; }

        public ProductDto Product { get; set; }

    }



    public class ProductDto
    {
        public int? ProductId { get; set; }

        public string? Name { get; set; }

        public string? Image { get; set; }

        public decimal? Price { get; set; }
        public int? StoreId { get; set; }



    }

}