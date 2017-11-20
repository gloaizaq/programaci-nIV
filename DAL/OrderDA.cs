using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BEL;
using System.Data.SqlClient;

namespace DAL
{
    public class OrderDA
    {
        public List<Order> GetOrders()
        {
            Connection conexion = new Connection();
            try
            {
                var reader = conexion.ExecStoredProc("sp_GetOrders");
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
        public static Order GetOrderById(int orderId)
        {
            Connection conexion = new Connection();
            try
            {
                List<SqlParameter> parametros = new List<SqlParameter>();
                parametros.Add(new SqlParameter("@OrderID", orderId));

                var reader = conexion.ExecStoredProc("sp_GetOrderByID", parametros);
                
                if (!reader.Read())
                    throw new InvalidOperationException("No hay datos.");

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

                if (reader.Read())
                    throw new InvalidOperationException("Se devolvió más de un dato.");

                return order;
            }
            finally
            {
                conexion.CerrarConexionBD();
            }
        }
        public static int AddOrder(Order orden)
        {
            Connection conexion = new Connection();
            try
            {
                SqlCommand cmd = new SqlCommand("sp_AddOrder", conexion.Con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@CustomerID", orden.CustomerID));
                cmd.Parameters.Add(new SqlParameter("@EmployeeID", orden.EmployeeID));
                cmd.Parameters.Add(new SqlParameter("@OrderDate", orden.OrderDate));
                cmd.Parameters.Add(new SqlParameter("@RequiredDate", orden.RequiredDate));
                cmd.Parameters.Add(new SqlParameter("@ShippedDate", orden.ShippedDate));
                cmd.Parameters.Add(new SqlParameter("@ShipVia", orden.ShipVia));
                cmd.Parameters.Add(new SqlParameter("@Freight", orden.Freight));
                cmd.Parameters.Add(new SqlParameter("@ShipName", orden.ShipName));
                cmd.Parameters.Add(new SqlParameter("@IdState", orden.IdState));

                conexion.AbrirConexionBD();
                //cmd.ExecuteNonQuery();
                return (int) cmd.ExecuteScalar();
            }
            finally
            {
                conexion.CerrarConexionBD();
            }
        }
        public static void AddOrderDetail(OrderDetail orderDetail)
        {
            Connection conexion = new Connection();
            try
            {
                SqlCommand cmd = new SqlCommand("sp_AddOrderDetail", conexion.Con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@OrderID", orderDetail.OrderID));
                cmd.Parameters.Add(new SqlParameter("@ProductID", orderDetail.ProductID));
                cmd.Parameters.Add(new SqlParameter("@UnitPrice", orderDetail.UnitPrice));
                cmd.Parameters.Add(new SqlParameter("@Quantity", orderDetail.Quantity));
                cmd.Parameters.Add(new SqlParameter("@Discount", orderDetail.Discount));

                conexion.AbrirConexionBD();
                cmd.ExecuteNonQuery();
            }
            finally
            {
                conexion.CerrarConexionBD();
            }
        }
    }
}
