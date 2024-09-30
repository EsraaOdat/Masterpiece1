namespace E_Commerce.Models
{
    public class ProductColors
    {
        public int ProductColorId { get; set; }

        public int ProductId { get; set; }

        public string? Image { get; set; }

        public int Quantity { get; set; }
        public int ColorId { get; set; }
        public virtual ICollection<Product> Products { get; set; } = new List<Product>();

        public virtual ICollection<Color> Colors { get; set; } = new List<Color>();

    }
}
