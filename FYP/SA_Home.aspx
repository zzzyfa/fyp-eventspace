<%@ Page Language="C#" MasterPageFile="Admin.master" AutoEventWireup="true" CodeFile="SA_Home.aspx.cs" Inherits="FYP.SA_Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Home - Student Affairs | EventSpace</title>
    <link href="css/home.css" rel="stylesheet" type="text/css" /> 


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
                                    <p class="animation animated-item-2">Review and approve event proposals here.</p>
                                   <%-- <a class="btn-slide animation animated-item-3" href="AboutUs.aspx" style="background-color: darkblue">Read More</a>--%>
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

    
</asp:Content>