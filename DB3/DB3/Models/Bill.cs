﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace DB3.Models
{
    public class Bill
    {
        public int Bill_Id { get; set; }
        [Required]
        public DateTime Date { get; set; }
        [Required]
        public int Price { get; set; }
        [Required]
        public int Quantity { get; set; }
        
        public int CustomerID { get; set; }
        public int OrderID { get; set; }


    }
}