<%@ Page Language="C#" MasterPageFile="User.master" AutoEventWireup="true" CodeFile="P_Checkout.aspx.cs" Inherits="FYP.P_Checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Checkout | EventSpace</title>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <section id="contact-page">
        <div class="container">
            <div style="text-align: center; margin-top:130px">
                <h2>Payment</h2>
            </div>
            
            <div class="row contact-wrap">
                <div class="status alert alert-success" style="display: none"></div>
                <div id="main-contact-form" class="contact-form">
                    <div class="col-sm-3"></div>
                    <div class="col-sm-6">
                        <hr style="height:0.7px; color:lightgrey; background-color:lightgrey" />
                        <div class="form-group">
                            <label>Card Number:</label>
                            <asp:TextBox ID="txtCardNo" runat="server" class="form-control" TextMode="Number"></asp:TextBox>
                            <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator1" runat="server" ErrorMessage="This field is required." ControlToValidate="txtCardNo"></asp:RequiredFieldValidator><br />
                            
                        </div>
                        <div class="form-group">
                            <label>Expiry Date (MM/YYYY):</label>
                            <asp:TextBox ID="txtExpiry" runat="server" class="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator2" runat="server" ErrorMessage="This field is required." ControlToValidate="txtExpiry"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator  ForeColor="Red" ID="RegularExpressionValidator2"
                                               runat="server" ControlToValidate="txtExpiry"
                                                Text="Please enter in MM/YYYY format." 
                                                ValidationExpression="(0[1-9]|10|11|12)/20[0-9]{2}$">
                                           </asp:RegularExpressionValidator>
                        </div>
                       <div class="form-group">
                            <label>CVV:</label>
                            <asp:TextBox ID="txtCVV" runat="server" class="form-control" TextMode="Number"></asp:TextBox>
                            <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator3" runat="server" ErrorMessage="This field is required." ControlToValidate="txtCVV"></asp:RequiredFieldValidator>
                           <asp:RegularExpressionValidator  ForeColor="Red" ID="RegularExpressionValidator1"
                                               runat="server" ControlToValidate="txtCVV"
                                                Text="Please enter 3-4 digits only." 
                                                ValidationExpression="^([0-9]{3,4})$">
                                           </asp:RegularExpressionValidator>
                        </div>
                        <div class="form-group">
                            <asp:Button ID="btnProceed" runat="server" Text="Proceed" class="btn btn-primary btn-lg" OnClick="btnProceed_Click" />
                            <asp:HiddenField ID="hiddenPrice" runat="server" />
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