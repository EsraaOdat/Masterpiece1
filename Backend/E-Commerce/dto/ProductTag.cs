
using E_Commerce.Models;

namespace E_Commerce.dto
{
    public class ProductTag
    {
        public int ProductId { get; set; }

        public int TagId { get; set; }
        public Product? Product { get; set; }

        public Tag Tag { get; set; }

    }
}
