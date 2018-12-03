<%@ Page Language="C#"  MasterPageFile="User.master" AutoEventWireup="true" CodeFile="EO_ReportDetailSearch.aspx.cs" Inherits="FYP.EO_ReportDetailSearch" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <title>View Event Report | EventSpace</title>
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
            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource2">
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
        <hr style="height: 0.7px; color: lightgrey; background-color: lightgrey; margin-bottom: 30px" />
        <label style="margin-bottom: 10px">Search Keyword: </label>
            &nbsp<asp:Label runat="server" ID="lblSearch"></asp:Label>
                <asp:TextBox ID="txtSearch" runat="server" class="form-control" placeholder="Enter name..."></asp:TextBox>
                    <asp:Button ID="btnSearch" runat="server" Text="Search" class="btn btn-primary btn-lg" OnClick="btnSearch_Click" />  &nbsp&nbsp&nbsp
                <asp:Button ID="btnReload" runat="server" Text="Reload" class="btn btn-primary btn-lg" OnClick="btnReload_Click" />
        
        <div class="col-sm-12 overauto" style="margin-top:30px">
            <%--<%if (shirt == "Y" && food == "Y")
                { %>--%>
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CssClass="table table-responsive" DataKeyNames="event_id" GridLines="None" AllowPaging="True" AllowSorting="true" OnSorting="gridView_Sorting" >
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="user_id" HeaderText="ID" ReadOnly="True" SortExpression="event_id" InsertVisible="False" ItemStyle-Width="50px" HeaderStyle-Font-Underline="true" />

                    <asp:BoundField DataField="payment_timestamp" HeaderText="Timestamp" SortExpression="payment_timestamp" HeaderStyle-Font-Underline="true" ItemStyle-Width="10%" />
                    <asp:BoundField DataField="user_name" HeaderText="Full Name" SortExpression="user_name" HeaderStyle-Font-Underline="true"  ItemStyle-ForeColor="OrangeRed" ItemStyle-Width="20%" ItemStyle-Font-Bold="true"  />
                    <asp:BoundField DataField="user_mobile_no" HeaderText="Phone No" SortExpression="user_mobile_no" HeaderStyle-Font-Underline="true" />
                    <asp:BoundField DataField="user_email" HeaderText="Email" SortExpression="user_email" HeaderStyle-Font-Underline="true" />
                    <asp:BoundField DataField="user_alt_email" HeaderText="Alternate Email" SortExpression="user_alt_email" HeaderStyle-Font-Underline="true" />
                    
                    <asp:BoundField DataField="user_shirt_size" HeaderText="Shirt Size" SortExpression="user_shirt_size" HeaderStyle-Font-Underline="true" />
                    <asp:BoundField DataField="user_food" HeaderText="Food Preference" SortExpression="user_food" HeaderStyle-Font-Underline="true" />
                    

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
                    <h4>There are no tickets sold for this event as of now.</h4>
                </EmptyDataTemplate>
            </asp:GridView>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT p.event_id,  p.payment_timestamp,  p.user_id, c.event_name, u.user_name, u.user_mobile_no, u.user_email, u.user_alt_email, u.user_occupation, u.user_shirt_size, u.user_food FROM EVENTS_PURCHASED AS p INNER JOIN EVENTS_CREATED AS c ON p.event_id = c.event_id INNER JOIN USERS AS u ON p.user_id = u.user_id WHERE p.event_id=@custID AND u.user_name LIKE '%' + @full_name + '%'">
                <SelectParameters>
                    <asp:QueryStringParameter Name="custID" QueryStringField="id" Type="Int32" />
                    <asp:QueryStringParameter Name="full_name" QueryStringField="key" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [events_created] WHERE event_id=@custID">
                <SelectParameters>
                    <asp:QueryStringParameter Name="custID" QueryStringField="id" Type="Int32" />

                </SelectParameters>
            </asp:SqlDataSource>
            <div style="margin-top:50px">
            <div class="col-md-4">
               
                <div style="margin-bottom: 5px">
                        <h4 style="text-decoration:underline">Ticket Totals</h4>
                        <br />
                        <asp:Label runat="server" class="media-heading" Style="float: left">Tickets Sold: </asp:Label>
                      <asp:Label runat="server" ID="lblTickets" class="media-heading" Style="float: right"></asp:Label><br />
                    </div>
                    <div style="margin-bottom: 5px">
                        <asp:Label runat="server" class="media-heading" Style="float: left">Total Amount: </asp:Label>
                        <asp:Label runat="server" ID="lblAmount" class="media-heading" Style="float: right"></asp:Label><br />
                    </div>

               
            </div>
                </div>
             <div class="col-md-4">
                    <div style="margin-bottom: 5px">
                        <h4 style="text-decoration:underline">Summary of Shirt Sizes</h4>
                        <br />
                        <asp:Label runat="server" class="media-heading" Style="float: left">Size XS: </asp:Label>
                        <asp:Label runat="server" ID="Label1" class="media-heading" Style="float: right">xxxxx</asp:Label><br />
                    </div>
                    <div style="margin-bottom: 5px">
                        <asp:Label runat="server" class="media-heading" Style="float: left">Size S: </asp:Label>
                        <asp:Label runat="server" ID="Label2" class="media-heading" Style="float: right">xxxxx</asp:Label><br />
                    </div>
                    <div style="margin-bottom: 5px">
                        <asp:Label runat="server" class="media-heading" Style="float: left">Size M: </asp:Label>
                        <asp:Label runat="server" ID="Label3" class="media-heading" Style="float: right">xxxxx</asp:Label><br />
                    </div>
                    <div style="margin-bottom: 5px">
                        <asp:Label runat="server" class="media-heading" Style="float: left">Size L: </asp:Label>
                        <asp:Label runat="server" ID="Label4" class="media-heading" Style="float: right">xxxxx</asp:Label><br />
                    </div>
                    <div style="margin-bottom: 5px">
                        <asp:Label runat="server" class="media-heading" Style="float: left">Size XL: </asp:Label>
                        <asp:Label runat="server" ID="Label5" class="media-heading" Style="float: right">xxxxx</asp:Label><br />
                    </div>
                    <div style="margin-bottom: 5px">
                        <asp:Label runat="server" class="media-heading" Style="float: left">Size XXL: </asp:Label>
                        <asp:Label runat="server" ID="Label6" class="media-heading" Style="float: right">xxxxx</asp:Label><br />
                    </div>
                    <br />
                    <br />
                </div>

                <div class="col-md-4">
                    <div style="margin-bottom: 5px">
                        <h4 style="text-decoration:underline">Summary of Food Preference</h4>
                        <br />
                        <asp:Label runat="server" class="media-heading" Style="float: left">Vegetarian: </asp:Label>
                        <asp:Label runat="server" ID="Label7" class="media-heading" Style="float: right">xxxxx</asp:Label><br />
                    </div>
                    <div style="margin-bottom: 5px">
                        <asp:Label runat="server" class="media-heading" Style="float: left">Non-vegetarian: </asp:Label>
                        <asp:Label runat="server" ID="Label8" class="media-heading" Style="float: right">xxxxx</asp:Label><br />
                    </div>
                </div>
            <br />
            <%--<div>
                    <asp:Label runat="server" class="media-heading" Style="float: left">Size M: </asp:Label>
                    <asp:Label runat="server" ID="Label3" class="media-heading" Style="float: right">xx</asp:Label>
                </div>
                <br />
                <div>
                    <asp:Label runat="server" class="media-heading" Style="float: left">Size L: </asp:Label>
                    <asp:Label runat="server" ID="Label4" class="media-heading" Style="float: right">xx</asp:Label>
                </div>
                <br />--%>
        </div>



    </div>





    <br />
    <br />
    <div class="col-sm-3"></div>
</asp:Content>