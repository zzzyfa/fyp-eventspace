<%@ Page Language="C#" MasterPageFile="User.master" AutoEventWireup="true" CodeFile="Login2.aspx.cs" Inherits="FYP.Login2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Login | EventSpace</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="contact-page">
        <div class="container">
            <div style="text-align: center; margin-top:100px">
                <h2>Login</h2>
                <hr />
                <asp:Label ID="Label2"  runat="server"  Text="Please use the same username and password as your webspace account."></asp:Label><br />
            </div>
            <br /><br />
            <div class="row contact-wrap">
                <div class="status alert alert-success" style="display: none"></div>
                <div id="main-contact-form" class="contact-form">
                    <div class="col-sm-3"></div>
                    <div class="col-sm-6">
                        
                        <div class="form-group">
                            <label>APU User ID *</label>
                            <asp:TextBox ID="txtUsername" runat="server" class="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator1" runat="server" ErrorMessage="This field is required." ControlToValidate="txtUsername"></asp:RequiredFieldValidator><br />
                            
                        </div>
                        <div class="form-group">
                            <label>Password *</label>
                            <asp:TextBox ID="txtPassword" runat="server" class="form-control" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator2" runat="server" ErrorMessage="This field is required." ControlToValidate="txtPassword"></asp:RequiredFieldValidator>

                        </div>
                       <div class="form-group">
                            <asp:Label ID="lbl1" ForeColor="red" runat="server" Visible="False" Text="Wrong username or password."></asp:Label><br />
                            <asp:Button ID="btnLog" runat="server" Text="Login" class="btn btn-primary btn-lg" OnClick="btnLog_Click" />
                        </div>
                        
                    </div>
                     
                    <div class="col-sm-3"></div>
                </div>
            </div>
            

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [USERS]"></asp:SqlDataSource>
            

            
            <!--/.row-->
        </div>
        <!--/.container-->
    </section>
    <!--/#contact-page-->

</asp:Content>