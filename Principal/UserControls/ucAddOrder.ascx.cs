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
    public partial class ucAddOrder : ucOrder
    {
        public override void btnAddOrden_Click(object sender, EventArgs e)
        {
            try
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
            catch (Exception)
            {
                throw;
            }
        }
    }
}