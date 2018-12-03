using System;
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
            if (Session["userid"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            // txtToday.Value = DateTime.Now.ToShortDateString();
            CompareEndTodayValidator.ValueToCompare = DateTime.Now.ToShortDateString();

        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            lblError.Visible = true;
            string event_status = "Pending";
            string custID = Request.QueryString["custid"];
            //string custID = Session["userid"].ToString();
            int free = 0;
            //int custID = 1;

            string resources = "";
            for (int i = 0; i < CheckBoxList1.Items.Count; i++)
            {
                if (CheckBoxList1.Items[i].Selected)
                {
                    resources += CheckBoxList1.Items[i].Value + ",";
                }

            }
            resources = resources.TrimEnd(',');
            //Response.Write("Hobbies=" + hobbies);





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
                    "event_formal_descr, event_description, event_free, event_price, event_eligibility, event_no_of_participants, event_reg_closing_date, event_resources, event_remarks, event_timestamp, event_status, user_id, event_shirt, event_food, event_contact_name, event_contact_no)" +
                    " values (@event_group, @event_name, @event_category, @event_start_date, @event_end_date, @event_start_time, @event_end_time, @event_venue, @event_poster,"+
                    "@event_formal_descr, @event_description, @event_free, @event_price, @event_eligibility, @event_no_of_participants, @event_reg_closing_date, @event_resources, @event_remarks, @event_timestamp, @event_status, @user_id, @event_shirt, @event_food, @event_contact_name, @event_contact_no)";
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
                    cmd.Parameters.AddWithValue("@event_shirt", "Y");
                    
                }
                else
                {
                    cmd.Parameters.AddWithValue("@event_shirt", "N");
                    
                }

                if (chkFood.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@event_food", "Y");
                    
                }
                else
                {
                    cmd.Parameters.AddWithValue("@event_food", "N");
                    
                }
                cmd.Parameters.AddWithValue("@event_no_of_participants", txtNoOfP.Text);
                cmd.Parameters.AddWithValue("@event_reg_closing_date", txtRegClose.Text);
                cmd.Parameters.AddWithValue("@event_eligibility", drlEligibility.SelectedValue.ToString());
                cmd.Parameters.AddWithValue("@event_remarks", txtRemarks.Text);
                cmd.Parameters.AddWithValue("@event_timestamp", DateTime.Now.ToString());
                cmd.Parameters.AddWithValue("@event_resources", resources);
                cmd.Parameters.AddWithValue("@user_id", custID);

                cmd.Parameters.AddWithValue("@event_contact_name", txtContactName.Text);
                cmd.Parameters.AddWithValue("@event_contact_no", txtContactNo.Text);

                cmd.Parameters.AddWithValue("@event_poster", file_name);
                cmd.Parameters.AddWithValue("@event_status", event_status);
                System.Diagnostics.Debug.WriteLine("Test5");
                cmd.ExecuteNonQuery();
                System.Diagnostics.Debug.WriteLine("Test6");

                Response.Redirect("EO_ViewEvents.aspx?custid="+custID);
                System.Diagnostics.Debug.WriteLine("Test7");
                con.Close();
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine(ex.ToString());
                Response.Write("Error: " + ex.ToString());
            }
        }
        protected void CustDateValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {
            DateTime dt;
            args.IsValid = (DateTime.TryParse(args.Value, out dt)
                            && dt > DateTime.Today);
        }
        protected void chkFree_CheckedChanged(object sender, EventArgs e)
        {

            if (chkFree.Checked == true)
            {
                panelPrice.Visible = false;
            }

            else { panelPrice.Visible = true; }
        }


    }
}