namespace E_Commerce.dto
{

    public class AddCartItemsDto
    {
        public int? CartId { get; set; }

        public int? ProductId { get; set; }

        public int? Quantity { get; set; }
        public int? StoreId { get; set; }


    }
}