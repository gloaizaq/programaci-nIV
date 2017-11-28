using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BEL;
using BLL;

namespace Principal.UserControls
{
    public partial class ucOrder : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarDropDownList(stateDropDownList, StateBL.GetActiveStates(), "Name", "Id");
            }
        }

        public void ChangeBtnText(string text)
        {
            //btnAddOrden.Text = text;
        }
        public List<Order_Detail> orderDetails
        {
            get
            {
                if (HttpContext.Current.Session["orderDetails"] == null)
                {
                    HttpContext.Current.Session["orderDetails"] = new List<Order_Detail>();
                }
                return (List<Order_Detail>)(HttpContext.Current.Session["orderDetails"]);
            }
            set
            {
                if (HttpContext.Current.Session["orderDetails"] != null)
                {
                    HttpContext.Current.Session["orderDetails"] = value;
                }
            }
        }
        
        protected void Page_PreRender(object sender, EventArgs e)
        {
            BindListView();
        }
        private void CargarDropDownList(DropDownList dropDown, object datos, string text, string value)
        {
            dropDown.DataSource = datos;
            dropDown.DataTextField = text;
            dropDown.DataValueField = value;
            dropDown.DataBind();
        }
        private void AddOrder()
        {
            Order order = new Order();
            order.CustomerID = "PERIC";//customerDropDownList.SelectedValue;
            order.EmployeeID = 1;//Convert.ToInt32(employeeDropDownList.SelectedValue);
            order.OrderDate = DateTime.ParseExact(orderDateTextBox.Text.Trim(), "dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture);
            order.RequiredDate = DateTime.ParseExact(requiredDateTextBox.Text.Trim(), "dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture);
            order.ShippedDate = DateTime.ParseExact(shippedDateTextBox.Text.Trim(), "dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture);
            order.ShipVia = 1;//Convert.ToInt32(shipViaDropDownList.SelectedValue);
            order.Freight = Convert.ToDecimal(freightTextBox.Text.Trim());
            order.ShipName = shipNameTextBox.Text.Trim();
            order.IdState = Convert.ToInt32(stateDropDownList.SelectedValue);

            order.Order_Details.AddRange(orderDetails);

            OrderBL.AddOrder(order);
        }

        public virtual void btnAddOrden_Click(object sender, EventArgs e)
        {
            try
            {
                AddOrder();
                Response.Redirect(resources.AspPages.OrderList);
            }
            catch (Exception)
            {
                throw;
            }
        }

        protected void btnAgregarDetalle_Click(object sender, EventArgs e)
        {
            try
            {
                Order_Detail orderDetail = new Order_Detail();
                orderDetail.ProductID = 1;//Convert.ToInt32(productDropDownList.SelectedValue);
                orderDetail.UnitPrice = 1000;// Convert.ToDouble(unitPriceTextBox.Text.Trim());
                orderDetail.Quantity = Convert.ToInt16(quantityTextBox.Text.Trim());
                if (discountTextBox.Text.Trim().Equals(String.Empty))
                {
                    orderDetail.Discount = 0;
                }
                else
                {
                    orderDetail.Discount = Convert.ToSingle(discountTextBox.Text.Trim());
                }

                orderDetails.Add(orderDetail);

                BindListView();
            }
            catch (Exception)
            {
                throw;
            }
        }

        private void BindListView()
        {
            orderDetails.Reverse();
            DetallesOrden.DataSource = orderDetails;
            DetallesOrden.DataBind();
            orderDetails.Reverse();
        }

        protected void BorrarDetalle_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)(sender);
            int ProductID = Convert.ToInt32(btn.CommandArgument);
            orderDetails.RemoveAll(det => det.ProductID == ProductID);
            BindListView();
        }
    }
}