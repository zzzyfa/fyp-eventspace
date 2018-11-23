<%@ Page Language="C#" MasterPageFile="User.master" AutoEventWireup="true" CodeFile="P_Success.aspx.cs" Inherits="FYP.P_Success" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Registration Successful | EventSpace</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="contact-page">
        <div class="container">


            <div style="text-align:center; margin-top:100px">
                <h3>You have successfully signed up for this event.</h3>
            </div>
            <div style="text-align:center">
                <h4>Thank you for joining!</h4>
            </div>

            <div class="row contact-wrap">
                <div class="status alert alert-success" style="display: none"></div>
                <div id="main-contact-form2" class="contact-form">
                    <div class="col-sm-2"></div>
                    <div class="col-sm-8">
                        <br />
                        <br />
                        <div>
                            <h3>Order Summary</h3>
                            <hr />
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [EVENTS_CREATED] WHERE ([event_id] = @prodID)">
                                <SelectParameters>
                                    <asp:QueryStringParameter Name="prodID" QueryStringField="prodID" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                                <LayoutTemplate>
                                    <div id="itemPlaceHolderContainer" runat="server">
                                        <span id="itemPlaceHolder" runat="server" />
                                    </div>
                                </LayoutTemplate>
                                <ItemTemplate>
                                    <%--<div>
                                        <h4 style="font-weight: bold"><%# Eval("event_name")%></h4>
                                        <div class="col-md-3">
                                            <img src="upload/<%# Eval("event_poster") %>" class="img-responsive" height="100" width="100">
                                        </div>

                                        <div style="float: right; width: 200px">
                                            <div>
                                                <h5 class="media-heading" style="float: left">Date: </h5>
                                                <h5 class="media-heading" style="float: right"><%# Eval("event_start_date") %> - <%# Eval("event_end_date") %></h5>
                                            </div>
                                            <br />
                                            <div>
                                                <h5 class="media-heading" style="float: left">Time: </h5>
                                                <h5 class="media-heading" style="float: right"><%# Eval("event_start_time") %> - <%# Eval("event_end_time") %></h5>
                                            </div>
                                            <br />
                                            <div>
                                                <h5 class="media-heading" style="float: left">Venue: </h5>
                                                <h5 class="media-heading" style="float: right"><%# Eval("event_venue") %></h5>
                                            </div>
                                            <br />
                                            <div>
                                                <h5 class="media-heading" style="float: left">Ticket Price: </h5>
                                                <h5 class="media-heading" style="float: right">RM <%# Eval("event_price")%></h5>
                                            </div>
                                            <br />

                                        </div>
                                    </div>--%>
                                    <ul class="portfolio-area">
                                        <li class="portfolio-item" style="width: 100%">
                                            <div>
                                                <span class="image-block block2" style="float: left">
                                                    <img src="upload/<%# Eval("event_poster")%>" class="img-responsive" style="width: 150px; height: auto; overflow: hidden">
                                                </span>

                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<div class="port-info" style="float: right;">
                                                    <h5><a href="P_EventDetail.aspx?id=<%# Eval("event_id") %>"><%# Eval("event_name")%></a></h5>
                                                    <p>
                                                        <%# Eval("event_start_date")%> - <%# Eval("event_end_date")%><br />
                                                        <%# Eval("event_start_time")%> - <%# Eval("event_end_time")%><br />
                                                        <%# Eval("event_venue")%><br />
                                                        RM <%# Eval("event_price")%>
                                                    </p>
                                                </div>

                                                &nbsp;&nbsp;
                                            </div>
                                        </li>
                                    </ul>
                                </ItemTemplate>
                            </asp:ListView>
                        </div>
                        <div class="form-group" style="margin-top:20px">
                            <br />
                            <br />

                            <asp:Button ID="btnPurchHist" runat="server" Text="View Web Ticket" class="btn btn-primary btn-lg" OnClick="btnPurchHist_Click" />

                        </div>
                    </div>
                </div>

            </div>


        </div>
    </section>

</asp:Content>

