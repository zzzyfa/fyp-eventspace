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
        <hr />
        <div class="col-sm-12 overauto">
                        <asp:GridView ID="GridView2" runat="server" CssClass="table table-responsive" AutoGenerateColumns="False" GridLines="None" Width="1000px" AllowPaging="True" AllowSorting="true" OnSorting="gridView_Sorting" OnRowCommand="GridView2_RowCommand">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField DataField="event_id" HeaderText="ID" ReadOnly="True" SortExpression="event_id" InsertVisible="False" ItemStyle-Width="50px" HeaderStyle-Font-Underline="true" />
                                <asp:BoundField DataField="event_timestamp" HeaderText="Timestamp" SortExpression="event_timestamp" HeaderStyle-Font-Underline="true" />
                                <asp:BoundField DataField="event_group" HeaderText="Org Group" SortExpression="event_group" HeaderStyle-Font-Underline="true" />
                                <asp:BoundField DataField="event_name" HeaderText="Event Name" SortExpression="event_name" HeaderStyle-Font-Underline="true" />
                                <asp:BoundField DataField="event_start_date" HeaderText="Start Date" SortExpression="event_start_date" HeaderStyle-Font-Underline="true" />
                                <asp:BoundField DataField="event_venue" HeaderText="Venue" SortExpression="event_venue" HeaderStyle-Font-Underline="true" />
                                <asp:BoundField DataField="event_status" HeaderText="Status" SortExpression="event_status" HeaderStyle-Font-Underline="true" />
                                <asp:BoundField DataField="event_comments" HeaderText="Comments" SortExpression="comments" HeaderStyle-Font-Underline="true" />
                                <asp:ButtonField ButtonType="Button" ControlStyle-Width="100px" HeaderText="Edit" Text="Edit"  />
                            </Columns>
                           <RowStyle BackColor="#EFF3FB" />
                 <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        </asp:GridView>
                    </div>
                </div>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [EVENTS_CREATED] WHERE ([user_id] = @user_id)" OnSelecting="SqlDataSource1_Selecting">
        <SelectParameters>
            <asp:QueryStringParameter Name="user_id" QueryStringField="custid" Type="Decimal" />
        </SelectParameters>
</asp:SqlDataSource>
    <br />
    <br />
<div class="col-sm-3"></div>
</asp:Content>
