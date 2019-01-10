<%@ Page Language="C#" MasterPageFile="User.master" AutoEventWireup="true" CodeFile="P_EventDetail.aspx.cs" Inherits="FYP.P_EventDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Event Details | SoftwareBiz</title>
    <style type="text/css">
        .highlight {
            color: red;
            font-weight: bold;
            font-size: large;
        }

        .list-inline {
            list-style: outside none none;
            margin-left: -5px;
            padding-left: 0;
        }

            .list-inline > li {
                display: inline-block;
                padding-left: 5px;
                padding-right: 5px;
            }

        .social {
            background: url('http://arunendapally.com/themes/CustomTheme/ss.png');
            width: 32px;
            height: 32px;
            display: inline-block;
            background-repeat: no-repeat;
        }

        .facebook {
            background-position: -0px -0px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="fb-root"></div>
    <script>(function (d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = 'https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v3.2&appId=1885268058429320&autoLogAppEvents=1';
    fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>



    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [EVENTS_CREATED] WHERE ([event_id] = @event_id)">
        <SelectParameters>
            <asp:QueryStringParameter Name="event_id" QueryStringField="id" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:HiddenField ID="hiddenRegClose" runat="server" />

    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
        <LayoutTemplate>
            <div id="itemPlaceHolderContainer" runat="server">
                <span id="itemPlaceHolder" runat="server" />
            </div>
        </LayoutTemplate>
        <ItemTemplate>
            <div class="banner_bottom address">
                <div class="banner_bottom_in">
                    <img src="upload/<%# Eval("event_poster") %>" style="height: 315px; width: 100%; margin: 0 auto" class="image-responsive" alt="">
                </div>

            </div>
            <div class="container">
                <div>
                    <h1 style="margin-left: 15px;"><%# Eval("event_name")%></h1>
                    <br />
                    <h4 style="margin-left: 15px;">Organised by <span style="color: orangered; font-weight: bold"><%# Eval("event_group")%></span></h4>
                   <br />

                   
                           <h5 style="margin-left: 15px"> <a target="_blank" href="https://facebook.com/sharer.php?u=<%=url %>" >Click to share</a></h5>
                   
                   <%-- <ul class="list-inline">
                        <li>
                            <a target="_blank" href="<%=url %>" class="social facebook"></a>
                        </li>
                        <li></li>
                    </ul>--%>
                </div>
                <div class="col-md-6">
                    <hr />
                    <div class="media">
                        <ul>
                            <li>
                                <div class="media-left">
                                    <i class="glyphicon glyphicon-calendar"></i>
                                </div>
                                <div class="media-body">
                                    <h4 class="media-heading">Date:</h4>

                                    <p style="text-align: justify">
                                        <%if (start == end)
                                            {%> <%=start%> <%}
                                                               else
                                                               { %> <%=start%> - <%=end %> <%} %>
                                    <p>
                                        <h4 class="media-heading" style="margin-top: 20px">Time:</h4>
                                        <p style="text-align: justify">
                                            <%# Eval("event_start_time") %> - <%# Eval("event_end_time") %>
                                    <p>
                                        <h4 class="media-heading" style="margin-top: 20px">Venue:</h4>
                                        <p style="text-align: justify">
                                            <%# Eval("event_venue") %>
                                    <p>
                                        <h4 class="media-heading" style="margin-top: 20px">Ticket Price:</h4>
                                        <p style="text-align: justify">
                                            <%if (free == "Y")
                                                {%> Free <%}
                                                             else
                                                             { %> <%# Eval("event_price") %> <%} %>
                                </div>
                                <br />
                                <div class="media-left">
                                    <i class="fa fa-facebook-official"></i>
                                </div>
                                <div class="media-body">
                                    <h4 class="media-heading" >Facebook Page:</h4>
                                    <div class="fb-page" data-href="<%# Eval("event_fb_link")  %>" data-tabs="events" data-width="320" data-small-header="true" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true">
                                        <blockquote cite="<%# Eval("event_fb_link") %>" class="fb-xfbml-parse-ignore"><a href="<%# Eval("event_fb_link") %>">Facebook Event Page</a></blockquote>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-6">
                    <hr />
                    <div class="media-left">
                        <i class="fa fa-pencil"></i>
                    </div>
                    <div class="media-body">
                        <h4 class="media-heading">About:</h4>
                        <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine" ReadOnly="true" Wrap="true" Text='<%# Eval("event_description")%>' BorderStyle="None" BorderWidth="0" Rows="13" Width="100%"></asp:TextBox>

                    </div>
                    <br />
                    <div class="media-left">
                        <i class="fa fa-phone"></i>
                    </div>
                    <div class="media-body">

                        <h4 class="media-heading">Contact Person:</h4>
                        <p><%# Eval("event_contact_name") %>     <%# Eval("event_contact_no") %></p>

                    </div>
                </div>
            </div>

        </ItemTemplate>
    </asp:ListView>


    <br />
    <div class="container">

        <div class="form-group" style="margin-top: 30px">
            <asp:HiddenField ID="hiddenCount" runat="server" />
            <asp:HiddenField ID="hiddenLimit" runat="server" />
            <asp:Label runat="server" Text="Sorry. The event registration is closed." Visible="false" ID="lblClose" CssClass="highlight"></asp:Label>
            <asp:Label runat="server" Text="You have already registered for this event." Visible="false" ID="lblAdyReg" CssClass="highlight"></asp:Label>
            <asp:HiddenField ID="hiddenPurch" runat="server" />
            <asp:Button ID="btnCheckout" runat="server" Text="Register Now" class="btn btn-primary btn-lg" OnClick="btnCheckout_Click" Style="border-bottom: 50px" />
        </div>
        <br />


    </div>
</asp:Content>
