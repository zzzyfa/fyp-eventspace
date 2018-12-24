using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Xml;

namespace FYP
{
    public partial class P_Registration : System.Web.UI.Page
    {
        public int shirt = 0;
        public int food = 0;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userid"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                if (!IsPostBack)
                {
                    try
                    {
                        String contact_id = Request.QueryString["custid"];
                        int intTest = Convert.ToInt32(contact_id);
                        string prodID = Request.QueryString["prodid"];

                        string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                        using (SqlConnection con = new SqlConnection(constr))
                        {
                            using (SqlCommand cmd = new SqlCommand("SELECT * FROM USERS WHERE user_id=" + contact_id))
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
                                            string user_id = row["user_id"].ToString();
                                            string user_name = row["user_name"].ToString();
                                            string user_mobile_no = row["user_mobile_no"].ToString();
                                            string user_email = row["user_email"].ToString();
                                            string user_alt_email = row["user_alt_email"].ToString();
                                            //string user_shirt_size = row["user_shirt_size"].ToString();
                                            //string user_food = row["user_food"].ToString();


                                            this.HiddenField_Id1.Value = user_id;
                                            this.txtName.Text = user_name;
                                            this.txtPhoneNo.Text = user_mobile_no;
                                            this.txtEmail.Text = user_email;
                                            this.txtAltEmail.Text = user_alt_email;


                                            //drlEligibility.SelectedValue = drlEligibility.Items.FindByText(row["event_eligibility"].ToString()).Value;
                                            drlShirt.SelectedValue = row["user_shirt_size"].ToString();
                                            drlFood.SelectedValue = row["user_food"].ToString();

                                        }
                                        con.Close();
                                    }
                                }
                            }
                            using (SqlCommand cmd2 = new SqlCommand("SELECT * FROM events_created WHERE event_id=" + prodID))
                            {
                                using (SqlDataAdapter sda = new SqlDataAdapter())
                                {
                                    cmd2.Connection = con;
                                    sda.SelectCommand = cmd2;
                                    using (DataTable dt = new DataTable())
                                    {
                                        sda.Fill(dt);
                                        //return dt;
                                        foreach (DataRow row in dt.Rows)
                                        {
                                            string event_free = row["event_free"].ToString();
                                            shirt = Convert.ToInt32(row["event_shirt"]);
                                            food = Convert.ToInt32(row["event_food"]);
                                            this.HiddenField1.Value = event_free;
                                           
                                        }
                                        con.Close();
                                        
                                    }
                                }
                            }
                        }


                        if (shirt == 0)
                        {
                            
                            panelShirt.Visible = false;
                        }
                        if (food == 0)
                        {
                            
                            panelFood.Visible = false;
                        }


                    }
                    catch (Exception ex)
                    {
                        Response.Write("Error: " + ex.ToString());
                    }
                }

            }
        }

        protected void btnProceed_Click(object sender, EventArgs e)
        {
            //if (Session["userid"] == null)
            //{
            //    Response.Redirect("Login.aspx");
            //}
            //else
            //{
            string prodID = Request.QueryString["prodid"];
            string custID = Request.QueryString["custid"];



            SqlConnection con = new
                SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            try
            {
                con.Open();
                string query =
                "UPDATE USERS SET user_mobile_no=@user_mobile_no, user_alt_email=@user_alt_email, user_shirt_size=@user_shirt_size, user_food=@user_food WHERE user_id=@user_id";


                SqlCommand cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("@user_mobile_no", txtPhoneNo.Text);
                cmd.Parameters.AddWithValue("@user_alt_email", txtAltEmail.Text);
                cmd.Parameters.AddWithValue("@user_shirt_size", drlShirt.SelectedValue.ToString());
                cmd.Parameters.AddWithValue("@user_food", drlFood.SelectedValue.ToString());

                cmd.Parameters.AddWithValue("@user_id", Convert.ToInt32(custID));


                cmd.ExecuteNonQuery();

                if (HiddenField1.Value == "Y")
                {
                    
                    SqlConnection conn = new
                   SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                    try
                    {
                        conn.Open();
                        string query2 =
                        "INSERT INTO EVENTS_PURCHASED (user_id, event_id, payment_timestamp) values (@user_id, @event_id, @payment_timestamp)";


                        SqlCommand cmd2 = new SqlCommand(query2, conn);

                        cmd2.Parameters.AddWithValue("@event_id", Convert.ToInt32(prodID));
                        cmd2.Parameters.AddWithValue("@user_id", Convert.ToInt32(custID));
                        cmd2.Parameters.AddWithValue("@payment_timestamp", DateTime.Now.ToString());

                        cmd2.ExecuteNonQuery();


                        conn.Close();
                        Response.Redirect("P_Success.aspx?prodid=" + prodID + "&custid=" + custID);
                    }
                    catch (Exception ex)
                    {
                        System.Diagnostics.Debug.WriteLine(ex.ToString());
                        Response.Write("Error: " + ex.ToString());
                    }
                }
                else
                {
                    Response.Redirect("P_Checkout.aspx?prodid=" + prodID + "&custid=" + custID);
                }
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