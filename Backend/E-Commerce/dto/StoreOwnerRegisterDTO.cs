namespace E_Commerce.dto
{
    public class StoreOwnerRegisterDTO
    {
   
        public string OwnerName { get; set; }
        public int? StoreId { get; set; }

        public string Email { get; set; }
        public string Password { get; set; }
    }

    public class StoreOwnerLoginDTO
    {
        public string Email { get; set; }
        public string Password { get; set; }
    }
}
