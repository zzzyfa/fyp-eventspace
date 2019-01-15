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
        public String custID = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userid"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            if (Session["userid"] != null)
            {
                custID = getUserID(Session["userid"].ToString());
             

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
                string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                SqlConnection conn = new SqlConnection(constr);
                conn.Open();
                
                string eventname = drlEvent.SelectedValue.ToString();
                eventID = getEventID(eventname);

                ArrayList list_emails = new ArrayList();

                int i = 0;
                string emails = "";
                string emails2 = "";

                SqlCommand cmd_Email = new SqlCommand
                  ("Select u.user_email FROM [EVENTS_PURCHASED] AS p INNER JOIN [USERS] AS u ON p.user_id = u.user_id where p.event_id='"+
                    eventID+"'",conn);
                SqlCommand cmd_Email2 = new SqlCommand
                  ("Select u.user_alt_email FROM [EVENTS_PURCHASED] AS p INNER JOIN [USERS] AS u ON p.user_id = u.user_id where p.event_id='"
                    + eventID + "'", conn);
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
                    i = i + 1 - 1; 
                }
                read_Email2.Close();
            
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
                
                string recipients = "";
                for (int u = 0;  u < list_emails.Count; u++)
                {
                    string value = list_emails[u] as string;
                    recipients += value + "; ";
                }
                
                string query = 
                  "INSERT INTO MESSAGES (event_id, message_subject, message_body, message_to, message_timestamp, user_id) "+
                  "values (@event_id, @message_subject, @message_body, @message_to, @message_timestamp, @user_id)";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@event_id", eventID);
                cmd.Parameters.AddWithValue("@message_subject", txtSubject.Text);
                cmd.Parameters.AddWithValue("@message_body", txtMessage.Text);
                cmd.Parameters.AddWithValue("@message_to", recipients.ToString());
                cmd.Parameters.AddWithValue("@message_timestamp", DateTime.Now.ToString());
                cmd.Parameters.AddWithValue("@user_id", custID.ToString());
                cmd.ExecuteNonQuery();
                conn.Close();
                
                lblMsg.Visible = true;
                HyperLink1.Visible = true;
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }            
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtSubject.Text = String.Empty;
            txtMessage.Text = String.Empty;
        }

        protected void HyperLink1_Click(object sender, EventArgs e)
        {
            Response.Redirect("EO_MsgHist.aspx?custid="+custID);
        }
    }
}