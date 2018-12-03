<%@ Page Language="C#" MasterPageFile="Admin.master" AutoEventWireup="true" CodeFile="SA_ViewProposals.aspx.cs" Inherits="FYP.SA_ViewProposals" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <title>View Event Proposals | SoftwareBiz</title>
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
        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" style="margin-top:100px">
                        <LayoutTemplate>
                            <div id="itemPlaceHolderContainer" runat="server">
                                <span id="itemPlaceHolder" runat="server" />
                            </div>
                        </LayoutTemplate>
            <EmptyDataTemplate>
                <h2>Event Proposals :  <span style="color:orangered; font-weight:bold"> <% =v %> </span></h2>
            </EmptyDataTemplate>
                        <ItemTemplate>
                  <h2>Event Proposals : <span style="color:orangered; font-weight:bold">  <%#Eval("event_status") %></span></h2>
                            </ItemTemplate>

                    </asp:ListView>
                <asp:DataPager ID="Number1" runat="server" PagedControlID="ListView1" PageSize="1"> </asp:DataPager>
            </div>
        <hr style="margin-bottom:30px"/>
        <%--<div class="form-group">
                        <label>Filter by Status:</label><br />
                        <asp:DropDownList ID="drlStatus" runat="server" SelectedIndexChanged="drlStatus_SelectedIndexChanged">
                            <asp:ListItem Enabled="true" Text="Select" Value="3"></asp:ListItem>
                            <asp:ListItem Text="Pending" Value="2"></asp:ListItem>
                            <asp:ListItem Text="Approved" Value="1"></asp:ListItem>
                            <asp:ListItem Text="Rejected" Value="0"></asp:ListItem>
                        </asp:DropDownList> 
            <asp:Button ID="btnOk" runat="server" Text="Ok" class="btn btn-primary btn-lg" OnClick="btnOk_Click" />
                    </div>--%>
        <div class="col-sm-12 overauto">
                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CssClass="table table-responsive" CellPadding="4" DataKeyNames="event_id" Font-Names="Arial" Font-Size="Medium" ForeColor="#333333" GridLines="None"  AllowPaging="True" AllowSorting="true"  DataSourceID="SqlDataSource1"  OnRowCommand="GridView2_RowCommand">
                            
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField DataField="event_id" HeaderText="ID" ReadOnly="True" SortExpression="event_id" InsertVisible="False" ItemStyle-Width="50px" HeaderStyle-Font-Underline="true" />
                                <asp:BoundField DataField="event_timestamp" HeaderText="Timestamp" SortExpression="event_timestamp" HeaderStyle-Font-Underline="true" ItemStyle-Width="10%" />
                                <asp:BoundField DataField="event_group" HeaderText="Org Group" SortExpression="event_group" HeaderStyle-Font-Underline="true" />
                                <asp:BoundField DataField="event_name" HeaderText="Event Name" SortExpression="event_name" HeaderStyle-Font-Underline="true" ItemStyle-ForeColor="OrangeRed" ItemStyle-Width="20%" ItemStyle-Font-Bold="true" />
                                
                                <asp:BoundField DataField="event_start_date" HeaderText="Start Date" SortExpression="event_start_date" HeaderStyle-Font-Underline="true" />
                                <asp:BoundField DataField="event_end_date" HeaderText="End Date" SortExpression="event_end_date" HeaderStyle-Font-Underline="true" />
                                <asp:BoundField DataField="event_venue" HeaderText="Venue" SortExpression="event_venue" HeaderStyle-Font-Underline="true" />
                                <%--<asp:BoundField DataField="event_status" HeaderText="Status" SortExpression="event_status" HeaderStyle-Font-Underline="true" />--%>
                                <asp:BoundField DataField="event_comments" HeaderText="Comments" SortExpression="event_comments" HeaderStyle-Font-Underline="true" />
                                <asp:ButtonField ButtonType="Button" ControlStyle-Width="100px" HeaderText="Details" Text="View" ControlStyle-CssClass="btn btn-primary" HeaderStyle-Font-Underline="true"   />
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
                            <EmptyDataTemplate>
                                <h3>There are no events with this status.</h3>
                            </EmptyDataTemplate>
                        </asp:GridView>
                    </div>
                </div>
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT  event_id, event_name, event_timestamp, event_category, event_group, event_status, event_comments, event_venue, event_start_time, event_end_time, FORMAT (event_start_date, 'ddd dd MMM yyyy') as event_start_date,  FORMAT (event_end_date, 'ddd dd MMM yyyy') as event_end_date FROM [EVENTS_CREATED] WHERE ([event_status] = @event_status2)">
        <SelectParameters>
            
            <asp:QueryStringParameter Name="event_status2" QueryStringField="status" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>

    
    <br />
    <br />
<div class="col-sm-3"></div>
</asp:Content>

