using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Collections;

namespace FYP
{
    
    public partial class EO_Notify : System.Web.UI.Page
    {
        public String eventID = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userid"] == null)
            {
                Response.Redirect("Login.aspx");
            }
        }

        public static string getEventID(String eventname)
        {
            String id = "";
            String query = "Select event_id from EVENTS_CREATED where event_name= '" + eventname + "'";
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();
            SqlCommand cm = new SqlCommand(query, conn);
            SqlDataReader sdr = cm.ExecuteReader();
            while (sdr.Read())
            {
                id = sdr["event_id"].ToString();
            }

            return id;
        }





        protected void btnSend_Click(object sender, EventArgs e)
        {
            try
            {

                //upon selecting event dropdown, match with event id, check ev_purch table and get all rows with tht event id, go to users table find user of each, get their email, put in string
                string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                SqlConnection conn = new SqlConnection(constr);
                conn.Open();

                
                string eventname = drlEvent.SelectedValue.ToString();

                eventID = getEventID(eventname);

                ArrayList list_emails = new ArrayList();

                int i = 0;
                string emails = "";
                string emails2 = "";

                SqlCommand cmd_Email = new SqlCommand("Select u.user_email, u.user_alt_email FROM [EVENTS_PURCHASED] AS p INNER JOIN [USERS] AS u ON p.user_id = u.user_id where p.event_id='" + eventID + "'", conn);
                SqlCommand cmd_Email2 = new SqlCommand("Select u.user_alt_email FROM [EVENTS_PURCHASED] AS p INNER JOIN [USERS] AS u ON p.user_id = u.user_id where p.event_id='" + eventID + "'", conn);
                SqlDataReader read_Email = cmd_Email.ExecuteReader();
                while (read_Email.Read())
                {
                    emails = read_Email.GetValue(i).ToString();
                    list_emails.Add(emails); //Add email to a arraylist
                    i = i + 1 - 1; //increment or ++i
                }
                read_Email.Close();
                SqlDataReader read_Email2 = cmd_Email2.ExecuteReader();
                while (read_Email2.Read())
                {
                    emails2 = read_Email2.GetValue(i).ToString();
                    list_emails.Add(emails2); //Add email to a arraylist
                    i = i + 1 - 1; //increment or ++i
                }
                read_Email2.Close();
                conn.Close(); //Close connection                 

                SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
                client.EnableSsl = true;
                client.DeliveryMethod = SmtpDeliveryMethod.Network;
                client.UseDefaultCredentials = false;
                client.Credentials = new NetworkCredential("eventspaceapu@gmail.com", "Shr1yan!@");

                foreach (string email_to in list_emails)
                {
                    MailMessage mail = new MailMessage();
                    mail.To.Add(email_to);
                    mail.Subject = txtSubject.Text;
                    mail.From = new MailAddress("eventspaceapu@gmail.com");
                    mail.Body = txtMessage.Text;
                    client.Send(mail);
                }
                lblMsg.Visible = true;
                
                //lbleventid.Text = eventID.ToString();

                






            }
            catch (Exception ex)
            {
                Response.Write("couldnt send email" + ex.Message);
            }



         

            
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtSubject.Text = String.Empty;
            txtMessage.Text = String.Empty;
        }
    }
}