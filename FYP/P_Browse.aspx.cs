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
    public partial class P_Browse : System.Web.UI.Page
    {
        public String custID = "";
        public String custOccu = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userid"] != null)
            {
                custOccu = getUserOccu(Session["userid"].ToString());
                
            }
            Session["userOccu"] = custOccu;
        }
        public static string getUserOccu(String username)
        {
            String userOccu = "NULL";
            String query = "Select user_occupation from users where user_username= '" + username + "'";
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();
            SqlCommand cm = new SqlCommand(query, conn);
            SqlDataReader sdr = cm.ExecuteReader();
            while (sdr.Read())
            {
                userOccu = sdr["user_occupation"].ToString();
            }

            return userOccu;
        }
    }
}