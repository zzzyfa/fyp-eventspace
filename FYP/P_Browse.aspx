<%@ Page Language="C#" MasterPageFile="User.master" AutoEventWireup="true" CodeFile="P_Browse.aspx.cs" Inherits="FYP.P_Browse" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Event Catalogue | SoftwareBiz</title>
    <%--<link href="css/style.css" rel="stylesheet" />--%>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--<section id="portfolio">
        <div class="container">
            <div class="center">
                <p>Our softwares cater to a range of business needs, including Accounting, Marketing, and Procurement</p>
            </div>

            <ul class="portfolio-filter text-center">
                <li><a class="btn btn-default active" href="#" data-filter="*">All Works</a></li>
                <li><a class="btn btn-default" href="#" data-filter=".BS">Business</a></li>
                <li><a class="btn btn-default" href="#" data-filter=".IT">IT</a></li>
                <li><a class="btn btn-default" href="#" data-filter=".EG">Engineering</a></li>
                <li><a class="btn btn-default" href="#" data-filter=".EX">Extra-curricular</a></li>
                <li><a class="btn btn-default" href="#" data-filter=".OT">Others</a></li>
            </ul>
            <!--/#portfolio-filter-->
        </div>
        <div class="container">
            <div class="">
                <div class="portfolio-items">
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [EVENTS_CREATED]"></asp:SqlDataSource>
                    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                        <LayoutTemplate>
                            <div id="itemPlaceHolderContainer" runat="server">
                                <span id="itemPlaceHolder" runat="server" />
                            </div>
                        </LayoutTemplate>
                        <ItemTemplate>
                            <div class="portfolio-item <%# Eval("event_category")%> col-xs-12 col-sm-4 col-md-3">
                                <div class="recent-work-wrap" style="height:400px; width:250px">
                                    <image src="upload/<%# Eval("event_poster")%>" alt="" height="150" width="150" ; />
                                    <div class="overlay">
                                        <div class="recent-work-inner">
                                            <h3><a href="#"><%# Eval("event_name")%></a></h3>
                                            <p><%# Eval("event_description")%></p>
                                            <a class="preview" href="P_EventDetail.aspx?id=<%# Eval("event_id") %>"><i class="fa fa-eye"></i>View</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--/.portfolio-item-->

                        </ItemTemplate>
                    </asp:ListView>



                    


                    <%--//this is the original way without db

                         <div class="portfolio-item apps col-xs-12 col-sm-4 col-md-3">
                        <div class="recent-work-wrap">
                            <img class="img-responsive" src="images/portfolio/recent/item1.png" alt="">
                            <div class="overlay">
                                <div class="recent-work-inner">
                                    <h3><a href="#">Business theme</a></h3>
                                    <p>There are many variations of passages of Lorem Ipsum available, but the majority</p>
                                    <a class="preview" href="images/portfolio/full/item1.png" rel="prettyPhoto"><i class="fa fa-eye"></i>View</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--/.portfolio-item-->
                </div>
            </div>
        </div>
    </section>--%>
    <!--/#portfolio-item-->
    <asp:HiddenField ID="HiddenField1" runat="server" Value="approved" />
    <div class="banner_bottom">
        <div class="container">
            <h3 class="tittle-w3ls">Projects</h3>
            <div class="inner_sec_info_wthree_agile">
                <!--/projects-->
                <ul class="portfolio-categ filter">
                    <li class="port-filter all active">
                        <a href="#">All</a>
                    </li>
                    <li class="BS">
                        <a href="#" title="Category 1">Business</a>
                    </li>
                    <li class="IT">
                        <a href="#" title="Category 2">IT</a>
                    </li>
                    <li class="EG">
                        <a href="#" title="Category 3">Engineering</a>
                    </li>
                    <li class="EX">
                        <a href="#" title="Category 3">Extra-curricular</a>
                    </li>
                    <li class="OT">
                        <a href="#" title="Category 3">Others</a>
                    </li>

                    <%--<li class="cat-item-4">
                        <a href="#" title="Category 4">Category 4</a>
                    </li>--%>
                </ul>

                <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
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
                        &nbsp;&nbsp;</div>
                    </li>
                        </ul>
                    </ItemTemplate>
                </asp:ListView>


                <!--end portfolio-area -->
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [EVENTS_CREATED]"></asp:SqlDataSource>
            </div>

        </div>
        <!--//projects-->

    </div>
</asp:Content>
