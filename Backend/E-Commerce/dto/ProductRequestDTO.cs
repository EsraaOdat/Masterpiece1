
using E_Commerce.Models;

namespace E_Commerce.dto
{
    public class ProductRequestDTO
    {
        public string? Name { get; set; }

        public string? Description { get; set; }

        public decimal? Price { get; set; }

        public int? StoreId { get; set; }

        public int? SubcategoryId { get; set; }

        public DateTime? CreatedAt { get; set; }

        public IFormFile Image { get; set; }

        public int? Quantity { get; set; }

        public List<IFormFile> AdditionalImages { get; set; } = new List<IFormFile>();


        // New properties for colors, sizes, and tags
        public List<int> TagIds { get; set; } = new List<int>(); // List of selected tag IDs
    
}


    //public class ProductSizes
    //{
    //    public int ProductSizesId { get; set; }
    //    public int ProductId { get; set; }
    //    public virtual Product Product { get; set; }

    //    public int SizeId { get; set; }
    //    public virtual Size Size { get; set; }
    //}

    public class AdditionalImages
    {

        //public int ProductId { get; set; }

        public IFormFile ImagePath { get; set; } = null!;

    }


}
