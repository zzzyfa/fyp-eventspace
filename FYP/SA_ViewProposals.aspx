<%@ Page Language="C#" MasterPageFile="Admin.master" AutoEventWireup="true" CodeFile="SA_ViewProposals.aspx.cs" Inherits="FYP.SA_ViewProposals" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <title>View Event Proposals | SoftwareBiz</title>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="center" style="margin-top: 130px">
            <h2>View Submitted Events</h2>
        </div>
        <hr />
        <div class="col-sm-4">
                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="event_id" Font-Names="Arial" Font-Size="Medium" ForeColor="#333333" GridLines="None" Width="1000px" AllowPaging="True" AllowSorting="true" OnSorting="gridView_Sorting" OnRowCommand="GridView2_RowCommand">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField DataField="event_id" HeaderText="ID" ReadOnly="True" SortExpression="event_id" InsertVisible="False" ItemStyle-Width="50px" HeaderStyle-Font-Underline="true" />
                                <asp:BoundField DataField="event_timestamp" HeaderText="Timestamp" SortExpression="event_timestamp" HeaderStyle-Font-Underline="true" />
                                <asp:BoundField DataField="event_group" HeaderText="Org Group" SortExpression="event_group" HeaderStyle-Font-Underline="true" />
                                <asp:BoundField DataField="event_name" HeaderText="Event Name" SortExpression="event_name" HeaderStyle-Font-Underline="true" />
                                <asp:BoundField DataField="event_category" HeaderText="Category" SortExpression="event_category" HeaderStyle-Font-Underline="true" />
                                <asp:BoundField DataField="event_start_date" HeaderText="Start Date" SortExpression="event_start_date" HeaderStyle-Font-Underline="true" />
                                <asp:BoundField DataField="event_end_date" HeaderText="End Date" SortExpression="event_end_date" HeaderStyle-Font-Underline="true" />
                                <asp:BoundField DataField="event_venue" HeaderText="Venue" SortExpression="event_venue" HeaderStyle-Font-Underline="true" />
                                <asp:BoundField DataField="event_status" HeaderText="Status" SortExpression="event_status" HeaderStyle-Font-Underline="true" />
                                <asp:BoundField DataField="event_comments" HeaderText="Comments" SortExpression="comments" HeaderStyle-Font-Underline="true" />
                                <asp:ButtonField ButtonType="Button" ControlStyle-Width="100px" HeaderText="Details" Text="View"  />
                            </Columns>
                            <EditRowStyle BackColor="#2461BF" />
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#EFF3FB" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#F5F7FB" />
                            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                            <SortedDescendingCellStyle BackColor="#E9EBEF" />
                            <SortedDescendingHeaderStyle BackColor="#4870BE" />
                        </asp:GridView>
                    </div>
                </div>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [EVENTS_CREATED]" OnSelecting="SqlDataSource1_Selecting"></asp:SqlDataSource>
    <br />
    <br />
<div class="col-sm-3"></div>
</asp:Content>

