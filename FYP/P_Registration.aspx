<%@ Page Language="C#"  MasterPageFile="User.master" AutoEventWireup="true" CodeBehind="P_Registration.aspx.cs" Inherits="FYP.P_Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Registration | EventSpace</title>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <section id="contact-page">
        <div class="container">
            <div style="text-align: center">
                <h2>Registration</h2>

            </div>
            <br /><br />
            <div class="row contact-wrap">
                <div class="status alert alert-success" style="display: none"></div>
                <div id="main-contact-form" class="contact-form">
                    <div class="col-sm-3"></div>
                    <div class="col-sm-6">

                        <div class="form-group">
                            <label>Name:</label>
                            <asp:TextBox ID="txtUsername" runat="server" class="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator1" runat="server" ErrorMessage="This field is required." ControlToValidate="txtUsername"></asp:RequiredFieldValidator><br />
                            
                        </div>
                        <div class="form-group">
                            <label>Phone No.:</label>
                            <asp:TextBox ID="txtPassword" runat="server" class="form-control" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator2" runat="server" ErrorMessage="This field is required." ControlToValidate="txtPassword"></asp:RequiredFieldValidator>

                        </div>
                        <div class="form-group">
                            <label>Email:</label>
                            <asp:TextBox ID="TextBox1" runat="server" class="form-control" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator3" runat="server" ErrorMessage="This field is required." ControlToValidate="txtPassword"></asp:RequiredFieldValidator>

                        </div>
                        <div class="form-group">
                            <label>Alternative Email:</label>
                            <asp:TextBox ID="TextBox2" runat="server" class="form-control" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator4" runat="server" ErrorMessage="This field is required." ControlToValidate="txtPassword"></asp:RequiredFieldValidator>

                        </div>
                        <div class="form-group">
                            <label>Shirt Size:</label>
                            <asp:TextBox ID="TextBox3" runat="server" class="form-control" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator5" runat="server" ErrorMessage="This field is required." ControlToValidate="txtPassword"></asp:RequiredFieldValidator>

                        </div>
                        <div class="form-group">
                            <label>Food Preference:</label>
                            <asp:TextBox ID="TextBox4" runat="server" class="form-control" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator6" runat="server" ErrorMessage="This field is required." ControlToValidate="txtPassword"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            
                            <asp:Button ID="btnProceed" runat="server" Text="Proceed" class="btn btn-primary btn-lg" OnClick="btnProceed_Click" />
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
    </asp:Content>