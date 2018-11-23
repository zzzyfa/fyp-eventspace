<%@ Page Language="C#" MasterPageFile="User.master" AutoEventWireup="true" CodeFile="P_PurchHist.aspx.cs" Inherits="FYP.P_PurchHist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Purchase History | EventSpace</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="contact-page">
        <div class="container">
            <div style="text-align: center; margin-top: 100px">
                <h2>Purchase History</h2>
                <asp:HiddenField ID="HiddenField1" runat="server" />
            </div>
            <div class="row contact-wrap">
                <div class="status alert alert-success" style="display: none"></div>
                <div id="main-contact-form" class="contact-form">

                    <div class="col-sm-2"></div>
                    <div class="col-sm-8">
                        <br />
                        <div class="form-group">
                            <h3>Upcoming</h3>
                        </div>
                        <%--<hr style="margin-bottom:30px; height:1px;border:none;color:#333;background-color:#333;"/>--%>
                        <hr style="height:0.5px; color:lightgrey; background-color:lightgrey" />
                        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                            <EmptyDataTemplate>
                                <h4>You have not registered for any upcoming events.</h4>
                            </EmptyDataTemplate>
                            <LayoutTemplate>
                                <div id="itemPlaceHolderContainer" runat="server">
                                    <span id="itemPlaceHolder" runat="server" />
                                </div>
                            </LayoutTemplate>
                            <ItemTemplate>
                                <ul class="portfolio-area">
                                    <li class="portfolio-item" style="width:100%; margin-bottom:20px">
                                        <div>
                                            <span class="image-block block2" style="text-align:center">
                                                <img src="upload/<%# Eval("event_poster")%>" height="180" width="300" style="overflow:hidden; margin: 0 auto">
                                            </span>
                                            
                                            <div class="port-info" style="height:180px; text-align:center; width:300px; margin: 0 auto">
                                                    <h5><a href="P_EventDetail.aspx?id=<%# Eval("event_id") %>"><%# Eval("event_name")%></a></h5>
                                                    <p style="text-align:center">
                                                        <%# Eval("event_start_date")%> - <%# Eval("event_end_date")%><br />
                                                        <%# Eval("event_start_time")%> - <%# Eval("event_end_time")%><br />
                                                        <%# Eval("event_venue") %>
                                                        <h4 style="border:2px; background-color:darkblue; color:white; padding:5px; border-radius:15px">Ticket ID #<%# Eval("ticket_id") %></h4>
                                                    </p>
                                                </div>
                                                
                                            &nbsp;&nbsp;
                                        </div>
                                    </li>
                                </ul>
                            </ItemTemplate>
                        </asp:ListView>
                        <br />
                        <br />
                    </div>


                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT p.event_id, p.ticket_id, p.user_id, c.event_name, c.event_poster, c.event_start_date, c.event_end_date, c.event_start_time, c.event_end_time, c.event_venue FROM EVENTS_PURCHASED AS p INNER JOIN EVENTS_CREATED AS c ON p.event_id = c.event_id INNER JOIN USERS AS u ON p.user_id = u.user_id WHERE u.user_id=@custID">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="custID" QueryStringField="custid" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT p.payID, p.datepayment, p.quantity, p.totalPrice, p.userID, p.status, p.prodID, s.prodName FROM payments AS p INNER JOIN softwares AS s ON p.prodID = s.prodID INNER JOIN users AS u ON p.userID = u.userID WHERE u.userID=@custID">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="HiddenField1" Name="status" PropertyName="Value" Type="String" />
                                <asp:QueryStringParameter Name="custID" QueryStringField="custid" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    <br />
                    <br />
                </div>

                <div class="col-sm-3"></div>

            </div>
            <!--/.row-->
            <div class="row contact-wrap">
                <div class="contact-form">
                    <div class="col-sm-2"></div>
                    <div class="col-sm-8">
                        <br />
                        <div class="form-group">
                            <h3>Past</h3>
                        </div>
                        <hr style="height:0.5px; color:lightgrey; background-color:lightgrey" />
                         <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource2" >
                             
                            <EmptyDataTemplate>
                                <h4 style="margin-bottom:50px">You have no past events yet.</h4>
                            </EmptyDataTemplate>
                            <LayoutTemplate>
                                <div id="itemPlaceHolderContainer" runat="server">
                                    <span id="itemPlaceHolder" runat="server" />
                                </div>
                            </LayoutTemplate>
                            <ItemTemplate>
                                <ul class="portfolio-area">

                                    <li class="portfolio-item2" data-id="id-7" data-type="<%#Eval("event_category") %>">
                                        <div>
                                            <span class="image-block block2">
                                                <img src="upload/<%# Eval("event_poster")%>" class="img-responsive" height="150" width="150" alt="Conceit">
                                                <div class="port-info">
                                                    <h5><a href="P_EventDetail.aspx?id=<%# Eval("event_id") %>"><%# Eval("event_name")%></a></h5>
                                                    <p><%# Eval("event_start_date")%> - <%# Eval("event_end_date")%></p>
                                                    <p><%# Eval("event_start_time")%> - <%# Eval("event_end_time")%></p>
                                                </div>
                                                </a>
                                            </span>
                                            &nbsp;&nbsp;
                                        </div>
                                    </li>
                                </ul>
                            </ItemTemplate>
                        </asp:ListView>
                    </div>
                </div>
            </div>
        </div>

        <!--/.container-->
    </section>
</asp:Content>
