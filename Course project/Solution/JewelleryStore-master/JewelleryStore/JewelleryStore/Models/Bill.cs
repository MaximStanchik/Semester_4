using System;
using System.Collections.Generic;

namespace JewelleryStore;

public partial class Bill
{
    public int BillId { get; set; }

    public DateTime DateOfOrder { get; set; }

    public decimal TotalPrice { get; set; }

    public int UserId { get; set; }

    //изменено:
    //public string? City { get; set; }
    //public string? Apartment { get; set; }
    //public string? Entrance { get; set; }
    //public int Floor { get; set; }
    //public string? Street { get; set; }
    //public string? DeliveryType { get; set; }
    //public string? Status { get; set; }
    //public string? Comment { get; set; }
    //public string? House { get; set; }

    //тут изменения закончились

    public virtual ICollection<OrderInfo> OrderInfos { get; } = new List<OrderInfo>();

    public virtual User User { get; set; } = null!;
}
