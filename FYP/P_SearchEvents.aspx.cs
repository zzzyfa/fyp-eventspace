using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FYP
{
    public partial class P_SearchEvents : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string key = Request.QueryString["key"];
            lblSearch.Text = key;
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string key = txtSearch.Text;
            Response.Redirect("P_SearchEvents.aspx?key=" + key);
        }
    }
}