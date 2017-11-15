using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace Principal
{
    public partial class wfrmOrdersList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                this.BindListView();
            }
            
        }
        protected void Page_PreRender(object sender, EventArgs e)
        {
            BindListView();
        }

        private void BindListView()
        {
            lvOrders.DataSource = OrderBL.GetOrders();
            lvOrders.DataBind();
        }

        protected void nuevaOrden_Click(object sender, EventArgs e)
        {
            Response.Redirect("wfrmAddOrders.aspx");
        }
    }
}