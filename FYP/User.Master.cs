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
    public partial class Participants : System.Web.UI.MasterPage
    {
        public String custID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userid"] != null)
            {
                custID = getUserID(Session["userid"].ToString());

            }
        }
        public static string getUserID(String userEmail)
        {
            String userID = "NULL";
            String query = "Select * from users where email= '" + userEmail + "'";
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();
            SqlCommand cm = new SqlCommand(query, conn);
            SqlDataReader sdr = cm.ExecuteReader();
            while (sdr.Read())
            {
                userID = sdr["userID"].ToString();
            }

            return userID;
        }
        }
    }
}