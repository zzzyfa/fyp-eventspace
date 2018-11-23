using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FYP
{
    public partial class P_Success : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userid"] == null)
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void btnPurchHist_Click(object sender, EventArgs e)
        {
            string custID = Request.QueryString["custid"];
            Response.Redirect("P_PurchHist.aspx?custid="+custID);
        }
    }
}