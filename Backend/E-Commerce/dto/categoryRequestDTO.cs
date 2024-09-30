namespace E_Commerce.dto
{
    public class categoryRequestDTO
    {
        public string? Name { get; set; }
        public string? Description { get; set; }

        public IFormFile? Image { get; set; }
        public List<string>? Subcategories { get; set; } // Add a list for subcategory names

    }
}
