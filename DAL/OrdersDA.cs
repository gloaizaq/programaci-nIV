using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BEL;

namespace DAL
{
    public class OrdersDA
    {
        public List<Order> GetOrders()
        {
            Connection conexion = new Connection();
            try
            {
                var reader = conexion.ExecSp("sp_GetOrders");
                List<Order> orders = new List<Order>();
                while (reader.Read())
                {
                    Order order = new Order();
                    order.OrderID = Convert.ToInt32(reader["OrderID"]);
                    order.CustomerID = reader["CustomerID"].ToString();
                    order.EmployeeID = Convert.ToInt32(reader["EmployeeID"]);
                    order.OrderDate = Convert.ToDateTime(reader["OrderDate"]);
                    order.RequiredDate = Convert.ToDateTime(reader["RequiredDate"]);
                    
                    if (reader["ShippedDate"] != DBNull.Value)
                    {
                        order.ShippedDate = Convert.ToDateTime(reader["ShippedDate"]);
                    }
                    
                    order.ShipVia = Convert.ToInt32(reader["ShipVia"]);
                    order.Freight = Convert.ToInt32(reader["Freight"]);
                    order.ShipName = reader["ShipName"].ToString();
                    order.IdState = Convert.ToInt32(reader["IdState"]);

                    orders.Add(order);
                }
                return orders;
            }
            finally
            {
                conexion.CerrarConexionBD();
            }
        }

    }
}
