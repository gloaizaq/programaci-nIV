using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BEL
{
    public class Order
    {
        public int OrderID { get; set; }
        public string CustomerID { get; set; }
        public int EmployeeID { get; set; }
        public DateTime OrderDate { get; set; }
        public DateTime RequiredDate { get; set; }
        public DateTime? ShippedDate { get; set; }
        public int ShipVia { get; set; }
        public double Freight { get; set; }
        public string ShipName { get; set; }
        public int IdState { get; set; }

        public string OrderDateString()
        {
            return OrderDate.ToString("dd MM yyyy");
        }

        //public static Order Create(IDataRecord record)
        //{
        //    return new Order
        //    {
        //        OrderID = Convert.ToInt32(record["OrderID"]),
        //        CostumerID = record["CostumerID"].ToString(),
        //        EmployeeID = Convert.ToInt32(record["EmployeeID"]),
        //        OrderDate = Convert.ToDateTime(record["OrderDate"]),
        //        RequiredDate = Convert.ToDateTime(record["RequiredDate"]),
        //        ShippedDay = Convert.ToDateTime(record["ShippedDay"]),
        //        ShipVia = Convert.ToInt32(record["ShipVia"]),
        //        Freight = Convert.ToDouble(record["Freight"]),
        //        ShipName = record["ShipName"].ToString(),
        //        IdState = Convert.ToInt32(record["IdState"])
        //    };
        //}
    }
}
