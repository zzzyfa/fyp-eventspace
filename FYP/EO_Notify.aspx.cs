using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;

namespace FYP
{
    public partial class EO_Notify : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userid"] == null)
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            lblMsg.Visible = true;
            txtMessage.Text = String.Empty;
            txtSubject.Text = String.Empty;

            SmtpClient smtpClient = new SmtpClient("smtp.domainname.com", 25);

            smtpClient.Credentials = new System.Net.NetworkCredential("user@example.com", "password");
            smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;

            MailMessage mailMessage = new MailMessage(txtFrom.Text, txtRecipient.Text);
            mailMessage.Subject = txtSubject.Text;
            mailMessage.Body = txtMessage.Text;

            try
            {
                smtpClient.Send(mailMessage);
                Label1.Text = "Message sent";
            }
            catch (Exception ex)
            {
                Label1.Text = ex.ToString();
            }
        }
    }
}