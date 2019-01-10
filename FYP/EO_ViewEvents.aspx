<%@ Page Language="C#" MasterPageFile="User.master" AutoEventWireup="true" CodeFile="EO_ViewEvents.aspx.cs" Inherits="FYP.EO_ViewEvents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <title>View Submitted Events | EventSpace</title>
    <style type="text/css">
        table {
            border-collapse: collapse;
            border-spacing: 0;
            width: 100%;
            border: 1px solid #ddd;
        }

        th, td {
            text-align: left;
            padding: 10px;
        }

        .overauto {
            overflow-x: auto;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="center" style="margin-top: 130px">
            <h2>Submitted Events</h2>
        </div>
        <hr style="height:0.8px; color:lightgrey; background-color:lightgrey; margin-bottom:30px" />
        <div class="col-sm-12 overauto">
                        <asp:GridView ID="GridView2" runat="server" CssClass="table table-responsive" AutoGenerateColumns="False" GridLines="None" AllowPaging="True" OnRowCommand="GridView2_RowCommand" DataSourceID="SqlDataSource1" PageSize="15">
                            <%--AllowSorting="true" OnSorting="gridView_Sorting" --%>
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField DataField="event_id" HeaderText="ID" ReadOnly="True" SortExpression="event_id" InsertVisible="False" ItemStyle-Width="50px" HeaderStyle-Font-Underline="true" />
                                <asp:BoundField DataField="event_timestamp" HeaderText="Timestamp" SortExpression="event_timestamp" HeaderStyle-Font-Underline="true" ItemStyle-Width="10%" />
                                <asp:BoundField DataField="event_group" HeaderText="Org Group" SortExpression="event_group" HeaderStyle-Font-Underline="true" />
                                <asp:BoundField DataField="event_name" HeaderText="Event Name" SortExpression="event_name" HeaderStyle-Font-Underline="true"   ItemStyle-ForeColor="OrangeRed" ItemStyle-Width="20%" ItemStyle-Font-Bold="true"  />
                                <asp:BoundField DataField="event_start_date" HeaderText="Start Date" SortExpression="event_start_date" HeaderStyle-Font-Underline="true" />
                                <asp:BoundField DataField="event_venue" HeaderText="Venue" SortExpression="event_venue" HeaderStyle-Font-Underline="true" />
                                 <%--<asp:BoundField DataField="event_price" HeaderText="Price" SortExpression="event_price" HeaderStyle-Font-Underline="true" />--%>
                                <asp:BoundField DataField="event_status" HeaderText="Status" SortExpression="event_status" HeaderStyle-Font-Underline="true" />
                                <%--<asp:BoundField DataField="event_comments" HeaderText="Comments" SortExpression="comments" HeaderStyle-Font-Underline="true" />--%>
                                <asp:ButtonField ButtonType="Button" ControlStyle-Width="100px" HeaderText="Details" Text="Edit" ControlStyle-CssClass="btn btn-primary"  HeaderStyle-Font-Underline="true"  />
                            </Columns>
                           <RowStyle BackColor="#EFF3FB" />
                              <EditRowStyle BackColor="#2461BF" />
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                            
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#F5F7FB" />
                            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                            <SortedDescendingCellStyle BackColor="#E9EBEF" />
                            <SortedDescendingHeaderStyle BackColor="#4870BE" />
                 <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <EmptyDataTemplate>
                                <h3>You have not submitted any events yet.</h3>
                            </EmptyDataTemplate>
                        </asp:GridView>
                    </div>
                </div>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT event_id, event_name, event_timestamp, event_price, event_group, event_status, event_comments, event_venue, event_start_time, event_end_time, FORMAT (event_start_date, 'ddd dd MMM yyyy') as event_start_date,  FORMAT (event_end_date, 'ddd dd MMM yyyy') FROM [EVENTS_CREATED] WHERE ([user_id] = @user_id) ORDER BY event_id DESC" OnSelecting="SqlDataSource1_Selecting">
        <SelectParameters>
            <asp:QueryStringParameter Name="user_id" QueryStringField="custid" Type="Decimal" />
        </SelectParameters>
</asp:SqlDataSource>
    <br />
    <br />
<div class="col-sm-3"></div>
</asp:Content>
