using E_Commerce.dto;
using E_Commerce.Dto;
using E_Commerce.DTOs;
using E_Commerce.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using System.Data;
using System.Linq;

namespace E_Commerce.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class StoreOwners : ControllerBase
    {
        private readonly MyDbContext _db;
        private readonly PasswordHasher<StoreOwner> _passwordHasher;
        private readonly TokenGenerator _tokenGenerator;
        private readonly EmailService _emailService;

        public StoreOwners(MyDbContext db, PasswordHasher<StoreOwner> passwordHasher, TokenGenerator tokenGenerator, EmailService emailService)
        {
            _db = db;
            _passwordHasher = passwordHasher;
            _tokenGenerator = tokenGenerator;
            _emailService = emailService;

        }







        [HttpPost("StoreOwnerRegister")]
        public ActionResult StoreOwnerRegister([FromForm] StoreOwnerRegisterDTO model)
        {
            try
            {
                // Hash the password
                byte[] passwordHash, passwordSalt;
                PasswordHasher.CreatePasswordHash(model.Password, out passwordHash, out passwordSalt);

                var user = new StoreOwner
                {
                    OwnerName = model.OwnerName,
                    StoreId = model.StoreId,
                    PasswordHash = passwordHash,
                    PasswordSalt = passwordSalt,
                    Password = model.Password,
                    Email = model.Email
                };

                _db.StoreOwners.Add(user);
                _db.SaveChanges();

                return Ok(user);
            }
            catch (Exception ex)
            {
                // Log the exception or return a meaningful error message
                return StatusCode(500, $"Internal server error: {ex.Message}");
            }
        }





        [HttpPost("StoreOwnerLogin")]
        public IActionResult StoreOwnerLogin([FromForm] StoreOwnerLoginDTO model)
        {

            // Regular email/password login
            var user = _db.StoreOwners.FirstOrDefault(x => x.Email == model.Email);
            if (user == null || !PasswordHasher.VerifyPasswordHash(model.Password, user.PasswordHash, user.PasswordSalt))
            {
                return Unauthorized("Invalid username or password.");
            }

            // Retrieve roles and generate JWT token
            var roles = new[] { "StoreOwner" }; // Add your roles logic here

            var token = _tokenGenerator.GenerateToken(user.OwnerName, roles);

            return Ok(new { Token = token, StoreOwnerId = user.StoreId , UserTayp=user.UserType});
        }
    }
}
