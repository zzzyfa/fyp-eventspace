<%@ Page Language="C#" MasterPageFile="User.master" AutoEventWireup="true" CodeFile="P_Registration.aspx.cs" Inherits="FYP.P_Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Registration | EventSpace</title>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="contact-page">
        <div class="container">
            <div style="text-align: center; margin-top: 130px">
                <asp:HiddenField ID="HiddenField_Id1" runat="server" />
                <h2>Registration</h2>

            </div>
           
            
            <div class="row contact-wrap">
                <div class="status alert alert-success" style="display: none"></div>
                <div id="main-contact-form" class="contact-form">
                    <div class="col-sm-3"></div>
                    <div class="col-sm-6">
                         <hr style="height:0.7px; color:lightgrey; background-color:lightgrey" />
                        <div class="form-group">
                            <label>Name:</label>
                            <asp:TextBox ID="txtName" runat="server" class="form-control" ReadOnly="true"></asp:TextBox>
                            <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator1" runat="server" ErrorMessage="This field is required." ControlToValidate="txtName"></asp:RequiredFieldValidator><br />

                        </div>
                        <div class="form-group">
                            <label>Phone No.:</label>
                            <asp:TextBox ID="txtPhoneNo" runat="server" class="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator2" runat="server" ErrorMessage="This field is required." ControlToValidate="txtPhoneNo"></asp:RequiredFieldValidator>

                        </div>
                        <div class="form-group">
                            <label>Email:</label>
                            <asp:TextBox ID="txtEmail" runat="server" class="form-control" ReadOnly="true"></asp:TextBox>
                            <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator3" runat="server" ErrorMessage="This field is required." ControlToValidate="txtEmail"></asp:RequiredFieldValidator>

                        </div>
                        <div class="form-group">
                            <label>Alternative Email:</label>
                            <asp:TextBox ID="txtAltEmail" runat="server" class="form-control" ></asp:TextBox>
                            <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator4" runat="server" ErrorMessage="This field is required." ControlToValidate="txtAltEmail"></asp:RequiredFieldValidator>

                        </div>
                       
                        <asp:Panel runat="server" class="form-group" ID="panelShirt">
                            <label>Shirt Size:</label>
                            <asp:DropDownList ID="drlShirt" runat="server" class="form-control">
                                <asp:ListItem Enabled="true" Text="Select Size" Value="-1"></asp:ListItem>
                                <asp:ListItem Text="XS" Value="XS"></asp:ListItem>
                                <asp:ListItem Text="S" Value="S"></asp:ListItem>
                                <asp:ListItem Text="M" Value="M"></asp:ListItem>
                                <asp:ListItem Text="L" Value="L"></asp:ListItem>
                                <asp:ListItem Text="XL" Value="XL"></asp:ListItem>
                                <asp:ListItem Text="XXL" Value="XXL"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator5" runat="server" ErrorMessage="This field is required." ControlToValidate="drlShirt" InitialValue="-1"></asp:RequiredFieldValidator>

                        </asp:Panel>
                            
                        <asp:Panel runat="server" class="form-group" ID="panelFood">
                            <label>Food Preference:</label>
                            <asp:DropDownList ID="drlFood" runat="server" class="form-control">
                                <asp:ListItem Enabled="true" Text="Select Food Preference" Value="-1"></asp:ListItem>
                                <asp:ListItem Text="Vegetarian" Value="Vegetarian"></asp:ListItem>
                                <asp:ListItem Text="Non-vegetarian" Value="Non-vegetarian"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator6" runat="server" ErrorMessage="This field is required." ControlToValidate="drlFood" InitialValue="-1"></asp:RequiredFieldValidator>
                        </asp:Panel>
                       
                        <asp:Label ID="Label1" runat="server" ></asp:Label>
                        <asp:Label ID="Label2" runat="server" ></asp:Label>
                        <div class="form-group">

                            <asp:Button ID="btnProceed" runat="server" Text="Proceed" class="btn btn-primary btn-lg" OnClick="btnProceed_Click" />

                        </div>
                        <br />
                    </div>
                    <div class="col-sm-3"></div>
                </div>
            </div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [USERS]"></asp:SqlDataSource>
            <asp:HiddenField ID="HiddenField1" runat="server" />

            <!--/.row-->
        </div>
        <!--/.container-->
    </section>
</asp:Content>
