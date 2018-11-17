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

namespace FYP
{
    public partial class EO_ReportDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
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
                }
                totalamount = Convert.ToDecimal(price) * Convert.ToDecimal(count);
                lblAmount.Text = totalamount.ToString();



                ////use a datatable for storing all the data
                //DataTable dt = new DataTable();
                //string query = "SELECT p.event_id,  p.payment_timestamp,  p.user_id, c.event_name, u.user_name, u.user_mobile_no, u.user_email, u.user_alt_email, u.user_occupation, u.user_shirt_size, u.user_food FROM EVENTS_PURCHASED AS p INNER JOIN EVENTS_CREATED AS c ON p.event_id = c.event_id INNER JOIN USERS AS u ON p.user_id = u.user_id WHERE ((p.event_id=@custID) AND (u.user_name=@user_name))";

                //SqlCommand cmd = new SqlCommand(query, conn);
                //cmd.Parameters.AddWithValue("@custID", id);
                //cmd.Parameters.AddWithValue("@user_name", txtSearch.Text);
                ////wrapping in 'using' means the connection is closed an disposed when done
                ////using (SqlConnection conn)
                //using (SqlDataAdapter adapter = new SqlDataAdapter(query, conn))
                //{
                //    try
                //    {
                //        //fill the datatable with the contents from the database
                //        adapter.Fill(dt);
                //    }
                //    catch
                //    {
                //    }
                //}

                ////save the datatable into a viewstate for later use
                //ViewState["myViewState"] = dt;

                ////bind the datasource to the gridview
                //GridView2.DataSource = dt;
                //GridView2.DataBind();
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
            //string searchTerm = txtSearch.Text.ToLower();

            ////check if the search input is at least 3 chars
            //if (searchTerm.Length >= 3)
            //{
            //    //always check if the viewstate exists before using it
            //    if (ViewState["myViewState"] == null)
            //        return;

            //    //cast the viewstate as a datatable
            //    DataTable dt = ViewState["myViewState"] as DataTable;

            //    //make a clone of the datatable
            //    DataTable dtNew = dt.Clone();

            //    //search the datatable for the correct fields
            //    foreach (DataRow row in dt.Rows)
            //    {
            //        //add your own columns to be searched here
            //        if (row["user_name"].ToString().ToLower().Contains(searchTerm) )
            //        {
            //            //when found copy the row to the cloned table
            //            dtNew.Rows.Add(row.ItemArray);
            //        }
            //    }

            //    //rebind the grid
            //    GridView2.DataSource = dtNew;
            //    GridView2.DataBind();
            }
        }
    }
