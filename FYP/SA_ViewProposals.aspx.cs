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
    public partial class SA_ViewProposals : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!Page.IsPostBack)
            //{
            //    //refreshdata();
            //    FilterStatus(drlStatus);

            //}
        }
        //public void refreshdata()
        //{
        //    SqlConnection con = new SqlConnection
        //        (ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        //    SqlCommand cmd = new SqlCommand
        //        ("SELECT * FROM [EVENTS_CREATED]", con);
        //    SqlDataAdapter sda = new SqlDataAdapter(cmd);
        //    DataTable dt = new DataTable();
        //    sda.Fill(dt);
        //    GridView2.DataSource = dt;
        //    GridView2.DataBind();
        //    ViewState["dirState"] = dt;
        //    ViewState["sortdr"] = "Asc";
        //}
        //protected void gridView_Sorting(object sender, GridViewSortEventArgs e)
        //{
        //    DataTable dtrslt = (DataTable)ViewState["dirState"];
        //    if (dtrslt.Rows.Count > 0)
        //    {
        //        if (Convert.ToString(ViewState["sortdr"]) == "Asc")
        //        {
        //            dtrslt.DefaultView.Sort = e.SortExpression + " Desc";
        //            ViewState["sortdr"] = "Desc";
        //        }
        //        else
        //        {
        //            dtrslt.DefaultView.Sort = e.SortExpression + " Asc";
        //            ViewState["sortdr"] = "Asc";
        //        }
        //        GridView2.DataSource = dtrslt;
        //        GridView2.DataBind();
        //    }
        //}
        //protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        //{

        //}
        //protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
        //{

        //    int crow;
        //    crow = Convert.ToInt32(e.CommandArgument.ToString());
        //    string v = GridView2.Rows[crow].Cells[0].Text;

        //    Response.Redirect("SA_PropDetails.aspx");
        //}
       

       
    }
}