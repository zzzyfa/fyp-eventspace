<%@ Page Language="C#" MasterPageFile="User.master" AutoEventWireup="true" CodeFile="P_Browse.aspx.cs" Inherits="FYP.P_Browse" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Event Catalogue | SoftwareBiz</title>
    <%--<link href="css/style.css" rel="stylesheet" />--%>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:HiddenField ID="HiddenField1" runat="server" Value="approved" />
    <asp:HiddenField ID="HiddenField2" runat="server" Value="ALL" />
    <div class="banner_bottom">
        <div class="container">
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
                <ul class="portfolio-area" style="margin-top: 50px">
                    <%if (Session["userid"] != null)
                        { %>
                    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                        <LayoutTemplate>
                            <div id="itemPlaceHolderContainer" runat="server">
                                <span id="itemPlaceHolder" runat="server" />
                            </div>
                        </LayoutTemplate>
                        <ItemTemplate>

                            <li class="portfolio-item2" data-id="id-7" data-type="<%#Eval("event_category") %>">
                                <div>
                                    <span class="image-block block2">
                                        <img src="upload/<%# Eval("event_poster")%>" class="img-responsive" height="150" width="150" alt="Conceit">
                                        <div class="port-info">
                                            <h5><a href="P_EventDetail.aspx?id=<%# Eval("event_id") %>"><%# Eval("event_name")%></a></h5>
                                            <p><%# Eval("event_start_date")%> - <%# Eval("event_end_date")%></p>
                                            <p><%# Eval("event_start_time")%> - <%# Eval("event_end_time")%></p>
                                        </div>
                                        </a>
                                    </span>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                </div>
                            </li>

                        </ItemTemplate>
                    </asp:ListView>
                    <%}
                    else
                    { %>
                    <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource2">
                        <LayoutTemplate>
                            <div id="itemPlaceHolderContainer" runat="server">
                                <span id="itemPlaceHolder" runat="server" />
                            </div>
                        </LayoutTemplate>
                        <ItemTemplate>

                            <li class="portfolio-item2" data-id="id-7" data-type="<%#Eval("event_category") %>">
                                <div>
                                    <span class="image-block block2">
                                        <img src="upload/<%# Eval("event_poster")%>" class="img-responsive" height="150" width="150" alt="Conceit">
                                        <div class="port-info">
                                            <h5><a href="P_EventDetail.aspx?id=<%# Eval("event_id") %>"><%# Eval("event_name")%></a></h5>
                                            <p><%# Eval("event_start_date")%> - <%# Eval("event_end_date")%></p>
                                            <p><%# Eval("event_start_time")%> - <%# Eval("event_end_time")%></p>
                                        </div>
                                        </a>
                                    </span>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                </div>
                            </li>

                        </ItemTemplate>
                    </asp:ListView>
                    <%} %>
                </ul>

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [EVENTS_CREATED] WHERE (([event_eligibility] = @event_eligibility) OR ( [event_eligibility] = @event_eligibility2) AND ([event_status] = @event_status))">
                    <SelectParameters>
                        <asp:SessionParameter Name="event_eligibility" SessionField="userOccu" Type="String" />
                        <asp:ControlParameter ControlID="HiddenField1" Name="event_status" PropertyName="Value" Type="String" />
                        <asp:ControlParameter ControlID="HiddenField2" Name="event_eligibility2" PropertyName="Value" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>

                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [EVENTS_CREATED] WHERE event_status=@event_status">
                    <SelectParameters>

                        <asp:ControlParameter ControlID="HiddenField1" Name="event_status" PropertyName="Value" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>

                <!--end portfolio-area -->

            </div>

        </div>
        <!--//projects-->

    </div>
</asp:Content>
