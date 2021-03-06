﻿using System;
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
using System.Web.UI.DataVisualization.Charting;
using System.Text;

namespace FYP
{
    public partial class EO_ReportDetail : System.Web.UI.Page
    {
        public int shirt = 0;
        public int food = 0;

        
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
                    shirt = Convert.ToInt32(sdr["event_shirt"]);
                    food = Convert.ToInt32(sdr["event_food"]);
                }
                totalamount = Convert.ToDecimal(price) * Convert.ToDecimal(count);
                lblAmount.Text = totalamount.ToString();
                
                //for shirt size                    
                int countXS = 0;
                int countS = 0;
                int countM = 0;
                int countL = 0;
                int countXL = 0;
                int countXXL = 0;
                foreach (GridViewRow gvRow in GridView2.Rows)
                {
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
                
                //for food preference
                int countV = 0;
                int countNV = 0;
                foreach (GridViewRow gvRow in GridView2.Rows)
                {
                    string strFood = gvRow.Cells[7].Text;

                    if (strFood == "Vegetarian")
                        countV++;
                    if (strFood == "Non-vegetarian")
                        countNV++;
                }



                int[] yValuesShirt = { countXS, countS, countM, countL, countXL, countXXL };
                string[] xValuesShirt = { "XS", "S", "M", "L", "XL", "XXL"  };
                ChartShirt.Series["SeriesShirt"].Points.DataBindXY(xValuesShirt, yValuesShirt);
                ChartShirt.Series["SeriesShirt"].IsValueShownAsLabel = true;
                ChartShirt.ChartAreas["ChartArea1"].AxisX.LabelStyle.Font = 
                    new System.Drawing.Font("Trebuchet MS", 11F, System.Drawing.FontStyle.Bold);
                
                int[] yValuesFood = { countV, countNV };
                string[] xValueFood = { "Vegetarian", "Non-vegetarian"};
                ChartFood.Series["SeriesFood"].Points.DataBindXY(xValueFood, yValuesFood);
                ChartFood.Series["SeriesFood"].IsValueShownAsLabel = true;
                ChartFood.ChartAreas["ChartArea1"].AxisX.LabelStyle.Font = 
                    new System.Drawing.Font("Trebuchet MS", 11F, System.Drawing.FontStyle.Bold);
            }
        }


        

        public void refreshdata()
        {
            String custID = Request.QueryString["id"];
            SqlConnection con = new SqlConnection
                (ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand
            ("SELECT p.event_id,  p.payment_timestamp,  p.user_id, c.event_name, c.event_shirt, c.event_food, u.user_name, "+
            "u.user_mobile_no, u.user_email, u.user_alt_email, u.user_occupation, u.user_shirt_size, u.user_food"+
            " FROM [EVENTS_PURCHASED] AS p INNER JOIN EVENTS_CREATED AS c ON p.event_id = c.event_id INNER JOIN [USERS] AS u "+
            "ON p.user_id = u.user_id WHERE p.event_id =" + custID, con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            con.Open();
            SqlDataReader sdr = cmd.ExecuteReader();

            while (sdr.Read())
            {
                shirt = Convert.ToInt32(sdr["event_shirt"]);
                food = Convert.ToInt32(sdr["event_food"]);
            }
            if (shirt == 0)
            {
                GridView2.Columns[6].Visible = false;
                pnlShirt.Visible = false;
            }
            if(food == 0)
            {
                GridView2.Columns[7].Visible = false;
                pnlFood.Visible = false;
            }

            con.Close();
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





        protected void btnExport_Click(object sender, EventArgs e)
        {
            // set the resulting file attachment name to the name of the report...
            string fileName = "Event Sales Report";
            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename=" + fileName + ".csv");
            Response.Charset = "";
            Response.ContentType = "application/text";
            System.Text.StringBuilder sb = new System.Text.StringBuilder();

            // Get the header row text form the sortable columns
            LinkButton headerLink = new LinkButton();
            string headerText = string.Empty;

            for (int k = 0; k < GridView2.HeaderRow.Cells.Count; k++)
            {
                //add separator
                headerLink = GridView2.HeaderRow.Cells[k].Controls[0] as LinkButton;
                headerText = headerLink.Text;
                sb.Append(headerText + ",");
            }
            //append new line
            sb.Append("\r\n");
            for (int i = 0; i < GridView2.Rows.Count; i++)
            {
                for (int k = 0; k < GridView2.HeaderRow.Cells.Count; k++)
                {
                    //add separator and strip "," values from returned content...

                    sb.Append(GridView2.Rows[i].Cells[k].Text.Replace(",", "") + ",");
                }
                //append new line
                sb.Append("\r\n");
            }
            Response.Output.Write(sb.ToString());
            Response.Flush();
            Response.End();
        }
    }
}
