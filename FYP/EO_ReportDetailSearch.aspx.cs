using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using System.Text.RegularExpressions;

namespace FYP
{
    public partial class EO_ReportDetailSearch : System.Web.UI.Page
    {
        public String shirt = "";
        public String food = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userid"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else if (!Page.IsPostBack)

            {
                refreshdata();
                string key = Request.QueryString["key"];
                lblSearch.Text = key;

                lblTickets.Text = this.GridView2.Rows.Count.ToString();
                string count = this.GridView2.Rows.Count.ToString();
                string price = "";
                decimal totalamount = 0;
                string id = Request.QueryString["id"];
                string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                SqlConnection conn = new SqlConnection(constr);
                conn.Open();
                SqlCommand cm = new SqlCommand("SELECT * FROM events_created WHERE event_id=" + id, conn);
                SqlDataReader sdr = cm.ExecuteReader();
                while (sdr.Read())
                {
                    price = sdr["event_price"].ToString();
                    shirt = sdr["event_shirt"].ToString();
                    food = sdr["event_food"].ToString();
                }
                totalamount = Convert.ToDecimal(price) * Convert.ToDecimal(count);
                lblAmount.Text = totalamount.ToString();


            }
        }
        public void refreshdata()
        {
            String key = Request.QueryString["key"];
            String custID = Request.QueryString["id"];
            SqlConnection con = new SqlConnection
                (ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand
            //("SELECT * FROM [EVENTS_CREATED] WHERE event_id=" + custID, con);
            ("SELECT p.event_id,  p.payment_timestamp,  p.user_id, c.event_name, u.user_name, u.user_mobile_no, u.user_email, u.user_alt_email, u.user_occupation, u.user_shirt_size, u.user_food FROM [EVENTS_PURCHASED] AS p INNER JOIN EVENTS_CREATED AS c ON p.event_id = c.event_id INNER JOIN [USERS] AS u ON p.user_id = u.user_id WHERE u.user_name LIKE '%' + @full_name + '%' AND p.event_id =" + custID , con);
            cmd.Parameters.AddWithValue("@full_name", key);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            GridView2.DataSource = dt;
            GridView2.DataBind();
            ViewState["dirState"] = dt;
            ViewState["sortdr"] = "Asc";
        }
        protected void gridView_Sorting(object sender, GridViewSortEventArgs e)
        {
            DataTable dtrslt = (DataTable)ViewState["dirState"];
            if (dtrslt.Rows.Count > 0)
            {
                if (Convert.ToString(ViewState["sortdr"]) == "Asc")
                {
                    dtrslt.DefaultView.Sort = e.SortExpression + " Desc";
                    ViewState["sortdr"] = "Desc";
                }
                else
                {
                    dtrslt.DefaultView.Sort = e.SortExpression + " Asc";
                    ViewState["sortdr"] = "Asc";
                }
                GridView2.DataSource = dtrslt;
                GridView2.DataBind();
            }
        }

        
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string key = txtSearch.Text;
            Response.Redirect("EO_ReportDetailSearch.aspx?key=" + key);
        }

        protected void btnReload_Click(object sender, EventArgs e)
        {
            String custID = Request.QueryString["id"];
            Response.Redirect("EO_ReportDetail.aspx?id="+custID);
        }



    }
}