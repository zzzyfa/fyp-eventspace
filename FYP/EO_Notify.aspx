<%@ Page Language="C#" MasterPageFile="User.master" AutoEventWireup="true" CodeFile="EO_Notify.aspx.cs" Inherits="FYP.EO_Notify" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Message Participants | EventSpace</title>
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="assets/css/github.min.css" rel="stylesheet" />
    <link href="dist/bootstrap-clockpicker.min.css" rel="stylesheet" />
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/highlight.min.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div style="text-align: center; margin-top: 100px">
            
                        <asp:Label runat="server" Text="Success! Your message has been sent." ForeColor="green" ID="lblMsg" CssClass="highlight" Visible="false"></asp:Label>
            <asp:LinkButton ID="HyperLink1" runat="server" OnClick="HyperLink1_Click" Visible="false"><u>View Message History</u></asp:LinkButton><br /><br />
                            
            <h2>Message Participants</h2>

        </div>
        <div class="row contact-wrap">

            <div class="status alert alert-success" style="display: none"></div>
            <div id="main-contact-form" class="contact-form">
                <div class="col-sm-3"></div>
                <asp:HiddenField ID="HiddenField1" runat="server" Value="approved" />
                <div class="col-sm-6" >
                    
                    
                    
                    <hr style="height: 0.7px; color: lightgrey; background-color: lightgrey; margin-bottom: 30px" />
                    <label style="margin-bottom: 30px"><span style="color: red; font-weight: 900">*</span> <span style="font-weight: 400">Required</span></label>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [EVENTS_CREATED] WHERE ([user_id] = @user_id) AND event_status=@event_status AND event_start_date>=GETDATE()">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="user_id" QueryStringField="custid" Type="Decimal" />
                            <asp:ControlParameter ControlID="HiddenField1" Name="event_status" PropertyName="Value" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <div class="form-group" style="margin-bottom: 30px">
                        
                        <label>To participants of: <span style="color: red; font-weight: 900">*</span></label>
                        <asp:DropDownList ID="drlEvent" runat="server" class="form-control" DataSourceID="SqlDataSource1" DataTextField="event_name" DataValueField="event_name">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator17" runat="server" ErrorMessage="Please choose an event." ControlToValidate="drlEvent" InitialValue="-1"></asp:RequiredFieldValidator><br />
                        
                     
                        <label>Subject: <span style="color: red; font-weight: 900">*</span></label>
                        <asp:TextBox ID="txtSubject" runat="server" class="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator1" runat="server" ErrorMessage="This field is required." ControlToValidate="txtSubject"></asp:RequiredFieldValidator><br />


                        <label>Message: <span style="color: red; font-weight: 900">*</span></label><br />
                        <asp:TextBox ID="txtMessage" runat="server" class="form-control" TextMode="MultiLine" MaxLength="1000" Height="200px"></asp:TextBox>
                        <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator16" runat="server" ErrorMessage="This field is required." ControlToValidate="txtMessage"></asp:RequiredFieldValidator><br />


                        <asp:Button ID="btnSend" runat="server" Text="Send Message" class="btn btn-primary btn-lg" OnClick="btnSend_Click" />
                        <asp:Button ID="btnClear" runat="server"  class="btn btn-primary btn-lg" Text="Clear" OnClick="btnClear_Click" />
                        <asp:Label ID="lbleventid" runat="server" Text=""></asp:Label>



                       


                    </div>
                    <%--<div class="col-sm-3" style="margin-bottom: 50px"></div>--%>
                </div>
            </div>
            <!--/.row-->
        </div>
</asp:Content>
