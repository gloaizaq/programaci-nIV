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
    public partial class wfrmAddOrders : System.Web.UI.Page
    {
        public List<OrderDetail> orderDetails
        {
            get
            {
                if (this.ViewState["orderDetails"] == null)
                {
                    this.ViewState["orderDetails"] = new List<OrderDetail>();
                }
                return (List<OrderDetail>)(this.ViewState["orderDetails"]);
            }
            set
            {
                if (this.ViewState["orderDetails"] != null)
                {
                    this.ViewState["orderDetails"] = value;
                }
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarDropDownList(stateDropDownList, StateBL.GetActiveStates(), "Name", "Id");
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
        private int AddOrder()
        {
            Order order = new Order();
            order.CustomerID = "PERIC";//customerDropDownList.SelectedValue;
            order.EmployeeID = 1;//Convert.ToInt32(employeeDropDownList.SelectedValue);
            order.OrderDate = DateTime.ParseExact(orderDateTextBox.Text.Trim(), "dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture);
            order.RequiredDate = DateTime.ParseExact(requiredDateTextBox.Text.Trim(), "dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture);
            order.ShippedDate = DateTime.ParseExact(shippedDateTextBox.Text.Trim(), "dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture);
            order.ShipVia = 1;//Convert.ToInt32(shipViaDropDownList.SelectedValue);
            order.Freight = Convert.ToDouble(freightTextBox.Text.Trim());
            order.ShipName = shipNameTextBox.Text.Trim();
            order.IdState = Convert.ToInt32(stateDropDownList.SelectedValue);
            
            return OrderBL.AddOrder(order);
        }
        private void AddOrderDetails(int orderID)
        {
            foreach(var detail in orderDetails)
            {
                detail.OrderID = orderID;
                OrderBL.AddOrderDetail(detail);
            }
        }
        protected void btnAddOrden_Click(object sender, EventArgs e)
        {
            try
            {
                int orderID = AddOrder();
                AddOrderDetails(orderID);
                Response.Redirect("wfrmOrdersList.aspx");
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
                OrderDetail orderDetail = new OrderDetail();
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
    }
}