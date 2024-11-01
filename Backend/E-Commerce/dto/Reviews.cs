namespace E_Commerce.dto
{
    public class Reviews
    {
    }


    public class CommentPOST
    {
        public int ProductId { get; set; }
        public string? Email { get; set; }
        public string? Name { get; set; }

        public string CommentText { get; set; }
        public int Rating { get; set; }
    }

    public class CommentPUT
    {
        public string CommentText { get; set; }
        public int Rating { get; set; }
        public int Status { get; set; } // Assuming you want to allow status updates
    }

}
