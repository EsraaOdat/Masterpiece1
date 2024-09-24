using E_Commerce.Models;
using System;

namespace E_Commerce.Dto_Esraa
{
    public class PasswordHasherMethod
    {
        public static void CreatePasswordHash(string password, out byte[] passwordHash, out byte[] passwordSalt)
        {
            using (var hmac = new System.Security.Cryptography.HMACSHA512())
            {
                passwordSalt = hmac.Key; // The Key property provides a randomly generated salt.
                passwordHash = hmac.ComputeHash(System.Text.Encoding.UTF8.GetBytes(password));
            }
        }




        public static bool VerifyPasswordHash(string password, byte[] passwordHash, byte[] passwordSalt)
        {
            using (var hmac = new System.Security.Cryptography.HMACSHA512(passwordSalt))
            {
                /*                passwordSalt = hmac.Key; // The Key property provides a randomly generated salt.
                */

                var passwordHash1 = hmac.ComputeHash(System.Text.Encoding.UTF8.GetBytes(password));
                return passwordHash1.SequenceEqual(passwordHash);

            }
        }
    }
}
