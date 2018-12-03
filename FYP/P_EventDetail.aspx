<%@ Page Language="C#" MasterPageFile="User.master" AutoEventWireup="true" CodeFile="P_EventDetail.aspx.cs" Inherits="FYP.P_EventDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Event Details | SoftwareBiz</title>
    <style type="text/css">
        .highlight {
            color: red;
            font-weight: bold;
            font-size: large;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [EVENTS_CREATED] WHERE ([event_id] = @event_id)">
        <SelectParameters>
            <asp:QueryStringParameter Name="event_id" QueryStringField="id" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:HiddenField ID="hiddenRegClose" runat="server" />

    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
        <LayoutTemplate>
            <div id="itemPlaceHolderContainer" runat="server">
                <span id="itemPlaceHolder" runat="server" />
            </div>
        </LayoutTemplate>
        <ItemTemplate>
            <div class="banner_bottom address">
                <div class="banner_bottom_in">
                    <img src="upload/<%# Eval("event_poster") %>" style="height: 315px; width: 100%; margin: 0 auto" class="image-responsive" alt="">
                </div>
            </div>

            <div class="container">

                <div>
                    <h1 style="margin-left: 15px;"><%# Eval("event_name")%></h1>
                    <br />
                    <h5 style="margin-left: 15px;">Organised by <span style="color: orangered; font-weight: bold"><%# Eval("event_group")%></span></h5>
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
                                        <%if (start == end)
                                            {%>
                                        <%=start%> <%}
                                        else
                                        { %>

                                        <%=start%> - <%=end %>
                                        <%} %>
                                    <p>
                                        <h4 class="media-heading" style="margin-top:20px">Time:</h4>
                                        <p style="text-align: justify">
                                            <%# Eval("event_start_time") %> - <%# Eval("event_end_time") %>
                                    <p>
                                        <h4 class="media-heading" style="margin-top:20px">Venue:</h4>
                                        <p style="text-align: justify">
                                            <%# Eval("event_venue") %>
                                    <p>
                                        <h4 class="media-heading" style="margin-top:20px">Ticket Price:</h4>
                                        <p style="text-align: justify">
                                            <%if (free == "Y")
                                                {  %>Free<%}
                                                             else
                                                             { %><%# Eval("event_price") %><%} %>
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
                        <%--<p style="text-align: justify"><%# Eval("event_description")%></p>--%>
                        <%--<textbox style="text-align: justify" textMode="multiline" readonly="readonly" wrap="true"><%# Eval("event_description")%></textbox>--%>
                        <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine" ReadOnly="true" Wrap="true" Text='<%# Eval("event_description")%>' BorderStyle="None" BorderWidth="0" Rows="10" Width="100%"></asp:TextBox>
                       
                    </div><br />
                    <div class="media-left">
                        <i class="fa fa-phone"></i>
                    </div>
                    <div class="media-body">
                       
                        <h4 class="media-heading">Contact Person:</h4>
                        <p><%# Eval("event_contact_name") %>     <%# Eval("event_contact_no") %></p>
                    </div>
                </div>
            </div>

        </ItemTemplate>
    </asp:ListView>

  
    <br />
    <div class="container">

        <div class="form-group">
            <asp:HiddenField ID="hiddenCount" runat="server" />
            <asp:HiddenField ID="hiddenLimit" runat="server" />
            <asp:Label runat="server" Text="Sorry. The event registration is closed." Visible="false" ID="lblClose" CssClass="highlight"></asp:Label>
            <asp:Label runat="server" Text="You have already registered for this event." Visible="false" ID="lblAdyReg" CssClass="highlight"></asp:Label>
            <asp:HiddenField ID="Label1" runat="server" />
            <asp:Button ID="btnCheckout" runat="server" Text="Register Now" class="btn btn-primary btn-lg" OnClick="btnCheckout_Click" Style="border-bottom: 50px" />
        </div>

    </div>
</asp:Content>
