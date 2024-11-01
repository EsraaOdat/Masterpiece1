using E_Commerce.dto;
using E_Commerce.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace E_Commerce.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ReviewController : ControllerBase
    {
        private readonly MyDbContext _db;

        public ReviewController(MyDbContext db)
        {
            _db = db;
        }

        [HttpGet("getAllComments/{productId}")]
        public IActionResult GetAllComments(int productId)
        {
            var comments = _db.Comments
                .Where(c => c.ProductId == productId)
                .OrderByDescending(c => c.Date)
                .ToList();

            return Ok(comments);
        }

        [HttpPost("addReview")]
        public IActionResult AddReview([FromForm] CommentPOST form)
        {
            if (form == null || string.IsNullOrWhiteSpace(form.CommentText) || form.Rating < 1 || form.Rating > 5)
            {
                return BadRequest("Invalid review data.");
            }

            var comment = new Comment
            {
                ProductId = form.ProductId,
                Comment1 = form.CommentText,
                Email = form.Email,
                Name=form.Name,
                Rating = form.Rating,
                Date = DateOnly.FromDateTime(DateTime.Now),
                Status = 0 // Assuming status 0 means "pending"
            };

            _db.Comments.Add(comment);
            _db.SaveChanges();

            return Ok(comment);
        }

        [HttpGet("getCommentById/{id}")]
        public IActionResult GetCommentById(int id)
        {
            var comment = _db.Comments.FirstOrDefault(c => c.CommentId == id);
            return comment != null ? Ok(comment) : NotFound();
        }

        [HttpPut("updateComment/{id}")]
        public IActionResult UpdateComment(int id, [FromForm] CommentPUT form)
        {
            var comment = _db.Comments.FirstOrDefault(c => c.CommentId == id);
            if (comment == null)
            {
                return NotFound();
            }

            comment.Comment1 = form.CommentText;
            comment.Rating = form.Rating;
            comment.Status = form.Status; // Update status if needed

            _db.Comments.Update(comment);
            _db.SaveChanges();

            return Ok(comment);
        }

        [HttpDelete("deleteComment/{id}")]
        public IActionResult DeleteComment(int id)
        {
            var comment = _db.Comments.FirstOrDefault(c => c.CommentId == id);
            if (comment == null)
            {
                return NotFound();
            }

            _db.Comments.Remove(comment);
            _db.SaveChanges();

            return NoContent();
        }


        [HttpGet]
        [Route("AverageRatingByProduct/{productId}")]
        public IActionResult GetAverageRatingByProduct(int productId)
        {
            var productReviews = _db.Comments
                .Where(r => r.ProductId == productId) // Filter reviews for the specified product
                .ToList();

            if (!productReviews.Any())
            {
                return NotFound(new { message = "No reviews found for this product." });
            }

            var averageRating = productReviews.Average(r => r.Rating ?? 0); // Calculate average rating, defaulting nulls to 0

            return Ok(new
            {
                ProductId = productId,
                AverageRating = averageRating,
                ReviewCount = productReviews.Count // Optional: number of reviews
            });
        }

    }
}