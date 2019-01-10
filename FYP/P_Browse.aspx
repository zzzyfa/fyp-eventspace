<%@ Page Language="C#" MasterPageFile="User.master" AutoEventWireup="true" CodeFile="P_Browse.aspx.cs" Inherits="FYP.P_Browse" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Event Catalogue | SoftwareBiz</title>
    <%--<link href="css/style.css" rel="stylesheet" />--%>
    <style type="text/css">
        
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:HiddenField ID="HiddenField1" runat="server" Value="approved" />
    <asp:HiddenField ID="HiddenField2" runat="server" Value="all" />
    <asp:HiddenField ID="hiddenToday" runat="server" />
    <div class="container" style="margin-top: 150px; margin-bottom: 50px">
        <h3 class="tittle-w3ls">Upcoming Events</h3>
        <div class="inner_sec_info_wthree_agile">
            <ul class="portfolio-categ filter" ">
                <li class="port-filter all active">
                    <a href="#"><b>All</b></a>
                </li>
                <li class="TW">
                    <a href="#" title="Category 1"><b>Talks/Workshops</b></a>
                </li>
                <li class="CO">
                    <a href="#" title="Category 2"><b>Competition</b></a>
                </li>
                <li class="EN">
                    <a href="#" title="Category 3"><b>Entertainment</b></a>
                </li>
                <li class="SP">
                    <a href="#" title="Category 3"><b>Sports</b></a>
                </li>
                <li class="OT">
                    <a href="#" title="Category 3"><b>Others</b></a>
                </li>
            </ul>
            <hr style="height: 0.5px; color: lightgrey; background-color: lightgrey" />
            <label style="margin-bottom: 10px">Search Keyword: </label>
            &nbsp<asp:Label runat="server" ID="lblSearch"></asp:Label>
            <asp:TextBox ID="txtSearch" runat="server" class="form-control" placeholder="Enter event name..."></asp:TextBox>
            <asp:Button ID="btnSearch" runat="server" Text="Search" class="btn btn-primary btn-lg" OnClick="btnSearch_Click" />
            &nbsp&nbsp&nbsp
                <asp:Button ID="btnReload" runat="server" Text="Reload" class="btn btn-primary btn-lg" OnClick="btnReload_Click" />

            <ul class="portfolio-area" style="margin-top: 50px">
                <%if (Session["userid"] != null)
                    { %>
                <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                    <LayoutTemplate>
                        <div id="itemPlaceHolderContainer" runat="server">
                            <span id="itemPlaceHolder" runat="server" />
                        </div>
                    </LayoutTemplate>
                    <EmptyDataTemplate>
                        <h4>There are no eligible events for you as of now.</h4>
                    </EmptyDataTemplate>
                    <ItemTemplate>
                        <li class="portfolio-item2" data-id="id-7" data-type="<%#Eval("event_category") %>">
                            <div style="height: 300px; margin-bottom: 40px;">
                                <span class="image-block block2" style="margin-right: 100px">
                                    <img src="upload/<%# Eval("event_poster")%>" height="200" width="350" alt="Conceit">
                                    <div class="port-info" style="width: 100%; width: 350px; margin-right: 50px">
                                        <h5><a href="P_EventDetail.aspx?id=<%# Eval("event_id") %>"><%# Eval("event_name")%></a></h5>
                                        <p>
                                            <%# Eval("event_start_date")%> - <%# Eval("event_end_date")%><br />
                                            <%# Eval("event_start_time")%> - <%# Eval("event_end_time")%><br />
                                            <%# Eval("event_venue") %>
                                        </p>
                                    </div>
                                    </a>
                                </span>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
                    <EmptyDataTemplate>
                        <h4>There are no upcoming events as of now.</h4>
                    </EmptyDataTemplate>
                    <ItemTemplate>
                        <li class="portfolio-item2" data-id="id-7" data-type="<%#Eval("event_category") %>">
                            <div style="height: 300px; margin-bottom: 40px;">
                                <span class="image-block block2" style="margin-right: 100px">
                                    <img src="upload/<%# Eval("event_poster")%>" height="200" width="350" alt="Conceit">
                                    <div class="port-info" style="width: 350px; margin-right: 50px">
                                        <h5><a href="P_EventDetail.aspx?id=<%# Eval("event_id") %>"><%# Eval("event_name")%></a></h5>
                                        <p>
                                            <%# Eval("event_start_date")%> - <%# Eval("event_end_date")%><br />
                                            <%# Eval("event_start_time")%> - <%# Eval("event_end_time")%><br />
                                            <%# Eval("event_venue") %>
                                        </p>
                                    </div>
                                    </a>
                                </span>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            </div>
                        </li>
                    </ItemTemplate>
                </asp:ListView>
                <%} %>
            </ul>



            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT event_id, event_name, event_poster, event_category, event_venue, event_start_time, event_end_time, FORMAT (event_start_date, 'ddd dd MMM yyyy') as event_start_date, FORMAT (event_end_date, 'ddd dd MMM yyyy') as event_end_date  FROM [EVENTS_CREATED] WHERE event_status=@event_status AND event_start_date>=GETDATE()">
                <SelectParameters>
                    <asp:ControlParameter ControlID="HiddenField1" Name="event_status" PropertyName="Value" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                SelectCommand="SELECT event_id, event_name, event_poster, event_category, event_venue, event_start_time,event_end_time, FORMAT (event_start_date, 'ddd dd MMM yyyy') as event_start_date, FORMAT (event_end_date, 'ddd dd MMM yyyy') as event_end_date  FROM [EVENTS_CREATED] WHERE (event_eligibility=@event_eligibility or event_eligibility=@event_eligibility2) AND event_status=@event_status AND event_start_date>=GETDATE()">
                <SelectParameters>
                    <asp:SessionParameter Name="event_eligibility" SessionField="userOccu" Type="String" />
                    <asp:ControlParameter ControlID="HiddenField1" Name="event_status" PropertyName="Value" Type="String" />
                    <asp:ControlParameter ControlID="HiddenField2" Name="event_eligibility2" PropertyName="Value" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>


        </div>

    </div>
    <!--//projects-->

    <%--</div>--%>
</asp:Content>
