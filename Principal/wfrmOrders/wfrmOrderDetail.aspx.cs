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
        //private List<Order_Detail> source;
        public List<Order_Detail> source
        {
            get
            {
                if (HttpContext.Current.Session["source"] == null)
                {
                    HttpContext.Current.Session["source"] = new List<Order_Detail>();
                }
                return (List<Order_Detail>)(HttpContext.Current.Session["source"]);
            }
            set
            {
                if (HttpContext.Current.Session["source"] != null)
                {
                    HttpContext.Current.Session["source"] = value;
                }
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarOrder();
            }
        }
        protected void Page_PreRender(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarOrder();
            }
            BindListView();
        }
        private void BindListView()
        {
            lvOrderDetails.DataSource = source;
            lvOrderDetails.DataBind();
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
            FreightLabel.Text = order.Freight.HasValue ? order.Freight.Value.ToString("0.##") : "0";
            ShipNameLabel.Text = order.ShipName;
            IdStateLabel.Text = order.State.Name.ToString();

            source = order.Order_Details.ToList();

            BindListView();

            var subtotal = OrderBL.GetTotalOrderPrice(orderID);
            var descuento = OrderBL.GetDiscountAmount(orderID);
            TotalLabel.Text = subtotal.ToString("0.##");
            MontoDescuentoLabel.Text = descuento.ToString("0.##");
            RealTotalLabel.Text = (subtotal - descuento).ToString("0.##");
        }
    }
}