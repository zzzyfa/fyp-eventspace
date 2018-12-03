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
    public partial class EO_ReportDetail : System.Web.UI.Page
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


                int countXS = 0;
                int countS = 0;
                int countM = 0;
                int countL = 0;
                int countXL = 0;
                int countXXL = 0;

                foreach (GridViewRow gvRow in GridView2.Rows)

                {

                    // if it is bound field, you can directly access through its cell no

                    string strShirt = gvRow.Cells[6].Text;
                    
                    if (strShirt == "XS")
                        countXS++;
                    if (strShirt == "S")
                        countS++;
                    if (strShirt == "M")
                        countM++;
                    if (strShirt == "L")
                        countL++;
                    if (strShirt == "XL")
                        countXL++;
                    if (strShirt == "XXL")
                        countXXL++;

                }
                lblXS.Text = countXS.ToString();
                lblS.Text = countS.ToString();
                lblM.Text = countM.ToString();
                lblL.Text = countL.ToString();
                lblXL.Text = countXL.ToString();
                lblXXL.Text = countXXL.ToString();

                int countV = 0;
                int countNV = 0;

                foreach (GridViewRow gvRow in GridView2.Rows)

                {

                    // if it is bound field, you can directly access through its cell no

                    string strFood = gvRow.Cells[7].Text;

                    if (strFood == "Vegetarian")
                        countV++;
                    if (strFood == "Non-vegetarian")
                        countNV++;
                    

                }
                lblV.Text = countV.ToString();
                lblNV.Text = countNV.ToString();

                





            }
        }
        public void refreshdata()
        {
            String custID = Request.QueryString["id"];
            SqlConnection con = new SqlConnection
                (ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand
            //("SELECT * FROM [EVENTS_CREATED] WHERE event_id=" + custID, con);
            ("SELECT p.event_id,  p.payment_timestamp,  p.user_id, c.event_name, u.user_name, u.user_mobile_no, u.user_email, u.user_alt_email, u.user_occupation, u.user_shirt_size, u.user_food FROM [EVENTS_PURCHASED] AS p INNER JOIN EVENTS_CREATED AS c ON p.event_id = c.event_id INNER JOIN [USERS] AS u ON p.user_id = u.user_id WHERE p.event_id =" + custID, con);
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
            String custID = Request.QueryString["id"];
            Response.Redirect("EO_ReportDetailSearch.aspx?key=" + key + "&id=" + custID + "");
        }

        protected void btnReload_Click(object sender, EventArgs e)
        {
            String custID = Request.QueryString["id"];
            Response.Redirect("EO_ReportDetail.aspx?id=" + custID);
        }


        
    }
}
