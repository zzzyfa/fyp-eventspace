<%@ Page Language="C#" MasterPageFile="User.master" AutoEventWireup="true" CodeFile="EO_MsgHist.aspx.cs" Inherits="FYP.EO_MsgHist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Message History | EventSpace</title>
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="assets/css/github.min.css" rel="stylesheet" />
    <link href="dist/bootstrap-clockpicker.min.css" rel="stylesheet" />
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/highlight.min.js"></script>
    <style type="text/css">
        .hidden {
            display: none;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="center" style="margin-top: 130px">
            <h2>Message History</h2>
        </div>
        <hr style="height: 0.8px; color: lightgrey; background-color: lightgrey; margin-bottom: 30px" />
        <div class="col-sm-12 overauto">
            <asp:GridView ID="GridView2" runat="server" CssClass="table table-responsive" AutoGenerateColumns="False" GridLines="None" AllowPaging="True" OnRowCommand="GridView2_RowCommand" DataSourceID="SqlDataSource1" PageSize="15">
                <%--AllowSorting="true" OnSorting="gridView_Sorting" --%>
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="message_id" HeaderText="ID" SortExpression="message_id" HeaderStyle-Font-Underline="true" />
                    <asp:BoundField DataField="message_timestamp" HeaderText="Timestamp" SortExpression="message_timestamp" HeaderStyle-Font-Underline="true" ItemStyle-Width="10%" />
                    <asp:BoundField DataField="message_event_name" HeaderText="Event Name" SortExpression="message_event_name" HeaderStyle-Font-Underline="true" />
                    <asp:BoundField DataField="message_subject" HeaderText="Subject" SortExpression="event_name" HeaderStyle-Font-Underline="true" ItemStyle-ForeColor="OrangeRed" ItemStyle-Width="20%" ItemStyle-Font-Bold="true" />
                    <asp:BoundField DataField="message_body" HeaderText="Message Body" SortExpression="message_body" HeaderStyle-Font-Underline="true" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblDesc" Text="<%# Eval("message_body").ToString().Shorten( 20) %>" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:ButtonField ButtonType="Button" ControlStyle-Width="100px" HeaderText="View" Text="Edit" ControlStyle-CssClass="btn btn-primary" HeaderStyle-Font-Underline="true" />
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
                    <h3>You have not sent any messages yet.</h3>
                </EmptyDataTemplate>
            </asp:GridView>
        </div>
    </div>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [MESSAGES] WHERE ([message_user_id] = @user_id)">
        <SelectParameters>
            <asp:QueryStringParameter Name="user_id" QueryStringField="custid" Type="Decimal" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <br />
    <div class="col-sm-3"></div>



</asp:Content>
