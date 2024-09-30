using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using E_Commerce.Models;

namespace E_Commerce.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CoponsController : ControllerBase
    {
        private readonly MyDbContext _context;

        public CoponsController(MyDbContext context)
        {
            _context = context;
        }

        // GET: api/Copons
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Copon>>> GetCopons()
        {
            return await _context.Copons.ToListAsync();
        }

        // GET: api/Copons/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Copon>> GetCopon(int id)
        {
            var copon = await _context.Copons.FindAsync(id);

            if (copon == null)
            {
                return NotFound();
            }

            return copon;
        }

        // PUT: api/Copons/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutCopon(int id, Copon copon)
        {
            if (id != copon.CoponId)
            {
                return BadRequest();
            }

            _context.Entry(copon).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!CoponExists(id))
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

        // POST: api/Copons
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<Copon>> PostCopon(Copon copon)
        {
            _context.Copons.Add(copon);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetCopon", new { id = copon.CoponId }, copon);
        }

        // DELETE: api/Copons/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteCopon(int id)
        {
            var copon = await _context.Copons.FindAsync(id);
            if (copon == null)
            {
                return NotFound();
            }

            _context.Copons.Remove(copon);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool CoponExists(int id)
        {
            return _context.Copons.Any(e => e.CoponId == id);
        }
    }
}
