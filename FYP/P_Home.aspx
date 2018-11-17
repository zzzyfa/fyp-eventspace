<%@ Page Language="C#" MasterPageFile="User.master" AutoEventWireup="true" CodeFile="P_Home.aspx.cs" Inherits="FYP.P_Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Home | EventSpace</title>
    <link href="css/home.css" rel="stylesheet" type="text/css" /> 
   <script type="text/javascript">
$(document).ready(function () {
$('.carousel').carousel({
interval:2500
})
});
</script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="main-slider" class="no-margin">
        <div class="carousel slide" style="margin-top: 100px">
            <div class="carousel-inner">
                <div class="item active shade" style="background-image: url(images/apu_bg.jpg); opacity: 80">
                    <div class="container">
                        <div class="row slide-margin">
                            <div class="col-sm-6">
                                <div class="carousel-content">
                                    <h2 class="animation animated-item-1">Welcome to<span> EventSpace</span></h2>
                                    <p class="animation animated-item-2">Find hot happenings in APU!</p>
                                    <a class="btn-slide animation animated-item-3" href="AboutUs.aspx" style="background-color: darkblue">Read More</a>
                                </div>
                            </div>

                            <%-- <div class="col-sm-6 hidden-xs animation animated-item-4">
                                <div class="slider-img">
                                    <img src="images/slider/img3.png" class="img-responsive">
                                </div>
                            </div>--%>
                        </div>
                    </div>
                </div>
                <!--/.item-->
            </div>
            <!--/.carousel-inner-->
        </div>
        <!--/.carousel-->
    </section>
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
