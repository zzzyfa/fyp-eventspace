<%@ Page Language="C#" MasterPageFile="User.master" AutoEventWireup="true" CodeFile="EO_MsgContent.aspx.cs" Inherits="FYP.EO_MsgContent" %>

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
         <div class="center" style="margin-top: 130px">

            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                <LayoutTemplate>
                    <div id="itemPlaceHolderContainer" runat="server">
                        <span id="itemPlaceHolder" runat="server" />
                    </div>
                </LayoutTemplate>
                <ItemTemplate>
                    <h2>To <span style="color: orangered; font-weight: bold"><%#Eval("message_event_name") %></span> participants</h2><br />
                    <label>Sent : <%# Eval("message_timestamp") %></label><br />
                    <hr style="height: 0.7px; color: lightgrey; background-color: lightgrey; margin-bottom: 30px" />
                </ItemTemplate>

            </asp:ListView>
            <asp:DataPager ID="Number1" runat="server" PagedControlID="ListView1" PageSize="1"></asp:DataPager>


        </div>
        <div class="row contact-wrap">

            <div class="status alert alert-success" style="display: none"></div>
            <div id="main-contact-form" class="contact-form">
               <%-- <div class="col-sm-3"></div>--%>
                <asp:HiddenField ID="HiddenField1" runat="server" Value="approved" />
                <%--<div class="col-sm-6">--%>
                <div class="col-sm-12 overauto">



                    

                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [MESSAGES] WHERE ([message_id] = @event_id)">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="event_id" QueryStringField="id" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                    <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource1">
                        <LayoutTemplate>
                            <div id="itemPlaceHolderContainer" runat="server">
                                <span id="itemPlaceHolder" runat="server" />
                            </div>
                        </LayoutTemplate>
                        <ItemTemplate>
                            <div class="form-group" style="margin-bottom: 30px">
                                <div style="border:1px solid gray; padding:10px 10px 10px 10px">
                                <label>Subject :</label>
                                <br />
                                 <%# Eval("message_subject") %>
                                <br />
                                    </div>
                                <br />
                                 <div style="border:1px solid gray; padding:10px 10px 10px 10px">
                                <label>Recipients : </label><br />
                                <%# Eval("message_to") %>
                                <br />
                                     </div>
                                <br />
                                 <div style="border:1px solid gray; padding:10px 10px 10px 10px">
                                <label>Message : </label><br />
                                
                                <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine" ReadOnly="true" Wrap="true" Text='<%# Eval("message_body")%>' BorderStyle="None" BorderWidth="0" Rows="15" Width="100%"></asp:TextBox>
                                <br />
                                     </div>
                                <br />
                                

                            </div>
                        </ItemTemplate>
                    </asp:ListView>
                </div>
            </div>
            <!--/.row-->
        </div>
    </div>
</asp:Content>
