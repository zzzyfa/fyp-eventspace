<%@ Page Language="C#" MasterPageFile="User.master" AutoEventWireup="true" CodeFile="P_SearchEvents.aspx.cs" Inherits="FYP.P_SearchEvents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Search Events | SoftwareBiz</title>
    <%--<link href="css/style.css" rel="stylesheet" />--%>
   <style type="text/css">
      /*.input{
            display: block;
  width: 100%;
  height: 34px;
  padding: 6px 12px;
  font-size: 14px;
  line-height: 1.42857143;
  color: #555;
  background-color: #fff;
  background-image: none;
  border: 1px solid #ccc;
  border-radius: 4px;
  -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
          box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
  -webkit-transition: border-color ease-in-out .15s, -webkit-box-shadow ease-in-out .15s;
       -o-transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
          transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
      }
      .button{
      }*/
       
       .a:hover{
           text-decoration:underline;
       }
   </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:HiddenField ID="HiddenField1" runat="server" Value="approved" />
    <asp:HiddenField ID="HiddenField2" runat="server" Value="all" />
    
        <div class="container" style="margin-top:130px; margin-bottom:50px">
            <a href="P_Browse.aspx"><h5 style="color: orangered" class="a">←Back to Full Event Catalog</h5></a>
            
            <h3 class="tittle-w3ls">Search Events</h3>
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
                <%--<hr />--%>
                <hr style="height:0.5px; color:lightgrey; background-color:lightgrey" />
                 <label style="margin-bottom:10px">Search Keyword: </label>&nbsp<asp:Label runat="server" ID="lblSearch"></asp:Label>
                <div>
                   
                <asp:TextBox ID="txtSearch" runat="server" class="form-control" placeholder="Enter event name..."></asp:TextBox><asp:Button ID="btnSearch" runat="server" Text="Search" class="btn btn-primary btn-lg" OnClick="btnSearch_Click" />
                    </div>
               
                <ul class="portfolio-area" style="margin-top: 50px">
                    
                   <%-- <%if (Session["userid"] != null)
                        { %>
                    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                        <LayoutTemplate>
                            <div id="itemPlaceHolderContainer" runat="server">
                                <span id="itemPlaceHolder" runat="server" />
                            </div>
                        </LayoutTemplate>
                        <ItemTemplate>

                            <li class="portfolio-item2" data-id="id-7" data-type="<%#Eval("event_category") %>">
                                <div style="height:300px">
                                    <span class="image-block block2">
                                        <img src="upload/<%# Eval("event_poster")%>"  width="300" height="200" alt="Conceit">
                                        <div class="port-info" style="width:300px">
                                            <h5><a href="P_EventDetail.aspx?id=<%# Eval("event_id") %>"><%# Eval("event_name")%></a></h5>
                                            <p><%# Eval("event_start_date")%> - <%# Eval("event_end_date")%></p>
                                            <p><%# Eval("event_start_time")%> - <%# Eval("event_end_time")%></p>
                                        </div>
                                        </a>
                                    </span>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                </div>
                            </li>

                        </ItemTemplate>
                    </asp:ListView>
                    <%}
                    else
                    { %>--%>
                    <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource2">
                        <LayoutTemplate>
                            <div id="itemPlaceHolderContainer" runat="server">
                                <span id="itemPlaceHolder" runat="server" />
                            </div>
                        </LayoutTemplate>
                 <ItemTemplate>

                            <li class="portfolio-item2" data-id="id-7" data-type="<%#Eval("event_category") %>">
                                <div style="height:300px; margin-bottom:40px;">
                                    <span class="image-block block2" style="margin-right:100px">
                                        <img src="upload/<%# Eval("event_poster")%>"  height="200" width="300" alt="Conceit">
                                        <div class="port-info" style="width:100%; margin-right:50px">
                                            <h5><a href="P_EventDetail.aspx?id=<%# Eval("event_id") %>"><%# Eval("event_name")%></a></h5>
                                            <p><%# Eval("event_start_date")%> - <%# Eval("event_end_date")%><br />
                                            <%# Eval("event_start_time")%> - <%# Eval("event_end_time")%><br />
                                            <%# Eval("event_venue") %></p>
                                        </div>
                                        </a>
                                    </span>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                </div>
                            </li>

                        </ItemTemplate>
                        <EmptyDataTemplate>
                            <h4>There are no events with that name.</h4>
                        </EmptyDataTemplate>
                    </asp:ListView>
                    <%--<%} %>--%>
                </ul>

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [EVENTS_CREATED] WHERE (([event_eligibility] = @event_eligibility) OR ( [event_eligibility] = @event_eligibility2) AND ([event_status] = @event_status))">
                    <SelectParameters>
                        <asp:SessionParameter Name="event_eligibility" SessionField="userOccu" Type="String" />
                        <asp:ControlParameter ControlID="HiddenField1" Name="event_status" PropertyName="Value" Type="String" />
                        <asp:ControlParameter ControlID="HiddenField2" Name="event_eligibility2" PropertyName="Value" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>

                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [EVENTS_CREATED] WHERE event_name LIKE @event_name AND event_status=@event_status">
                    <SelectParameters>
                         
            <asp:QueryStringParameter Name="event_name" QueryStringField="key" Type="String" />
        
                        <asp:ControlParameter ControlID="HiddenField1" Name="event_status" PropertyName="Value" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>

                <!--end portfolio-area -->

            </div>

        </div>
        <!--//projects-->

    <%--</div>--%>
</asp:Content>