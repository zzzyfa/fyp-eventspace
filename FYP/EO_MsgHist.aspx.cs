﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FYP
{
    public partial class EO_MsgHist : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userid"] == null)
            {
                Response.Redirect("Login.aspx");
            }
        }
        protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            int crow;
            crow = Convert.ToInt32(e.CommandArgument.ToString());
            string v = GridView2.Rows[crow].Cells[0].Text;

            Response.Redirect("EO_MsgContent.aspx?id=" + v);
        }
        public static string Shorten(this string name, int chars)
        {
            if (name.ToCharArray().Count() > chars)
            {
                return name.Substring(0, chars) + "...";
            }
            else return name;
        }
    }
}