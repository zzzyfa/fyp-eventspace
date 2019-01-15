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
    public partial class P_Checkout : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userid"] == null)
            {
                Response.Redirect("Login2.aspx");
            }
            else
            {
                string prodID = Request.QueryString["prodid"];
                string custID = Request.QueryString["custid"];

                string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                using (SqlConnection con2 = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand("SELECT event_id, user_id, event_price FROM EVENTS_CREATED WHERE event_id=" + prodID))
                    {
                        using (SqlDataAdapter sda = new SqlDataAdapter())
                        {
                            cmd.Connection = con2;
                            sda.SelectCommand = cmd;
                            using (DataTable dt = new DataTable())
                            {
                                sda.Fill(dt);
                                //return dt;
                                foreach (DataRow row in dt.Rows)
                                {

                                    string item_price = row["event_price"].ToString();
                                    this.hiddenPrice.Value = item_price;
                                }
                                con2.Close();
                            }
                        }
                    }
                }
            }
        }
        public static string getUserName(String userID)
        {
            String name = "NULL";
            String query = "Select * from USERS where user_id= '" + userID + "'";
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();
            SqlCommand cm = new SqlCommand(query, conn);
            SqlDataReader sdr = cm.ExecuteReader();
            while (sdr.Read())
            {
                name = sdr["user_name"].ToString();
            }
            return name;
        }
        protected void btnProceed_Click(object sender, EventArgs e)
        {
            if (Session["userid"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {

                string prodID = Request.QueryString["prodid"];
                string custID = Request.QueryString["custid"];
                string username = getUserName(custID);

                XmlDocument myDoc = new XmlDocument();
                XmlElement myPaymentElement;
                XmlElement myDateElement;
                XmlElement myNameElement;
                XmlElement myAmountElement;
                XmlElement myCardNoElement;
                XmlElement myExpiryElement;
                XmlElement myCVVElement;
                XmlText myTextNode;

                myDoc.Load(Request.PhysicalApplicationPath + @"\App_Data\payment.xml");
                myPaymentElement = myDoc.CreateElement("payment");
                myNameElement = myDoc.CreateElement("name");
                myDateElement = myDoc.CreateElement("datePayment");
                myCardNoElement = myDoc.CreateElement("cardNo");
                myExpiryElement = myDoc.CreateElement("expiry");
                myCVVElement = myDoc.CreateElement("cvv");
                myAmountElement = myDoc.CreateElement("amount");
                myTextNode = myDoc.CreateTextNode(DateTime.Now.ToString());
                myDateElement.AppendChild(myTextNode);
                myTextNode = myDoc.CreateTextNode(username);
                myNameElement.AppendChild(myTextNode);
                myTextNode = myDoc.CreateTextNode(hiddenPrice.Value);
                myAmountElement.AppendChild(myTextNode);
                myTextNode = myDoc.CreateTextNode(txtCardNo.Text);
                myCardNoElement.AppendChild(myTextNode);
                myTextNode = myDoc.CreateTextNode(txtExpiry.Text);
                myExpiryElement.AppendChild(myTextNode);
                myTextNode = myDoc.CreateTextNode(txtCVV.Text);
                myCVVElement.AppendChild(myTextNode);
                myPaymentElement.AppendChild(myDateElement);
                myPaymentElement.AppendChild(myNameElement);
                myPaymentElement.AppendChild(myAmountElement);
                myPaymentElement.AppendChild(myCardNoElement);
                myPaymentElement.AppendChild(myExpiryElement);
                myPaymentElement.AppendChild(myCVVElement);

                myDoc.DocumentElement.AppendChild(myPaymentElement);
                myDoc.Save(Request.PhysicalApplicationPath + @"\App_Data\payment.xml");




                SqlConnection con = new
                SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                try
                {
                    con.Open();
                    string query =
                    "INSERT INTO EVENTS_PURCHASED (user_id, event_id, payment_timestamp) values "+
                    "(@user_id, @event_id, @payment_timestamp)";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@event_id", Convert.ToInt32(prodID));
                    cmd.Parameters.AddWithValue("@user_id", Convert.ToInt32(custID));
                    cmd.Parameters.AddWithValue("@payment_timestamp", DateTime.Now.ToString());
                    cmd.ExecuteNonQuery();
                    Response.Redirect("P_Success.aspx?prodid=" + prodID +  "&custid=" + custID);
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
}