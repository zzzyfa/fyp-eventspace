using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FYP
{
    public partial class Logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) //check if the webpage is loaded for the first time.
            {
                ViewState["PreviousPage"] = Request.UrlReferrer;//Saves the Previous page url in ViewState
            }
            if (Session["userid"] != null)
            {
                Session.Abandon();
                if (ViewState["PreviousPage"] != null)  //Check if the ViewState 
                                                        //contains Previous page URL
                {
                    Response.Redirect(ViewState["PreviousPage"].ToString());//Redirect to 
                                                                            //Previous page by retrieving the PreviousPage Url from ViewState.
                }
                else
                {
                    Response.Redirect("Home.aspx");
                }
            }
        }
    }
}