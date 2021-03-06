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
    public partial class EO_Edit : System.Web.UI.Page
    {
        private object item_name;
        public string image = "";
        public String custID = "";
        public object HiddenField_Id { get; private set; }
        public String reg = "";
        DateTime startdate = new DateTime();
        DateTime enddate = new DateTime();
        public String start = "";
        public String end = "";
        DateTime regclose = new DateTime();
        public String close = "";
        public int food = 0;
        public int shirt = 0;
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
                                        start = startdate.ToString("ddd dd MMMM yyyy");
                                        end = enddate.ToString("ddd dd MMMM yyyy");
                                        close = regclose.ToString("ddd dd MMMM yyyy");
                                        shirt = Convert.ToInt32(row["event_shirt"]);
                                        food = Convert.ToInt32(row["event_food"]);

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
                                        this.txtLink.Text = link;
                                        this.txtContactName.Text = contactname;
                                        this.txtContactNo.Text =contactno;
                                        this.txtRegClose.Text = close;
                                        this.txtRemarks.Text = remarks;
                                        if (free == "Y")
                                        {
                                            chkFree.Checked = true;
                                            panelPrice.Visible = false;
                                        }
                                        else
                                        {
                                            chkFree.Checked = false;
                                            panelPrice.Visible = true;
                                        }
                                        if (shirt == 1)
                                        {
                                            chkShirt.Checked = true;
                                          
                                        }
                                        if (food == 1)
                                        {
                                            chkFood.Checked = true;
                                            
                                        }
                                        drlEligibility.SelectedValue = row["event_eligibility"].ToString();
                                        drlCategory.SelectedValue = row["event_category"].ToString();

                                        string str = resources;
                                        string[] resource = str.Split(',');
                                        foreach (string res in resource)
                                        {
                                            CheckBoxList1.Items.FindByValue(res).Selected = true;
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

        protected void chkFree_CheckedChanged(object sender, EventArgs e)
        {

            if (chkFree.Checked == true)
            {
                panelPrice.Visible = false;
            }

            else { panelPrice.Visible = true; }
        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            int free = 0;
            string resources = "";
            for (int i = 0; i < CheckBoxList1.Items.Count; i++)
            {
                if (CheckBoxList1.Items[i].Selected)
                {
                    resources += CheckBoxList1.Items[i].Value + ",";
                }
            }
            resources = resources.TrimEnd(',');
            
            SqlConnection con = new
            SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            System.Diagnostics.Debug.WriteLine("Test2");
            try
            {
                con.Open();
                if (uploadPic.HasFile)
                {
                    string file_name = uploadPic.FileName.ToString() + "";
                    uploadPic.PostedFile.SaveAs(Server.MapPath("~/upload/") + file_name);
                    string query = "UPDATE EVENTS_CREATED SET event_category=@event_category,event_venue=@event_venue, "+
                        "event_poster=@event_poster, event_background=@event_background, event_description=@event_description,"+
                        " event_free=@event_free, event_price=@event_price, event_eligibility=@event_eligibility, "+
                        "event_no_of_participants=@event_no_of_participants, event_resources=@event_resources, "+
                        "event_remarks=@event_remarks, event_shirt=@event_shirt, event_food=@event_food, "+
                        "event_contact_name=@event_contact_name, event_contact_no=@event_contact_no, "+
                        "event_fb_link=@event_fb_link WHERE event_id=@itemid";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@event_group", txtOrgClub.Text);
                    cmd.Parameters.AddWithValue("@event_name", txtName.Text);
                    cmd.Parameters.AddWithValue("@event_category", drlCategory.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@event_venue", txtVenue.Text);
                    cmd.Parameters.AddWithValue("@event_background", txtFormalDesc.Text);
                    cmd.Parameters.AddWithValue("@event_description", txtDescr.Text);
                    if (chkFree.Checked == true)
                    {
                        cmd.Parameters.AddWithValue("@event_free", "Y");
                        cmd.Parameters.AddWithValue("@event_price", Convert.ToDouble(free));
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@event_free", "N");
                        cmd.Parameters.AddWithValue("@event_price", Convert.ToDouble(txtPrice.Text));
                    }
                    if (chkShirt.Checked == true)
                    {
                        cmd.Parameters.AddWithValue("@event_shirt", 1);
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@event_shirt", 0);
                    }

                    if (chkFood.Checked == true)
                    {
                        cmd.Parameters.AddWithValue("@event_food", 1);
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@event_food", 0);
                    }
                    cmd.Parameters.AddWithValue("@event_no_of_participants", txtNoOfP.Text);                 
                    cmd.Parameters.AddWithValue("@event_eligibility", drlEligibility.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@event_remarks", txtRemarks.Text);
                    cmd.Parameters.AddWithValue("@event_contact_name", txtContactName.Text);
                    cmd.Parameters.AddWithValue("@event_contact_no", txtContactNo.Text);
                    cmd.Parameters.AddWithValue("@event_fb_link", txtLink.Text);
                    cmd.Parameters.AddWithValue("@event_resources", resources);
                    cmd.Parameters.AddWithValue("@event_poster", file_name);
                    cmd.ExecuteNonQuery();
                    
                    custID = getUserID(Session["userid"].ToString());
                    Response.Redirect("EO_ViewEvents.aspx?custid=" + custID);
                    con.Close();
                }else
                {
                    string query = "UPDATE EVENTS_CREATED SET event_category=@event_category,event_venue=@event_venue,  event_background=@event_background, " +
                                    "event_description=@event_description, event_free=@event_free, event_price=@event_price, event_eligibility=@event_eligibility, event_no_of_participants=@event_no_of_participants, " +
                                    " event_resources=@event_resources, event_remarks=@event_remarks,  event_shirt=@event_shirt, event_food=@event_food WHERE event_id=@itemid";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@itemid", HiddenField_Id1.Value.ToString());
                    cmd.Parameters.AddWithValue("@event_group", txtOrgClub.Text);
                    cmd.Parameters.AddWithValue("@event_name", txtName.Text);
                    cmd.Parameters.AddWithValue("@event_category", drlCategory.SelectedValue.ToString());
                
                    cmd.Parameters.AddWithValue("@event_venue", txtVenue.Text);
                    cmd.Parameters.AddWithValue("@event_background", txtFormalDesc.Text);
                    cmd.Parameters.AddWithValue("@event_description", txtDescr.Text);
                    if (chkFree.Checked == true)
                    {
                        cmd.Parameters.AddWithValue("@event_free", "Y");
                        cmd.Parameters.AddWithValue("@event_price", Convert.ToDouble(free));
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@event_free", "N");
                        cmd.Parameters.AddWithValue("@event_price", Convert.ToDouble(txtPrice.Text));
                    }
                    if (chkShirt.Checked == true)
                    {
                        cmd.Parameters.AddWithValue("@event_shirt", 1);
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@event_shirt", 0);
                    }

                    if (chkFood.Checked == true)
                    {
                        cmd.Parameters.AddWithValue("@event_food", 1);
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@event_food", 0);
                    }
                    cmd.Parameters.AddWithValue("@event_no_of_participants", txtNoOfP.Text);
           
                    cmd.Parameters.AddWithValue("@event_eligibility", drlEligibility.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@event_remarks", txtRemarks.Text);
                  
                    cmd.Parameters.AddWithValue("@event_resources", resources);




                    System.Diagnostics.Debug.WriteLine("Test5");
                    cmd.ExecuteNonQuery();
                    System.Diagnostics.Debug.WriteLine("Test6");

                    if (Session["userid"] != null)
                    {
                        custID = getUserID(Session["userid"].ToString());
                    }

                    Response.Redirect("EO_ViewEvents.aspx?custid=" + custID);
                    System.Diagnostics.Debug.WriteLine("Test7");
                    con.Close();
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine(ex.ToString());
                Response.Write("Error: " + ex.ToString());
            }
        }
        public static string getUserID(String username)
        {
            String userID = "NULL";
            String query = "Select user_id from users where user_username= '" + username + "'";
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