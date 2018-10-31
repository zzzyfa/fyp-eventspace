using System;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace FYP
{
    public partial class Login : System.Web.UI.Page
    {
        private static SqlConnection connection;
        private static SqlCommand command;


        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLog_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString(); // Makes connectionString 

            connection = new SqlConnection(connectionString);
            command = new SqlCommand("", connection);

            // Used for Checking database Row by row to check if ID exists //
            connection.Open(); // Open Connection to the database (refer to connection declaration above) //
            command.Connection = connection;
            command.CommandText = "SELECT * from USERS"; // launch SQL command to select EVERYTHING from table Users//

            using (SqlDataReader readline = command.ExecuteReader()) // using a Line reader (SqlDataReader) and declare it as readline = command.Executereader() <---- this is a function //
                while (readline.Read()) // to loop while the system can read data from a row
                {
                    if (txtUsername.Text.Equals(readline["user_username"]) && txtPassword.Text.Equals(readline["user_password"]))
                    { // If username inputted by the guest member matches the read "UserName" from table Users. it will set "flag"/ variable to 1 (1 means it's existing and 0 means it's not existing)
                        if (readline["user_type"].Equals("user"))
                        {
                            Session["userid"] = txtUsername.Text;
                            Response.Redirect("P_Home.aspx");
                        }
                        else if (readline["user_type"].Equals("admin"))
                        {
                            Session["userid"] = txtUsername.Text;
                            Response.Redirect("SA_Home.aspx");
                        }
                    }
                    else
                    {
                        lbl1.Visible = true;
                    }
                }
            connection.Close();
        }
    }
}