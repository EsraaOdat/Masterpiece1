namespace E_Commerce.dto
{
    public class SubCategoryRequestDTO
    {
        public int SubCategoryId { get; set; } // Add subcategory ID
        public string? SubcategoryName { get; set; }
    }

    public class CategoryEditRequestDTO
    {
        public int CategoryId { get; set; } // Include category ID
        public string? Name { get; set; }
        public string? Description { get; set; }
        public IFormFile Image { get; set; }
        public List<SubCategoryRequestDTO>? Subcategories { get; set; } // List of subcategories with IDs
    }
}
