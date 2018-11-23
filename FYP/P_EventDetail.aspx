<%@ Page Language="C#" MasterPageFile="User.master" AutoEventWireup="true" CodeFile="P_EventDetail.aspx.cs" Inherits="FYP.P_EventDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Event Details | SoftwareBiz</title>
    <style type="text/css">
        .highlight
{
  color:red;
  font-weight:bold;
  font-size:large;
}
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [EVENTS_CREATED] WHERE ([event_id] = @event_id)">
        <SelectParameters>
            <asp:QueryStringParameter Name="event_id" QueryStringField="id" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
        <LayoutTemplate>
            <div id="itemPlaceHolderContainer" runat="server">
                <span id="itemPlaceHolder" runat="server" />
            </div>
        </LayoutTemplate>
        <ItemTemplate>
            <div class="banner_bottom address">
                <div class="banner_bottom_in">
                    <img src="upload/<%# Eval("event_poster") %>" style="height: 315px; width: 100%; margin:0 auto" class="image-responsive" alt="">
                </div>
            </div>
            
            <div class="container">
                
                    <div >
                <h1 style="margin-left: 15px;"><%# Eval("event_name")%></h1><br />
                <h5 style="margin-left: 15px;">Organised by <span style="color:orangered; font-weight:bold"><%# Eval("event_group")%></span></h5>
                        </div>
                <div class="col-md-6">
                    
                    <hr />
                    <div class="media">
                        <ul>
                            <li>
                                <div class="media-left">
                                    <i class="glyphicon glyphicon-calendar"></i>
                                </div>
                                <div class="media-body">
                                    <h4 class="media-heading">Date:</h4>
                                    <p style="text-align: justify">
                                        <%# Eval("event_start_date") %> - <%# Eval("event_end_date") %>
                                    <p>
                                        <h4 class="media-heading">Time:</h4>
                                        <p style="text-align: justify">
                                            <%# Eval("event_start_time") %> - <%# Eval("event_end_time") %>
                                    <p>
                                        <h4 class="media-heading">Venue:</h4>
                                        <p style="text-align: justify">
                                            <%# Eval("event_venue") %>
                                    <p>
                                        <h4 class="media-heading">Ticket Price:</h4>
                                        <p style="text-align: justify">
                                            <%if (free == "Y")
                                                {  %>Free<%}
                                            else
                                            { %><%# Eval("event_price") %><%} %><p>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-6">
                    <hr />
                    <div class="media-left">
                        <i class="fa fa-pencil"></i>
                    </div>
                    <div class="media-body">
                        <h4 class="media-heading">About:</h4>
                        <p style="text-align: justify"><%# Eval("event_description")%></p>
                    </div>
                </div>
                    </div>
            
        </ItemTemplate>
    </asp:ListView>

     <%--<asp:ListView ID="ListView1" runat="server">
        <LayoutTemplate>
            <div id="itemPlaceHolderContainer" runat="server">
                <span id="itemPlaceHolder" runat="server" />
            </div>
        </LayoutTemplate>
        <ItemTemplate>
            <div class="banner_bottom">
                <div class="banner_bottom_in">
                    <img src="upload/<%=poster %>" style="height: 315px; width: 851px" class="image-responsive" alt="">
                </div>
            </div>
            <div class="container">
                <h1 style="margin-left: 15px;"><%=name%></h1>
                <div class="col-md-6">
                    <hr />
                    <div class="media">
                        <ul>
                            <li>
                                <div class="media-left">
                                    <i class="glyphicon glyphicon-calendar"></i>
                                </div>
                                <div class="media-body">
                                    <h4 class="media-heading">Date:</h4>
                                    <p style="text-align: justify">
                                        <%# Eval("event_start_date") %> - <%# Eval("event_end_date") %>
                                    <p>
                                        <h4 class="media-heading">Time:</h4>
                                        <p style="text-align: justify">
                                            <%# Eval("event_start_time") %> - <%# Eval("event_end_time") %>
                                    <p>
                                        <h4 class="media-heading">Venue:</h4>
                                        <p style="text-align: justify">
                                            <%# Eval("event_venue") %>
                                    <p>
                                        <h4 class="media-heading">Ticket Price:</h4>
                                        <p style="text-align: justify">
                                            <%if (free == "Y")
                                                {  %>Free<%}
                                            else
                                            { %>
                                            <%# Eval("event_price") %><%} %>
                                    <p>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-6">
                    <hr />
                    <div class="media-left">
                        <i class="fa fa-pencil"></i>
                    </div>
                    <div class="media-body">
                        <h4 class="media-heading">About:</h4>
                        <p style="text-align: justify"><%# Eval("event_description")%></p>
                    </div>
                </div>
            </div>
        </ItemTemplate>
    </asp:ListView>--%>
    <br />
    <div class="container">

        <div class="form-group" >
            <asp:HiddenField ID="hiddenCount" runat="server" />
            <asp:HiddenField ID="hiddenLimit" runat="server" />
            <asp:Label runat="server" Text="Sorry. The event registration is closed." Visible="false" ID="lblClose" CssClass="highlight"></asp:Label>
            <asp:Button ID="btnCheckout" runat="server" Text="Register Now" class="btn btn-primary btn-lg" OnClick="btnCheckout_Click" style="border-bottom:50px" />
        </div>
        
    </div>
</asp:Content>
