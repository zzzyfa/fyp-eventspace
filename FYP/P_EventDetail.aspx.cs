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
        public String limit = "";
        public int count = 0;
        public int limitno = 0;        
        public String startdatecon = "";
        public String enddatecon = "";
        DateTime startdate = new DateTime();
        DateTime enddate = new DateTime();
        public String start = "";
        public String end = "";
        DateTime regclose = new DateTime();
        public String close = "";
        DateTime today = new DateTime();
        public String url = HttpContext.Current.Request.Url.AbsoluteUri;
        protected void Page_Load(object sender, EventArgs e)
        {
            string url = HttpContext.Current.Request.Url.AbsoluteUri;

            string prodID = Request.QueryString["id"];
            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(constr);
            conn.Open();
            SqlCommand cm = new SqlCommand("SELECT * FROM EVENTS_CREATED WHERE event_id=" + prodID, conn);
            SqlDataReader sdr = cm.ExecuteReader();
            while (sdr.Read())
            {
                startdate = (DateTime)sdr["event_start_date"];
                enddate = (DateTime)sdr["event_end_date"];
                free = sdr["event_free"].ToString();

                limit = sdr["event_no_of_participants"].ToString();
                regclose = (DateTime)sdr["event_reg_closing_date"];
            }
            //for frontend
            start = startdate.ToString("ddd dd MMMM yyyy");
            end = enddate.ToString("ddd dd MMMM yyyy");

            //to check if still can register (registration closing date and limit no. of participants)
            hiddenRegClose.Value = DateTime.Now.ToShortDateString();
            hiddenLimit.Value = limit;
            conn.Close();

            conn.Open();
            string result = "SELECT COUNT(ticket_id) FROM EVENTS_PURCHASED WHERE event_id=" + prodID;
            SqlCommand showresult = new SqlCommand(result, conn);

            hiddenCount.Value = showresult.ExecuteScalar().ToString();
            count = Convert.ToInt32(hiddenCount.Value);
            limitno = Convert.ToInt32(hiddenLimit.Value);
            today = Convert.ToDateTime(hiddenRegClose.Value);
            if(limitno > count)
            {
                lblClose.Visible = false;
            }
            else
            {
                lblClose.Visible = true;
                btnCheckout.Visible = false;
            }
            if (today > regclose)
            {
                lblClose.Visible = true;
                btnCheckout.Visible = false;
            }

            if (Session["userid"] != null)
            {
                custID = getUserID(Session["userid"].ToString());

                string constraa = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                SqlConnection connn = new SqlConnection(constraa);
                connn.Open();
                string resultPurch = "SELECT COUNT (ticket_id) FROM EVENTS_PURCHASED WHERE event_id=" + 
                    prodID + " AND user_id=" + custID;
                SqlCommand showPurchresult = new SqlCommand(resultPurch, connn);
                hiddenPurch.Value = showPurchresult.ExecuteScalar().ToString();
                count = Convert.ToInt32(hiddenPurch.Value);
                if (count > 0)
                {
                    lblAdyReg.Visible = true;
                    btnCheckout.Visible = false;
                }
            }
        }

        


protected void btnCheckout_Click(object sender, EventArgs e)
{
    if (Session["userid"] == null)
    {
        Response.Redirect("Login2.aspx");
    }

    else
    {
        custID = getUserID(Session["userid"].ToString());
        string prodID = Request.QueryString["id"];
        Response.Redirect("P_Registration.aspx?prodid=" + prodID + "&custid=" + custID + "");
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

