using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using E_Commerce.Models;
using E_Commerce.dto;
using Microsoft.CodeAnalysis;
using PayPal.Api;

namespace E_Commerce.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class VariantsController : ControllerBase
    {
        private readonly MyDbContext _context;

        public VariantsController(MyDbContext context)
        {
            _context = context;
        }

        // GET: api/Variants
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Variant>>> GetVariants()
        {
            return await _context.Variants.ToListAsync();
        }

        // GET: api/Variants/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Variant>> GetVariant(int id)
        {
            var variant = await _context.Variants.FindAsync(id);

            if (variant == null)
            {
                return NotFound();
            }

            return variant;
        }

        // PUT: api/Variants/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutVariant(int id, Variant variant)
        {
            if (id != variant.VariantId)
            {
                return BadRequest();
            }

            _context.Entry(variant).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!VariantExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

      




        [HttpPost]
        [Route("Product/Features")]
        public IActionResult AddVariant([FromForm] VariantDto variantDto)
        {
            var variant = new Variant
            {
                ProductId = variantDto.ProductId,
                ColorId = variantDto.ColorId,
                SizeId = variantDto.SizeId,
                TagId = variantDto.TagId,
                Quantity = variantDto.Quantity
            };

            // Add the variant entity to the database
            _context.Variants.Add(variant);
            _context.SaveChanges();

            return Ok(new { message = "Variant added successfully" });
        }












        // DELETE: api/Variants/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteVariant(int id)
        {
            var variant = await _context.Variants.FindAsync(id);
            if (variant == null)
            {
                return NotFound();
            }

            _context.Variants.Remove(variant);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool VariantExists(int id)
        {
            return _context.Variants.Any(e => e.VariantId == id);
        }
    }
}
