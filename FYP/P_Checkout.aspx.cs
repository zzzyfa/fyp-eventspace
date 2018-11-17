using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Xml;

namespace FYP
{
    public partial class P_Checkout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnProceed_Click(object sender, EventArgs e)
        {
            if (Session["userid"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                string prodID = Request.QueryString["prodid"];
                string custID = Request.QueryString["custid"];
                SqlConnection con = new
               SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                try
                {
                    con.Open();
                    string query =
                    "INSERT INTO EVENTS_PURCHASED (user_id, event_id, payment_timestamp) values (@user_id, @event_id, @payment_timestamp)";


                    SqlCommand cmd = new SqlCommand(query, con);

                    cmd.Parameters.AddWithValue("@event_id", Convert.ToInt32(prodID));
                    cmd.Parameters.AddWithValue("@user_id", Convert.ToInt32(custID));
                    cmd.Parameters.AddWithValue("@payment_timestamp", DateTime.Now.ToString());

                    cmd.ExecuteNonQuery();

                    Response.Redirect("P_Success.aspx?prodid=" + prodID +  "&custid=" + custID);
                    con.Close();
                }
                catch (Exception ex)
                {
                    System.Diagnostics.Debug.WriteLine(ex.ToString());
                    Response.Write("Error: " + ex.ToString());
                }
            }
        }
    }
}