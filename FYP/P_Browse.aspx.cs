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
        DateTime startdate = new DateTime();
        DateTime enddate = new DateTime();
        public String start = "hi";
        public String end = "hi2";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userid"] != null)
            {
                custOccu = getUserOccu(Session["userid"].ToString());
                
            }
            Session["userOccu"] = custOccu;

            hiddenToday.Value = DateTime.Today.ToShortDateString();

            //string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            //SqlConnection conn = new SqlConnection(constr);
            //conn.Open();
            //SqlCommand cm = new SqlCommand("SELECT * FROM EVENTS_CREATED", conn);
            //SqlDataReader sdr = cm.ExecuteReader();
            //while (sdr.Read())
            //{

                
            //    //startdate = sdr["event_start_date"].ToString();
            //    startdate = (DateTime)sdr["event_start_date"];
            //    enddate = (DateTime)sdr["event_end_date"];
               

            //}

            //start = startdate.ToString("dd MMMM, yyyy");
            //end = enddate.ToString("dd MMMM, yyyy");



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

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string key = txtSearch.Text;
            Response.Redirect("P_SearchEvents.aspx?key=" + key);
        }

        protected void btnReload_Click(object sender, EventArgs e)
        {
            Response.Redirect("P_Browse.aspx");
        }
    }
}