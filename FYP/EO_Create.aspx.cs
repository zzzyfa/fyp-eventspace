﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using System.Data;

namespace FYP
{
    public partial class EO_Create : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            string event_status = "pending";
            //string custID = Request.QueryString["custid"];
            int custID = 1;

            System.Diagnostics.Debug.WriteLine("Test1");
            SqlConnection con = new
        SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            System.Diagnostics.Debug.WriteLine("Test2");
            try
            {
                System.Diagnostics.Debug.WriteLine("Test3");
                con.Open();
                string file_name = uploadPic.FileName.ToString() + "";
                uploadPic.PostedFile.SaveAs(Server.MapPath("~/upload/") + file_name);
                string query = "INSERT INTO EVENTS_CREATED (event_group, event_name, event_category, event_start_date, event_end_date, event_start_time, event_end_time, event_venue, event_poster,"+
                    "event_formal_descr, event_description, event_price, event_eligibility, event_no_of_participants, event_reg_closing_date, event_resources, event_remarks, event_timestamp, event_status, user_id)" +
                    " values (@event_group, @event_name, @event_category, @event_start_date, @event_end_date, @event_start_time, @event_end_time, @event_venue, @event_poster,"+
                    "@event_formal_descr, @event_description, @event_price, @event_eligibility, @event_no_of_participants, @event_reg_closing_date, @event_resources, @event_remarks, @event_timestamp, @event_status, @user_id)";
                SqlCommand cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("@event_group", txtOrgClub.Text);
                cmd.Parameters.AddWithValue("@event_name", txtName.Text);
                cmd.Parameters.AddWithValue("@event_category", drlCategory.SelectedValue.ToString());
                cmd.Parameters.AddWithValue("@event_start_date", txtStartDate.Text);
                cmd.Parameters.AddWithValue("@event_end_date", txtEndDate.Text);
                cmd.Parameters.AddWithValue("@event_start_time", txtStartTime.Text);
                cmd.Parameters.AddWithValue("@event_end_time", txtEndTime.Text);
                cmd.Parameters.AddWithValue("@event_venue", txtVenue.Text);
                cmd.Parameters.AddWithValue("@event_formal_descr", txtFormalDesc.Text);
                cmd.Parameters.AddWithValue("@event_description", txtDescr.Text);
                //cmd.Parameters.AddWithValue("@event_free", txtDescr.Text);
                cmd.Parameters.AddWithValue("@event_no_of_participants", txtNoOfP.Text);
                cmd.Parameters.AddWithValue("@event_reg_closing_date", txtRegClose.Text);
                cmd.Parameters.AddWithValue("@event_eligibility", drlEligibility.SelectedValue.ToString());
                cmd.Parameters.AddWithValue("@event_remarks", txtRemarks.Text);
                cmd.Parameters.AddWithValue("@event_timestamp", DateTime.Now.ToString());
                cmd.Parameters.AddWithValue("@event_resources", txtResources.Text);
                cmd.Parameters.AddWithValue("@user_id", custID);
                cmd.Parameters.AddWithValue("@event_price", Convert.ToDouble(txtPrice.Text));                
                cmd.Parameters.AddWithValue("@event_poster", file_name);
                cmd.Parameters.AddWithValue("@event_status", event_status);
                System.Diagnostics.Debug.WriteLine("Test5");
                cmd.ExecuteNonQuery();
                System.Diagnostics.Debug.WriteLine("Test6");

                Response.Redirect("EO_ViewEvents.aspx");
                System.Diagnostics.Debug.WriteLine("Test7");
                con.Close();
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine(ex.ToString());
                Response.Write("Error: " + ex.ToString());
            }
        }
        protected void btnStartDate_Click(object sender, EventArgs e)
        {
            CalendarStart.Visible = true;

        }
        protected void CalendarStart_SelectionChanged(object sender, EventArgs e)
        {
            txtStartDate.Text = CalendarStart.SelectedDate.ToShortDateString();
            CalendarStart.Visible = false;
        }

        protected void btnEndDate_Click(object sender, EventArgs e)
        {
            CalendarEnd.Visible = true;

        }
        protected void CalendarEnd_SelectionChanged(object sender, EventArgs e)
        {
            txtEndDate.Text = CalendarEnd.SelectedDate.ToShortDateString();
            CalendarEnd.Visible = false;
        }
        protected void btnClosingDate_Click(object sender, EventArgs e)
        {
            CalendarClose.Visible = true;

        }
        protected void CalendarClose_SelectionChanged(object sender, EventArgs e)
        {
            txtRegClose.Text = CalendarClose.SelectedDate.ToShortDateString();
            CalendarClose.Visible = false;
        }
    }
}