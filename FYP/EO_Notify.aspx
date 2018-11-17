<%@ Page Language="C#" MasterPageFile="User.master" AutoEventWireup="true" CodeFile="EO_Notify.aspx.cs" Inherits="FYP.EO_Notify" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Notify Participants | SoftwareBiz</title>
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="assets/css/github.min.css" rel="stylesheet" />
    <link href="dist/bootstrap-clockpicker.min.css" rel="stylesheet" />
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/highlight.min.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container">
        <div style="text-align: center; margin-top:100px">
            <h2>Notify Participants</h2>

        </div>
        <div class="row contact-wrap">

            <div class="status alert alert-success" style="display: none"></div>
            <div id="main-contact-form" class="contact-form">
                <div class="col-sm-3"></div>

                <div class="col-sm-6">
                    <hr style="margin-bottom: 50px" />
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [EVENTS_CREATED] WHERE ([user_id] = @user_id)">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="user_id" QueryStringField="custid" Type="Decimal" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <div class="form-group" style="margin-bottom:30px">
                        <label>Event Name:</label>
                        <asp:DropDownList ID="drlEvent" runat="server" class="form-control" DataSourceID="SqlDataSource1" DataTextField="event_name" DataValueField="event_name">                            
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator17" runat="server" ErrorMessage="Please choose an event." ControlToValidate="drlEvent" InitialValue="-1"></asp:RequiredFieldValidator><br />
                    
                    
                        <label>Subject:</label>
                        <asp:TextBox ID="txtSubject" runat="server" class="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator1" runat="server" ErrorMessage="This field is required." ControlToValidate="txtSubject"></asp:RequiredFieldValidator><br />
                    
                    
                        <label>Message</label><br />
                        <asp:TextBox ID="txtMessage" runat="server" class="form-control" TextMode="MultiLine" MaxLength="1000"></asp:TextBox>
                        <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator16" runat="server" ErrorMessage="This field is required." ControlToValidate="txtMessage"></asp:RequiredFieldValidator><br />
                    
                    
                        <asp:Button ID="btnSend" runat="server" Text="Send Message" class="btn btn-primary btn-lg" OnClick="btnSend_Click" />
                    
                </div>
                <%--<div class="col-sm-3" style="margin-bottom: 50px"></div>--%>
            </div>
        </div>
        <!--/.row-->
    </div>
    </asp:Content>
