using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BEL;
using BLL;

namespace Principal.wfrmOrders
{
    public partial class wfrmOrderDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarOrder();
            }
        }

        private void CargarOrder()
        {
            int orderID = Convert.ToInt32(Session["orderID"].ToString());
            Order order = OrderBL.GetOrderById(orderID);

            CompradorLabel.Text = order.Customer.ContactName;
            CompanniaLabel.Text = order.Customer.CompanyName;
            DireccionLabel.Text = order.Customer.Address;
            TelefonoLabel.Text = order.Customer.Phone;

            OrderIDLabel.Text = order.OrderID.ToString();
            CustomerIDLabel.Text = order.Customer.ContactName.ToString();
            EmployeeIDLabel.Text = order.Employee.FirstName.ToString() + " " + order.Employee.LastName.ToString();
            OrderDateLabel.Text = order.OrderDate.HasValue ? order.OrderDate.Value.ToString("dd-MM-yyyy") : "Sin fecha";
            RequiredDateLabel.Text = order.RequiredDate.HasValue ? order.RequiredDate.Value.ToString("dd-MM-yyyy") : "Sin fecha";
            ShippedDateLabel.Text = order.ShippedDate.HasValue ? order.ShippedDate.Value.ToString("dd-MM-yyyy") : "Sin fecha";
            ShipViaLabel.Text = order.Shipper.CompanyName.ToString();
            FreightLabel.Text = order.Freight.ToString();
            ShipNameLabel.Text = order.ShipName;
            IdStateLabel.Text = order.State.Name.ToString();
        }
    }
}