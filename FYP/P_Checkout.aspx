<%@ Page Language="C#" MasterPageFile="User.master" AutoEventWireup="true" CodeFile="P_Checkout.aspx.cs" Inherits="FYP.P_Checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Checkout | EventSpace</title>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <section id="contact-page">
        <div class="container">
            <div style="text-align: center">
                <h2>Payment</h2>
            </div>
            <br /><br />
            <div class="row contact-wrap">
                <div class="status alert alert-success" style="display: none"></div>
                <div id="main-contact-form" class="contact-form">
                    <div class="col-sm-3"></div>
                    <div class="col-sm-6">

                        <div class="form-group">
                            <label>Card Number:</label>
                            <asp:TextBox ID="txtCardNo" runat="server" class="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator1" runat="server" ErrorMessage="This field is required." ControlToValidate="txtCardNo"></asp:RequiredFieldValidator><br />
                            
                        </div>
                        <div class="form-group">
                            <label>Expiry Date:</label>
                            <asp:TextBox ID="txtPassword" runat="server" class="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator2" runat="server" ErrorMessage="This field is required." ControlToValidate="txtPassword"></asp:RequiredFieldValidator>

                        </div>
                       <div class="form-group">
                            <label>CVV:</label>
                            <asp:TextBox ID="TextBox1" runat="server" class="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator3" runat="server" ErrorMessage="This field is required." ControlToValidate="TextBox1"></asp:RequiredFieldValidator>
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