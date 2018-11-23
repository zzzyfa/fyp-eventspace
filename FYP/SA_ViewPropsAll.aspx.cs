using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FYP
{
    public partial class SA_ViewPropsAll : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userid"] == null)
            {
                Response.Redirect("Login.aspx");
            }
        }
        protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            int crow;
            crow = Convert.ToInt32(e.CommandArgument.ToString());
            string v = GridView2.Rows[crow].Cells[0].Text;

            Response.Redirect("SA_PropDetails.aspx?id=" + v);
        }
    }
}