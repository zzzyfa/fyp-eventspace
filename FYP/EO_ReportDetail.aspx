<%@ Page Language="C#" MasterPageFile="User.master" AutoEventWireup="true" CodeFile="EO_ReportDetail.aspx.cs" Inherits="FYP.EO_ReportDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <title>View Event Reports | EventSpace</title>
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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="center" style="margin-top: 130px">
            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                <LayoutTemplate>
                    <div id="itemPlaceHolderContainer" runat="server">
                        <span id="itemPlaceHolder" runat="server" />
                    </div>
                </LayoutTemplate>
                <ItemTemplate>
                    <h2>Sales Report : <span style="color: orangered; font-weight: bold"><%#Eval("event_name") %></span></h2>
                </ItemTemplate>

            </asp:ListView>
            <asp:DataPager ID="Number1" runat="server" PagedControlID="ListView1" PageSize="1"></asp:DataPager>
            <%--<h2>Sales Reports for</h2>--%>
        </div>
        <hr />
        <div class="col-sm-12 overauto">
            
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CssClass="table table-responsive" DataKeyNames="event_id" GridLines="None" AllowPaging="True" AllowSorting="true" OnSorting="gridView_Sorting" >
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="user_id" HeaderText="ID" ReadOnly="True" SortExpression="event_id" InsertVisible="False" ItemStyle-Width="50px" HeaderStyle-Font-Underline="true" />

                    <asp:BoundField DataField="payment_timestamp" HeaderText="Timestamp" SortExpression="payment_timestamp" HeaderStyle-Font-Underline="true" />
                    <asp:BoundField DataField="user_name" HeaderText="Full Name" SortExpression="user_name" HeaderStyle-Font-Underline="true" />
                    <asp:BoundField DataField="user_mobile_no" HeaderText="Phone No" SortExpression="user_mobile_no" HeaderStyle-Font-Underline="true" />
                    <asp:BoundField DataField="user_email" HeaderText="Email" SortExpression="user_email" HeaderStyle-Font-Underline="true" />
                    <asp:BoundField DataField="user_alt_email" HeaderText="Alternate Email" SortExpression="user_alt_email" HeaderStyle-Font-Underline="true" />
                    <asp:BoundField DataField="user_shirt_size" HeaderText="Shirt Size" SortExpression="user_shirt_size" HeaderStyle-Font-Underline="true" />
                    <asp:BoundField DataField="user_food" HeaderText="Food Preference" SortExpression="user_food" HeaderStyle-Font-Underline="true" />
                    <asp:BoundField DataField="user_occupation" HeaderText="Occupation" SortExpression="user_type" HeaderStyle-Font-Underline="true" />

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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT p.event_id,  p.payment_timestamp,  p.user_id, c.event_name, u.user_name, u.user_mobile_no, u.user_email, u.user_alt_email, u.user_occupation, u.user_shirt_size, u.user_food FROM EVENTS_PURCHASED AS p INNER JOIN EVENTS_CREATED AS c ON p.event_id = c.event_id INNER JOIN USERS AS u ON p.user_id = u.user_id WHERE p.event_id=@custID">
                <SelectParameters>
                    <asp:QueryStringParameter Name="custID" QueryStringField="id" Type="Int32" />
                    
                </SelectParameters>
            </asp:SqlDataSource>

            <div style="float: right; width: 200px">
                <div>
                    <asp:Label runat="server" class="media-heading" Style="float: left">Tickets Sold: </asp:Label>
                    <asp:Label runat="server" ID="lblTickets" class="media-heading" Style="float: right"></asp:Label>
                </div>
                <br />
                <div>
                    <asp:Label runat="server" class="media-heading" Style="float: left">Total Amount: </asp:Label>
                    <asp:Label runat="server" ID="lblAmount" class="media-heading" Style="float: right"></asp:Label>
                </div>
                <br />

            </div>
        </div>

        </div>


        <br />
        <br />
        <div class="col-sm-3"></div>
</asp:Content>
