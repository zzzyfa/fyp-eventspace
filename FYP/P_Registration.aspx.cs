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
    public partial class P_Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userid"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                

            }
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
                    "UPDATE USERS SET (prodID, quantity, status, cardNo, expiry, cvv, userID, totalPrice)" +
                    " values (@prodID, @quantity, @status, @cardNo, @expiry, @cvv, @userID, @totalPrice)";


                    SqlCommand cmd = new SqlCommand(query, con);

                    cmd.Parameters.AddWithValue("@prodID", Convert.ToInt32(prodID));
                    cmd.Parameters.AddWithValue("@quantity", Convert.ToInt32(quantity));
                    cmd.Parameters.AddWithValue("@status", "Processing");
                    cmd.Parameters.AddWithValue("@cardNo", txtCardNo.Text);
                    cmd.Parameters.AddWithValue("@expiry", txtExpiry.Text);
                    cmd.Parameters.AddWithValue("@cvv", txtCVV.Text);

                    cmd.Parameters.AddWithValue("@userID", Convert.ToInt32(custID));
                    cmd.Parameters.AddWithValue("@totalPrice", Convert.ToInt32(totalprice));

                    cmd.ExecuteNonQuery();

                    Response.Redirect("OrderSuccess.aspx?prodid=" + prodID + "&quantity=" + quantity + "&custid=" + custID + "&total=" + totalprice + "");
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