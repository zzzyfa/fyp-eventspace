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
    public partial class EO_Edit : System.Web.UI.Page
    {
        private object item_name;
        public string image = "";
        public object HiddenField_Id { get; private set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
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
                                        string start_date = row["event_start_date"].ToString();
                                        string end_date = row["event_end_date"].ToString();
                                        string start_time = row["event_start_time"].ToString();
                                        string end_time = row["event_end_time"].ToString();
                                        string venue = row["event_venue"].ToString();
                                        string formal_descr = row["event_formal_descr"].ToString();
                                        string free = row["event_free"].ToString();
                                        string no_of_p = row["event_no_of_participants"].ToString();
                                        string reg_close = row["event_reg_closing_date"].ToString();
                                        string resources = row["event_resources"].ToString();
                                        string remarks = row["event_remarks"].ToString();
                                        string item_price = row["event_price"].ToString();
                                        string item_description = row["event_description"].ToString();
                                        image = row["event_poster"].ToString();

                                        this.HiddenField_Id1.Value = itemid;
                                        this.txtOrgClub.Text = group;
                                        this.txtName.Text = item_name;
                                        this.txtDescr.Text = item_description;
                                        this.txtPrice.Text = item_price;
                                        this.txtStartDate.Text = start_date;
                                        this.txtEndDate.Text = end_date;
                                        this.txtStartTime.Text = start_time;
                                        this.txtEndTime.Text = end_time;
                                        this.txtVenue.Text = venue;
                                        this.txtFormalDesc.Text = formal_descr;
                                        this.txtNoOfP.Text = no_of_p;
                                        this.txtRegClose.Text = reg_close;
                                        this.txtResources.Text = resources;
                                        this.txtRemarks.Text = remarks;

                                        //drlEligibility.SelectedValue = drlEligibility.Items.FindByText(row["event_eligibility"].ToString()).Value;
                                        drlEligibility.SelectedValue = row["event_eligibility"].ToString();
                                        drlCategory.SelectedValue = row["event_category"].ToString();
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


        protected void btnUpdate_Click(object sender, EventArgs e)
        {
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
                string query = "UPDATE EVENTS_CREATED SET event_category=@event_category,event_venue=@event_venue, event_poster=@event_poster, event_formal_descr=@event_formal_descr, " +
                                "event_description=@event_description, event_price=@event_price, event_eligibility=@event_eligibility, event_no_of_participants=@event_no_of_participants, " +
                                "event_reg_closing_date=@event_reg_closing_date, event_resources=@event_resources, event_remarks=@event_remarks WHERE event_id=@itemid";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@itemid", HiddenField_Id1.Value.ToString());
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
                
                cmd.Parameters.AddWithValue("@event_price", Convert.ToDouble(txtPrice.Text));
                cmd.Parameters.AddWithValue("@event_poster", file_name);
                
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
    }
}