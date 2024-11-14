using System;
using System.Collections.Generic;

namespace E_Commerce.Models;

public partial class StoreOwner
{
    public int OwnerId { get; set; }

    public int? StoreId { get; set; }

    public string? OwnerName { get; set; }

    public string? Email { get; set; }

    public string? Password { get; set; }

    public byte[]? PasswordHash { get; set; }

    public byte[]? PasswordSalt { get; set; }

    public string UserType { get; set; } = null!;

    public virtual Store? Store { get; set; }
}
