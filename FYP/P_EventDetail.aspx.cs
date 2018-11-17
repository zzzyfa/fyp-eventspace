using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FYP
{
    public partial class P_EventDetail : System.Web.UI.Page
    {
        public String custID;
        public String free = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            string prodID = Request.QueryString["id"];
            
            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(constr);
            conn.Open();
            SqlCommand cm = new SqlCommand("SELECT * FROM EVENTS_CREATED WHERE event_id=" + prodID, conn);
            SqlDataReader sdr = cm.ExecuteReader();
            while (sdr.Read())
            {
                
                free = sdr["event_free"].ToString();
                
            }
            
        }

        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            if (Session["userid"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            else
            {
                custID = getUserID(Session["userid"].ToString());
                
                string prodID = Request.QueryString["id"];

                Response.Redirect("P_Registration.aspx?prodid=" + prodID +  "&custid=" + custID + "");
            }
        }
        public static string getUserID(String userEmail)
        {
            String userID = "NULL";
            String query = "Select * from USERS where user_username= '" + userEmail + "'";
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();
            SqlCommand cm = new SqlCommand(query, conn);
            SqlDataReader sdr = cm.ExecuteReader();
            while (sdr.Read())
            {
                userID = sdr["user_id"].ToString();
            }

            return userID;
        }
    }
}