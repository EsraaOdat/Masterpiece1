using E_Commerce.Models;

namespace E_Commerce.dto
{
    public class ProductSizes
    {
        public int ProductId { get; set; }
        public Product Product { get; set; }

        public int SizeId { get; set; }
        public Size Size { get; set; }
    }
}
