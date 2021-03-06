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

namespace FYP
{
    public partial class SA_PropDetails : System.Web.UI.Page
    {
        private object item_name;
        DateTime startdate = new DateTime();
        DateTime enddate = new DateTime();
        public String start = "";
        public String end = "";
        public String close = "";
        DateTime regclose = new DateTime();
        public string image = "";
        public object HiddenField_Id { get; private set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userid"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else if (!IsPostBack)
            {
                try
                {
                    String contact_id = Request.QueryString["id"];
                    int intTest = Convert.ToInt32(contact_id);

                    string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                    using (SqlConnection con = new SqlConnection(constr))
                    {
                        using (SqlCommand cmd = new SqlCommand("SELECT * FROM EVENTS_CREATED WHERE event_id=" + contact_id))
                        {
                            using (SqlDataAdapter sda = new SqlDataAdapter())
                            {
                                cmd.Connection = con;
                                sda.SelectCommand = cmd;
                                using (DataTable dt = new DataTable())
                                {
                                    sda.Fill(dt);
                                    //return dt;
                                    foreach (DataRow row in dt.Rows)
                                    {
                                        string itemid = row["event_id"].ToString();
                                        string item_name = row["event_name"].ToString();
                                        string group = row["event_group"].ToString();
                                        string link = row["event_fb_link"].ToString();
                                        string contactname = row["event_contact_name"].ToString();
                                        string contactno = row["event_contact_no"].ToString();
                                        startdate = (DateTime)row["event_start_date"];
                                        enddate = (DateTime)row["event_end_date"];
                                        string start_time = row["event_start_time"].ToString();
                                        string end_time = row["event_end_time"].ToString();
                                        string venue = row["event_venue"].ToString();
                                        string formal_descr = row["event_background"].ToString();
                                        string free = row["event_free"].ToString();
                                        string no_of_p = row["event_no_of_participants"].ToString();
                                        regclose = (DateTime)row["event_reg_closing_date"];
                                        string resources = row["event_resources"].ToString();
                                        string remarks = row["event_remarks"].ToString();
                                        string item_price = row["event_price"].ToString();
                                        string item_description = row["event_description"].ToString();
                                        image = row["event_poster"].ToString();
                                        string eligibility = row["event_eligibility"].ToString();
                                        string category = row["event_category"].ToString();
                                        string status = row["event_status"].ToString();
                                        string comments = row["event_comments"].ToString();
                                        start = startdate.ToString("ddd dd MMMM yyyy");
                                        end = enddate.ToString("ddd dd MMMM yyyy");
                                        close = regclose.ToString("ddd dd MMMM yyyy");

                                        this.HiddenField_Id1.Value = itemid;
                                        this.txtOrgClub.Text = group;
                                        this.txtName.Text = item_name;
                                        this.txtDescr.Text = item_description;
                                        this.txtPrice.Text = item_price;
                                        this.txtStartDate.Text = start;
                                        this.txtEndDate.Text = end;
                                        this.txtStartTime.Text = start_time;
                                        this.txtEndTime.Text = end_time;
                                        this.txtVenue.Text = venue;
                                        this.txtFormalDesc.Text = formal_descr;
                                        this.txtNoOfP.Text = no_of_p;
                                        this.txtRegClose.Text = close;
                                        this.txtResources.Text = resources;
                                        this.txtRemarks.Text = remarks;
                                        this.txtCategory.Text = category;
                                        this.txtEligibility.Text = eligibility;
                                        this.txtComments.Text = comments;
                                        this.txtLink.Text = link;
                                        this.txtContactName.Text = contactname;
                                        this.txtContactNo.Text = contactno;
                                        if (status == "Pending"){
                                            btnUpdate.Visible = false;
                                            }
                                        else
                                        {
                                            btnApprove.Visible = false;
                                            btnReject.Visible = false;
                                        }
                                        
                                    }
                                    con.Close();
                                }
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("Error: " + ex.ToString());
                }
            }
        }

        protected void btnApprove_Click(object sender, EventArgs e)
        {
            string approve = "Approved";
            System.Diagnostics.Debug.WriteLine("Test1");
            SqlConnection con = new
        SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            System.Diagnostics.Debug.WriteLine("Test2");
            try
            {
                System.Diagnostics.Debug.WriteLine("Test3");
                con.Open();
                
                string query = "UPDATE EVENTS_CREATED SET event_venue=@event_venue, event_status=@event_status, event_comments=@event_comments WHERE event_id=@itemid";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@itemid", HiddenField_Id1.Value.ToString());
               
                cmd.Parameters.AddWithValue("@event_venue", txtVenue.Text);
                cmd.Parameters.AddWithValue("@event_status", approve);
                cmd.Parameters.AddWithValue("@event_comments", txtComments.Text);

                System.Diagnostics.Debug.WriteLine("Test5");
                cmd.ExecuteNonQuery();
                System.Diagnostics.Debug.WriteLine("Test6");

                Response.Redirect("SA_ViewPropsAll.aspx");
                System.Diagnostics.Debug.WriteLine("Test7");
                con.Close();
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine(ex.ToString());
                Response.Write("Error: " + ex.ToString());
            }
        }

        protected void btnReject_Click(object sender, EventArgs e)
        {
            string reject = "Rejected";
            System.Diagnostics.Debug.WriteLine("Test1");
            SqlConnection con = new
        SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            System.Diagnostics.Debug.WriteLine("Test2");
            try
            {
                System.Diagnostics.Debug.WriteLine("Test3");
                con.Open();

                string query = "UPDATE EVENTS_CREATED SET event_venue=@event_venue, event_status=@event_status, event_comments=@event_comments WHERE event_id=@itemid";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@itemid", HiddenField_Id1.Value.ToString());

                cmd.Parameters.AddWithValue("@event_venue", txtVenue.Text);
                cmd.Parameters.AddWithValue("@event_status", reject);
                cmd.Parameters.AddWithValue("@event_comments", txtComments.Text);

                System.Diagnostics.Debug.WriteLine("Test5");
                cmd.ExecuteNonQuery();
                System.Diagnostics.Debug.WriteLine("Test6");

                Response.Redirect("SA_ViewPropsAll.aspx");
                System.Diagnostics.Debug.WriteLine("Test7");
                con.Close();
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine(ex.ToString());
                Response.Write("Error: " + ex.ToString());
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            
            SqlConnection con = new
        SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            
            try
            {
            
                con.Open();

                string query = "UPDATE EVENTS_CREATED SET event_venue=@event_venue,event_comments=@event_comments WHERE event_id=@itemid";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@itemid", HiddenField_Id1.Value.ToString());

                cmd.Parameters.AddWithValue("@event_venue", txtVenue.Text);
                
                cmd.Parameters.AddWithValue("@event_comments", txtComments.Text);

                
                cmd.ExecuteNonQuery();
                

                Response.Redirect("SA_ViewPropsAll.aspx");
                
                con.Close();
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine(ex.ToString());
                Response.Write("Error: " + ex.ToString());
            }
        }
    }
}