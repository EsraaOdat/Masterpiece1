﻿namespace E_Commerce.DTOs
{
    public class CartItemResponseDTOs
    {
        public int CartItemId { get; set; }

        public int? ProductId { get; set; }

        public int? UserId { get; set; }

        public int? Quantity { get; set; }

        public ProductResponseDTO? prodcutDTO { get; set; }



    }


    public class ProductResponseDTO
    {
        public int ProductId { get; set; }

        public string? Name { get; set; }

        public string? Description { get; set; }

        public decimal? Price { get; set; }

        public int? StoreId { get; set; }

        public int? SubcategoryId { get; set; }

        public DateTime? CreatedAt { get; set; }

        public string? Image { get; set; }

        public int? Quantity { get; set; }
        

    }
}
