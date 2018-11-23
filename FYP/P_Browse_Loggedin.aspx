<%@ Page Language="C#" MasterPageFile="User.master" AutoEventWireup="true" CodeFile="P_Browse_Loggedin.aspx.cs" Inherits="FYP.P_Events_Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Event Catalogue | SoftwareBiz</title>
    <%--<link href="css/style.css" rel="stylesheet" />--%>
    <style type="text/css">

    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:HiddenField ID="HiddenField1" runat="server" Value="approved" />
    <asp:HiddenField ID="HiddenField2" runat="server" Value="all" />
    <%--<div class="banner_bottom">--%>
        <div class="container" style="margin-top:130px; margin-bottom:50px">
            <h3 class="tittle-w3ls">Events</h3>
            <div class="inner_sec_info_wthree_agile">
                <!--/projects-->
                <ul class="portfolio-categ filter">
                    <li class="port-filter all active">
                        <a href="#">All</a>
                    </li>
                    <li class="BS">
                        <a href="#" title="Category 1">Business</a>
                    </li>
                    <li class="IT">
                        <a href="#" title="Category 2">IT</a>
                    </li>
                    <li class="EG">
                        <a href="#" title="Category 3">Engineering</a>
                    </li>
                    <li class="EX">
                        <a href="#" title="Category 3">Extra-curricular</a>
                    </li>
                    <li class="OT">
                        <a href="#" title="Category 3">Others</a>
                    </li>

                    <%--<li class="cat-item-4">
                        <a href="#" title="Category 4">Category 4</a>
                    </li>--%>
                </ul>
                <hr style="height:0.5px; color:lightgrey; background-color:lightgrey" />
                <asp:TextBox ID="txtSearch" runat="server" class="form-control" placeholder="Enter event name..."></asp:TextBox>
                    <asp:Button ID="btnSearch" runat="server" Text="Search" class="btn btn-primary btn-lg" OnClick="btnSearch_Click" />
                <ul class="portfolio-area" style="margin-top: 50px">
                    
                    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                        <LayoutTemplate>
                            <div id="itemPlaceHolderContainer" runat="server">
                                <span id="itemPlaceHolder" runat="server" />
                            </div>
                        </LayoutTemplate>
                   <ItemTemplate>

                            <li class="portfolio-item2" data-id="id-7" data-type="<%#Eval("event_category") %>">
                                <div style="height:300px; margin-bottom:40px;">
                                    <span class="image-block block2" style="margin-right:100px">
                                        <img src="upload/<%# Eval("event_poster")%>"  height="200" width="300" alt="Conceit">
                                        <div class="port-info" style="width:100%; margin-right:50px">
                                            <h5><a href="P_EventDetail.aspx?id=<%# Eval("event_id") %>"><%# Eval("event_name")%></a></h5>
                                            <p><%# Eval("event_start_date")%> - <%# Eval("event_end_date")%><br />
                                            <%# Eval("event_start_time")%> - <%# Eval("event_end_time")%><br />
                                            <%# Eval("event_venue") %></p>
                                        </div>
                                        </a>
                                    </span>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                </div>
                            </li>

                        </ItemTemplate>
                    </asp:ListView>
                    
                </ul>

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [EVENTS_CREATED] WHERE (event_eligibility=@event_eligibility or event_eligibility=@event_eligibility2) and event_status=@event_status">
                    <%--(([event_eligibility] = @event_eligibility) OR ( [event_eligibility] = @event_eligibility2) AND ([event_status] = @event_status))--%>
                    <SelectParameters>
                        <asp:SessionParameter Name="event_eligibility" SessionField="userOccu" Type="String" />
                        <asp:ControlParameter ControlID="HiddenField1" Name="event_status" PropertyName="Value" Type="String" />
                        <asp:ControlParameter ControlID="HiddenField2" Name="event_eligibility2" PropertyName="Value" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>

                

                <!--end portfolio-area -->

            </div>

        </div>
        <!--//projects-->

    <%--</div>--%>
</asp:Content>
