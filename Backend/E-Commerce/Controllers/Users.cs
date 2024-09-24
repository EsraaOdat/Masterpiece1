using E_Commerce.dto;
using E_Commerce.Dto;
using E_Commerce.Dto_Esraa;
using E_Commerce.DTOs;
using E_Commerce.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;

namespace E_Commerce.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UsersController : ControllerBase
    {


        private readonly MyDbContext _db;
        private readonly PasswordHasher<User> _passwordHasher;
        private readonly TokenGenerator _tokenGenerator;
        private readonly EmailService _emailService;

        public UsersController(MyDbContext db, PasswordHasher<User> passwordHasher, TokenGenerator tokenGenerator, EmailService emailService)
        {
            _db = db;
            _passwordHasher = passwordHasher;
            _tokenGenerator = tokenGenerator;
            _emailService = emailService;

        }

        [HttpGet]
        [Route("GetUserById/{id}")]
        public IActionResult GetUserById(int id)
        {
            if (id <= 0)
            {
                return BadRequest(new { message = "Invalid ID. The ID must be a positive integer." });
            }

            var user = _db.Users.Find(id);

            if (user == null)
            {
                return NotFound(new { message = $"User with ID {id} not found." });
            }

            return Ok(user);
        }



        [HttpPut]
        [Route("UpdateUser/{id}")]

        public IActionResult UpdateUser(int id, [FromForm] UsersRequestDTO updatedUser)
        {
            var existingUser = _db.Users.Find(id);
            if (existingUser == null)
            {
                return NotFound(new { message = $"User with ID {id} not found." });
            }
            existingUser.Name = updatedUser.Name ?? existingUser.Name;

            existingUser.Email = updatedUser.Email ?? existingUser.Email;


            existingUser.PhoneNumber = updatedUser.PhoneNumber ?? existingUser.PhoneNumber;
            existingUser.Password = updatedUser.Password ?? existingUser.Password;

            _db.Users.Update(existingUser);
            _db.SaveChanges();
            return Ok(new { message = "User updated successfully.", user = existingUser });
        }


        [HttpPost]
        [Route("ChangePassword")]
        public IActionResult ChangePassword([FromForm] ChangePasswordDTO request)
        {
            if (request.UserId <= 0)
            {
                return BadRequest(new { message = "Invalid User ID." });
            }

            var user = _db.Users.Find(request.UserId);
            if (user == null)
            {
                return NotFound(new { message = "User not found." });
            }

            if (!PasswordHasherMethod.VerifyPasswordHash(request.CurrentPassword, user.PasswordHash, user.PasswordSalt))
            {
                return BadRequest(new { message = "Old password is incorrect." });
            }

            if (request.NewPassword != request.ConfirmNewPassword)
            {
                return BadRequest(new { message = "New password and confirmation do not match." });
            }

            PasswordHasherMethod.CreatePasswordHash(request.NewPassword, out byte[] newPasswordHash, out byte[] newPasswordSalt);

            user.PasswordHash = newPasswordHash;
            user.PasswordSalt = newPasswordSalt;
            user.Password = request.NewPassword;

            try
            {
                _db.Users.Update(user);
                _db.SaveChanges();
                return Ok(new { message = "Password changed successfully." });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { message = "An error occurred while saving changes." });
            }
        }

        [HttpPut("IncreaseUserPoints/{id}")]
        public IActionResult IncreasePoints(int id)
        {
            var user = _db.Users.Find(id);
            if (user.Points == null)
            {
                user.Points = 0;
            }

            user.Points += 5;

            _db.Users.Update(user);
            _db.SaveChanges();

            return Ok(user);

        }


        [HttpPut("SetPointsToZero/{id}")]
        public IActionResult SetPointsToZero(int id)
        {
            var user = _db.Users.Find(id);
            if (user.Points == null)
            {
                user.Points = 0;
            }

            user.Points = 0;

            _db.Users.Update(user);
            _db.SaveChanges();

            return Ok(user);

        }










        //-------------------------------------------------------------------------------------------------------------------


        [HttpPost("register")]
        public ActionResult Register([FromForm] UsersDTO model)
        {
            // Hash the password
            byte[] passwordHash, passwordSalt;
            PasswordHasher.CreatePasswordHash(model.Password, out passwordHash, out passwordSalt);

            var user = new User
            {
                Name = model.Name,
                PasswordHash = passwordHash,
                PasswordSalt = passwordSalt,
                Password = model.Password,
                Email = model.Email
            };

            _db.Users.Add(user);
            _db.SaveChanges();

            return Ok(user);
        }

        //------------------------------------------------------------------------------------------


        // Add a new user with hashed password
        [HttpPost]
        [Route("AddUser")]
        public IActionResult AddUser([FromForm] UsersDTO newUser)
        {
            byte[] passwordHash, passwordSalt;
            PasswordHasherMethod.CreatePasswordHash(newUser.Password, out passwordHash, out passwordSalt);
            User user = new User
            {
                Name = newUser.Name,
                Email = newUser.Email,
                Password = newUser.Password,

                PasswordHash = passwordHash,
                PasswordSalt = passwordSalt
            };


            _db.Users.Add(user);
            _db.SaveChanges();
            return Ok(new { message = "User added successfully.", user });
        }

        //------------------------------------------------------------------------------------------




        /* [HttpPost("login")]
         public IActionResult Login([FromForm] DTOsLogin model)
         {

             // Regular email/password login
             var user = _db.Users.FirstOrDefault(x => x.Email == model.Email);
             if (user == null || !PasswordHasher.VerifyPasswordHash(model.Password, user.PasswordHash, user.PasswordSalt))
             {
                 return Unauthorized("Invalid username or password.");
             }

             // Retrieve roles and generate JWT token
             var token = _tokenGenerator.GenerateToken(user.Name);

             return Ok(new { Token = token, userID = user.UserId, userName = user.Name });
         }
         [HttpPost("Google")]
         public IActionResult RegisterationFromGoogle([FromForm] RegisterGoogleDTO model)
         {
             var userfetch = _db.Users.Where(x => x.Email == model.email).FirstOrDefault();

             if (userfetch == null)
             {
                 var user = new User
                 {
                     Name = model.displayName,
                     Email = model.email,
                     Image = model.photoURL,
                 };
                 _db.Users.Add(user);
                 _db.SaveChanges();
                 return Ok(user);
             }
             else
             {

                 var user = _db.Users.FirstOrDefault(x => x.Email == model.email);
                 if (user == null || !PasswordHasher.VerifyPasswordHash(user.Password, user.PasswordHash, user.PasswordSalt))
                 {
                     return Unauthorized("Invalid username or password.");
                 }

                 // Retrieve roles and generate JWT token
                 var token = _tokenGenerator.GenerateToken(user.Name);

                 return Ok(new { Token = token, userID = user.UserId, userName = user.Name });
             }

         }*/









        [HttpPost("CreatePassword")]
        public IActionResult CreatePassword([FromForm] string displayName, [FromForm] string Password)
        {
            byte[] passwordHash, passwordSalt;
            PasswordHasher.CreatePasswordHash(Password, out passwordHash, out passwordSalt);

            var User = _db.Users.Where(x => x.Name == displayName).FirstOrDefault();
            User.PasswordHash = passwordHash;
            User.PasswordSalt = passwordSalt;
            User.Password = Password;


            _db.Users.Update(User);
            _db.SaveChanges();
            return Ok(User);
        }

        [HttpPost("send")]
        public async Task<IActionResult> SendEmail([FromForm] EmailRequest request)
        {
            // Generate OTP
            var otp = OtpGenerator.GenerateOtp();
            var user = _db.Users.Where(x => x.Email == request.ToEmail).FirstOrDefault();
            user.Password = otp;
            _db.SaveChanges();

            // Create email body including the OTP
            var emailBody = $"<p>Hello,</p><p>Your OTP code is: <strong>{otp}</strong></p><p>Thank you.</p>";
            var Subject = "send OTP";
            // Send email with OTP
            await _emailService.SendEmailAsync(request.ToEmail, Subject, emailBody);

            return Ok(new { message = "Email sent successfully.", otp, user.UserId }); // Optionally return the OTP for testing
        }
        [HttpPost("GetOTP")]
        public IActionResult GetOTP([FromForm] DTOsOTP request, int id)
        {
            var user = _db.Users.Find(id);
            if (user.Password == request.OTP)
            {

                return Ok();


            }
            return BadRequest();
        }

        [HttpPut("editPassword")]
        public IActionResult EditPassword([FromForm] DTOsEditPassword request, int id)
        {
            var user = _db.Users.Find(id);
            byte[] passwordHash, passwordSalt;
            PasswordHasher.CreatePasswordHash(request.Password, out passwordHash, out passwordSalt);
            user.Password = request.Password;
            user.PasswordSalt = passwordSalt;
            user.PasswordHash = passwordHash;
            _db.SaveChanges();
            return Ok(user);

        }

        [HttpPost("registerAdmin")]
        public ActionResult RegisterAdmin([FromForm] UsersDTO model)
        {
            // Hash the password
            byte[] passwordHash, passwordSalt;
            PasswordHasher.CreatePasswordHash(model.Password, out passwordHash, out passwordSalt);

            var user = new Admin
            {
                Name = model.Name,
                PasswordHash = passwordHash,
                PasswordSalt = passwordSalt,
                Password = model.Password,
                Email = model.Email
            };

            _db.Admins.Add(user);
            _db.SaveChanges();

            return Ok(user);
        }
        /* [HttpPost("loginAdmin")]
         public IActionResult LoginAdmin([FromForm] DTOsLogin model)
         {

             // Regular email/password login
             var user = _db.Admins.FirstOrDefault(x => x.Email == model.Email);
             if (user == null || !PasswordHasher.VerifyPasswordHash(model.Password, user.PasswordHash, user.PasswordSalt))
             {
                 return Unauthorized("Invalid username or password.");
             }

             // Retrieve roles and generate JWT token
             var token = _tokenGenerator.GenerateToken(user.Name);

             return Ok(new { Token = token, userID = user.AdminId });
         }
        */


        // Login action
        [HttpPost]
        [Route("Login")]
        public IActionResult Login([FromForm] LoginDTO loginRequest)
        {
            var user = _db.Users.FirstOrDefault(u => u.Email == loginRequest.Email);

            if (user == null)
            {
                return Unauthorized(new { message = "Invalid email ." });
            }

            // Verify the password
            if (!PasswordHasherMethod.VerifyPasswordHash(loginRequest.Password, user.PasswordHash, user.PasswordSalt))
            {
                return Unauthorized(new { message = "Invalid password." });
            }


            // Generate a token or return a successful response
            // Retrieve roles and generate JWT token
            var roles = _db.UserRoles.Where(x => x.UserId == user.UserId).Select(ur => ur.Role).ToList();
            var token = _tokenGenerator.GenerateToken(user.Name, roles);

            return Ok(new { Token = token, userID = user.UserId });
        }






        [HttpPost("Google")]
        public IActionResult RegisterationFromGoogle([FromForm] LoginGoogleDTOs model)
        {
            var userfetch = _db.Users.Where(x => x.Email == model.email).FirstOrDefault();

            if (userfetch == null)
            {
                var user = new User
                {
                    Name = model.displayName,
                    Email = model.email,
                    Image = model.photoURL,
                };
                _db.Users.Add(user);
                _db.SaveChanges();
                return Ok(user);
            }
            else
            {

                var user = _db.Users.FirstOrDefault(x => x.Email == model.email);
                if (user == null || !PasswordHasher.VerifyPasswordHash(user.Password, user.PasswordHash, user.PasswordSalt))
                {
                    return Unauthorized("Invalid username or password.");
                }

                // Retrieve roles and generate JWT token
                var roles = _db.UserRoles.Where(x => x.UserId == user.UserId).Select(ur => ur.Role).ToList();
                var token = _tokenGenerator.GenerateToken(user.Name, roles);

                return Ok(new { Token = token, userID = user.UserId });
            }

        }





























    }
}