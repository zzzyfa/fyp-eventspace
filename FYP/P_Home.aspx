<%@ Page Language="C#" MasterPageFile="User.master" AutoEventWireup="true" CodeFile="P_Home.aspx.cs" Inherits="FYP.P_Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Home | EventSpace</title>
    <link href="css/home.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        $(document).ready(function () {
            $('.carousel').carousel({
                interval: 2500
            })
        });
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="main-slider" class="no-margin">
        <div class="carousel slide" style="margin-top: 100px">
            <div class="carousel-inner">
                <div class="item active shade" style="background-image: url(images/apu_bg.jpg); opacity: 80; height:400px">
                    <div class="container">
                        <%--<div class="row slide-margin">--%>
                            <div class="col-sm-6">
                                <div class="carousel-content" >
                                    <h2 class="animation animated-item-1">Welcome to<span> EventSpace</span></h2>
                                    <p class="animation animated-item-2" style="color:white">Find hot happenings in APU!</p>
                                 
                                </div>
                            </div>

                            <%-- <div class="col-sm-6 hidden-xs animation animated-item-4">
                                <div class="slider-img">
                                    <img src="images/slider/img3.png" class="img-responsive">
                                </div>
                            </div>--%>
                        <%--</div>--%>
                    </div>
                </div>
                <!--/.item-->
            </div>
            <!--/.carousel-inner-->
        </div>

        <!--/.carousel-->
    </section>
    
    <div class="banner_bottom" style="padding:50px 0px 0px 0px">
        <div class="container">
            <h3 style="text-align:center"><image src="/images/featured2.png" height="50" ></image></h3><br />
            <h3 class="tittle-w3ls"> This Month's Events</h3>
             <hr style="height: 0.7px; color: lightgrey; background-color: lightgrey" />
             <div class="inner_sec_info_wthree_agile">
            <ul class="portfolio-area" style="margin-top: 50px">
            <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource2">
                    <LayoutTemplate>
                        <div id="itemPlaceHolderContainer" runat="server">
                            <span id="itemPlaceHolder" runat="server" />
                        </div>
                    </LayoutTemplate>
                    <EmptyDataTemplate>
                        <h4>Oops, no events this month. Checkout other events <a href="P_Browse.aspx">here</a>.</h4>
                    </EmptyDataTemplate>
                    <ItemTemplate>
                        <li class="portfolio-item2">
                            <div style="height: 300px; margin-bottom: 40px;">
                                <span class="image-block block2" style="margin-right: 100px">
                                  
                                    <img src="upload/<%# Eval("event_poster")%>" height="200" width="350" alt="Conceit">

                                    <div class="port-info" style="width: 350px; margin-right: 50px">
                                        <h5 style="text-align:center"><a href="P_EventDetail.aspx?id=<%# Eval("event_id") %>"><%# Eval("event_name")%></a></h5>
                                      <%--  <p>
                                            <%# Eval("event_start_date")%> - <%# Eval("event_end_date")%><br />
                                            <%# Eval("event_start_time")%> - <%# Eval("event_end_time")%><br />
                                            <%# Eval("event_venue") %>
                                        </p>--%>
                                    </div>
                                        
                                    </a>
                                </span>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            </div>
                        </li>
                    </ItemTemplate>
                </asp:ListView>
                </ul>
                 <asp:DataPager ID="Number1" runat="server" PagedControlID="ListView2" PageSize="3"> </asp:DataPager>
            </div>
            </div>
        </div>

    <asp:HiddenField ID="HiddenField1" runat="server" Value="approved" />
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT event_id, event_name, event_poster, event_category FROM [EVENTS_CREATED] WHERE event_status=@event_status AND event_start_date Between Cast(GETDATE() AS DATE) AND CAST(DATEADD(d, 30, GETDATE()) AS DATE)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="HiddenField1" Name="event_status" PropertyName="Value" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>



    <div class="banner_bottom" style="background-color:aliceblue;padding:80px 0px 60px 0px">
        <div class="container" >
            <h3 class="tittle-w3ls">About Us</h3>
             <hr style="height: 0.7px; color: lightgrey; background-color: lightgrey" />
            <div class="inner_sec_info_wthree_agile">
                <div class="help_full">

                    <div class="col-md-6 banner_bottom_grid help">
                        <img src="images/eventabout.jpg" alt=" " class="img-responsive">
                    </div>
                    <div class="col-md-6 banner_bottom_left">
                        <h4>The Hub of APU Events</h4>
                        <p>
                            EventSpace aims to facilitate event management and registration carried out by any student or staff within APU community.

                        </p>
                        <p>
                            As a user, you can act as both event organiser and participant at the same time. You can publish and manage events on behalf of your club, whilst also registering for other events as per your personal interest.
                        </p>
                        <p>
                            The events can be on campus or outside, as long as the target audience are APU community. Submitted events will await for approval from Student Affairs before it is published for sale.
                        </p>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
            
        </div>
    </div>
    <div class="works">
        <div class="container">
            <h3 class="tittle-w3ls cen">What Participants can do</h3>
            <div class="inner_sec_info_wthree_agile">
                <div class="ser-first">
                    <div class="col-md-4 ser-first-grid text-center">
                        <span class="fa fa-shield" aria-hidden="true"></span>
                        <h3>Browse All Events</h3>
                        <p>Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.</p>
                    </div>
                    <div class="col-md-4 ser-first-grid text-center">
                        <span class="fa fa-pencil" aria-hidden="true"></span>
                        <h3>Register for Events</h3>
                        <p>Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.</p>
                    </div>
                    <div class="col-md-4 ser-first-grid text-center">
                        <span class="fa fa-star" aria-hidden="true"></span>
                        <h3>Access Web Ticket</h3>
                        <p>Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.</p>
                    </div>
                    <%--<div class="col-md-3 ser-first-grid text-center">
						<span class="fa fa-thumbs-up" aria-hidden="true"></span>
						<h3>User Experience</h3>
						<p>Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.</p>
					</div>--%>
                    <div class="clearfix"></div>
                </div>
            </div>

        </div>

    </div>
    <div class="works" style="background-color: white">
        <div class="container">
            <h3 class="tittle-w3ls cen" style="color: black">What Event Organisers can do</h3>
            <div class="inner_sec_info_wthree_agile">
                <div class="ser-first">
                    <div class="col-md-3 ser-first-grid text-center">
                        <span class="fa fa-shield" aria-hidden="true" style="color: black"></span>
                        <h3 style="color: black">Submit & Publish Events</h3>
                        <p>Submit event proposal, and once approved, the system automatically publish the event for sale</p>
                    </div>
                    <div class="col-md-3 ser-first-grid text-center">
                        <span class="fa fa-pencil" aria-hidden="true" style="color: black"></span>
                        <h3 style="color: black">Manage Events</h3>
                        <p>Manage details of all submitted and approved events</p>
                    </div>
                    <div class="col-md-3 ser-first-grid text-center">
                        <span class="fa fa-star" aria-hidden="true" style="color: black"></span>
                        <h3 style="color: black">Keep Track of Sales</h3>
                        <p>Easily access sales report of the approved events</p>
                    </div>
                    <div class="col-md-3 ser-first-grid text-center">
                        <span class="fa fa-thumbs-up" aria-hidden="true" style="color: black"></span>
                        <h3 style="color: black">Notify Participants</h3>
                        <p>Send email notification to all participants of a particular event easily through the system</p>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>

        </div>

    </div>
    <div class="works">
        <div class="container">
            <h3 class="tittle-w3ls cen">What Student Affairs can do</h3>
            <div class="inner_sec_info_wthree_agile">
                <div class="ser-first">
                    <div class="col-md-6 ser-first-grid text-center">
                        <span class="fa fa-shield" aria-hidden="true"></span>
                        <h3>Review Event Proposals</h3>
                        <p>Review each proposal submitted by event organisers and cross-check if the event request can be fulfilled</p>
                    </div>
                    <div class="col-md-6 ser-first-grid text-center">
                        <span class="fa fa-pencil" aria-hidden="true"></span>
                        <h3>Approve / Reject Events</h3>
                        <p>Update the approval status of proposal with comments</p>
                    </div>

                    <div class="clearfix"></div>
                </div>
            </div>

        </div>
    </div>
    
    <!--/#main-slider-->

    <%--<div class="feature">
        <div class="container">

            <h3>Categories</h3>
            <hr style="margin-bottom: 50px" />


            <asp:SqlDataSource ID="SqlDataSource1" runat="server" OnSelecting="SqlDataSource1_Selecting" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT * FROM [EVENTS_CREATED]"></asp:SqlDataSource>


            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                <LayoutTemplate>
                    <div id="itemPlaceHolderContainer" runat="server">
                        <span id="itemPlaceHolder" runat="server" />
                    </div>
                </LayoutTemplate>
                <ItemTemplate>
                </ItemTemplate>
            </asp:ListView>
    


            <!-- End Carousel -->
        </div>
        </div>--%>
</asp:Content>

