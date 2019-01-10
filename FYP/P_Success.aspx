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
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT event_poster, event_id, event_name, event_venue, event_price, FORMAT (event_start_date, 'ddd dd MMM yyyy') as event_start_date, FORMAT (event_end_date, 'ddd dd MMM yyyy') as event_end_date, event_start_time, event_end_time FROM [EVENTS_CREATED] WHERE ([event_id] = @prodID)">
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
                               
                                    <ul class="portfolio-area">
                                        <li class="portfolio-item" style="width: 100%">
                                            <div>
                                                <span class="image-block block2" style="float: left">
                                                    <img src="upload/<%# Eval("event_poster")%>" class="img-responsive" style="width: 250px; height: auto; overflow: hidden">
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
                        <br />
                        <div class="form-group" style="margin-top:20px">
                            <br />
                            <br />
                            <br />
                            <asp:Button ID="btnPurchHist" runat="server" Text="View Web Ticket" class="btn btn-primary btn-lg" OnClick="btnPurchHist_Click" />

                        </div>
                        <br />
                    </div>
                </div>

            </div>


        </div>
    </section>

</asp:Content>

