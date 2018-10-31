<%@ Page Language="C#" MasterPageFile="User.master" AutoEventWireup="true" CodeBehind="P_Success.aspx.cs" Inherits="FYP.P_Success" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Registration Successful | EventSpace</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="contact-page">
        <div class="container">


            <div class="center" style="margin-top: 150px; margin-left: 410px">
                <h3>Your order has been received.</h3>
            </div>
            <div class="center" style="position: center; margin-left: 450px">
                <h4>Thank you for your purchase.</h4>
            </div>

            <div class="row contact-wrap">
                <div class="status alert alert-success" style="display: none"></div>
                <div id="main-contact-form2" class="contact-form">
                    <div class="col-sm-3"></div>
                    <div class="col-sm-6">
                        <br />
                        <br />
                        <div style="border: 5px solid lightgrey; padding: 10px 25px 10px 25px; height: 250px">
                            <h3>Order Summary</h3>
                            <hr />
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [softwares] WHERE ([prodID] = @prodID)">
                                <SelectParameters>
                                    <asp:QueryStringParameter Name="prodID" QueryStringField="prodid" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                                <LayoutTemplate>
                                    <div id="itemPlaceHolderContainer" runat="server">
                                        <span id="itemPlaceHolder" runat="server" />
                                    </div>
                                </LayoutTemplate>
                                <ItemTemplate>
                                    <div>
                                        <h4 style="font-weight: bold"><%# Eval("prodName")%></h4>
                                        <div class="col-md-3">
                                            <img src="upload/<%# Eval("image") %>" class="img-responsive" height="100" width="100">
                                        </div>

                                        <div style="float: right; width: 200px">
                                            <div>
                                                <h5 class="media-heading" style="float: left">Price per Unit: </h5>
                                                <h5 class="media-heading" style="float: right">RM <%# Eval("price")%></h5>
                                            </div>
                                            <br />
                                            <div>
                                                <h5 class="media-heading" style="float: left">Quantity: </h5>
                                                <h5 class="media-heading" style="float: right"><%=Request.QueryString["quantity"] %></h5>
                                            </div>
                                            <br />
                                            <div>
                                                <h5 class="media-heading" style="float: left">Total Price: </h5>
                                                <h5 class="media-heading" style="float: right">RM <%=Request.QueryString["total"] %></h5>
                                            </div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:ListView>
                        </div>
                    </div>
                </div>

            </div>

            <div class="col-sm-3"></div>
            <div class="col-sm-3"></div>
            <div class="form-group" style="margin-left: 290px">
                <br />
                <br />


                <h5>Your order is being processed.
                    <br />
                    <br />
                    Kindly check back within 1-3 days to download the products.</h5>
                <asp:Button ID="btnCheckOrder" runat="server" Text="Check Order Status" class="btn btn-primary btn-lg" OnClick="btnCheckOrder_Click" />

            </div>
        </div>
    </section>

</asp:Content>

