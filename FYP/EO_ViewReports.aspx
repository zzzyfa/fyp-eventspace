<%@ Page Language="C#" MasterPageFile="User.master" AutoEventWireup="true" CodeFile="EO_ViewReports.aspx.cs" Inherits="FYP.EO_ViewReports" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <title>View Event Reports | SoftwareBiz</title>
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
            <h2>Event Sales Reports</h2>
        </div>
        <hr style="height:0.7px; color:lightgrey; background-color:lightgrey; margin-bottom:30px" />
        <div class="col-sm-12 overauto">
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="false" CssClass="table table-responsive" DataKeyNames="event_id" GridLines="None" AllowPaging="True"  OnRowCommand="GridView2_RowCommand">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="event_id" HeaderText="ID" ReadOnly="True" SortExpression="event_id" InsertVisible="False" HeaderStyle-Font-Underline="true" />

                    <asp:BoundField DataField="event_group" HeaderText="Org Group" SortExpression="event_group" HeaderStyle-Font-Underline="true" />
                    <asp:BoundField DataField="event_name" HeaderText="Event Name" SortExpression="event_name" HeaderStyle-Font-Underline="true" />
                    <asp:BoundField DataField="event_start_date" HeaderText="Start Date" SortExpression="event_start_date" HeaderStyle-Font-Underline="true" />
                    <asp:BoundField DataField="event_start_time" HeaderText="Start Time" SortExpression="event_start_time" HeaderStyle-Font-Underline="true" />
                    <asp:BoundField DataField="event_venue" HeaderText="Venue" SortExpression="event_venue" HeaderStyle-Font-Underline="true" />
                    <asp:BoundField DataField="event_price" HeaderText="Price" SortExpression="event_price" HeaderStyle-Font-Underline="true" />
                    <%--tickets sold 
                        btnfield with count as backend and it will show div/popup that shows how many tickets sold
                        --%>

                    <asp:ButtonField ButtonType="Button" ControlStyle-Width="100px" ControlStyle-CssClass="btn btn-primary" HeaderText="Report" Text="View" HeaderStyle-Font-Underline="true" />
                </Columns>
                 <RowStyle BackColor="#EFF3FB" />
                 <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <EmptyDataTemplate>
                                <h3>You have no approved events events yet.</h3>
                            </EmptyDataTemplate>
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
