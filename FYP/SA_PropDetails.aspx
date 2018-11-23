<%@ Page Language="C#" MasterPageFile="Admin.master" AutoEventWireup="true" CodeFile="SA_PropDetails.aspx.cs" Inherits="FYP.SA_PropDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Proposal Details | SoftwareBiz</title>
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="assets/css/github.min.css" rel="stylesheet" />
    <link href="dist/bootstrap-clockpicker.min.css" rel="stylesheet" />
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/highlight.min.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <asp:HiddenField ID="HiddenField_Id1" runat="server" />


        <div class="row contact-wrap">

            <div class="status alert alert-success" style="display: none"></div>
            <div id="main-contact-form" class="contact-form">
                <div class="col-sm-3"></div>

                <div class="col-sm-6">
                    <div style="text-align: center; margin-top: 120px">
                        
                            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                                <LayoutTemplate>
                                    <div id="itemPlaceHolderContainer" runat="server">
                                        <span id="itemPlaceHolder" runat="server" />
                                    </div>
                                </LayoutTemplate>
                                <ItemTemplate>
                                    <h2><%# Eval("event_status") %> Proposal: <span style="color: orangered; font-weight: bold"><%#Eval("event_name") %></span></h2>
                                </ItemTemplate>

                            </asp:ListView>
                            <asp:DataPager ID="Number1" runat="server" PagedControlID="ListView1" PageSize="1"></asp:DataPager>
                            <%--<h2>Sales Reports for</h2>--%>
                        <br />
                        <br />
                        <h4>Basic Details</h4>

                    </div>
                    <hr style="height: 0.7px; color: lightgrey; background-color: lightgrey" />
                    
                    <div class="form-group">
                        <label>Organising Club:</label>
                        <asp:TextBox ID="txtOrgClub" runat="server" class="form-control" ReadOnly="true"></asp:TextBox>
                        <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator6" runat="server" ErrorMessage="This field is required." ControlToValidate="txtOrgClub"></asp:RequiredFieldValidator><br />
                    </div>
                    <div class="form-group">
                        <label>Event Name:</label>
                        <asp:TextBox ID="txtName" runat="server" class="form-control" ReadOnly="true"></asp:TextBox>
                        <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator1" runat="server" ErrorMessage="This field is required." ControlToValidate="txtName"></asp:RequiredFieldValidator><br />
                    </div>
                    <div class="form-group">
                        <label>Category:</label>
                        <asp:TextBox ID="txtCategory" runat="server" class="form-control" ReadOnly="true"></asp:TextBox>
                          <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator12" runat="server" ErrorMessage="This field is required." ControlToValidate="txtStartTime"></asp:RequiredFieldValidator><br />
                    </div>
                    <div class="form-group">
                        <label>Start Date:</label>
                        <asp:TextBox ID="txtStartDate" runat="server" class="form-control" Width="160px" ReadOnly="true"></asp:TextBox>
                      <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator8" runat="server" ErrorMessage="This field is required." ControlToValidate="txtStartTime"></asp:RequiredFieldValidator><br />
                    </div>

                    <div class="form-group">
                        <label>End Date:</label>
                        <asp:TextBox ID="txtEndDate" runat="server" class="form-control" Width="160px" ReadOnly="true"></asp:TextBox>
                          <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator7" runat="server" ErrorMessage="This field is required." ControlToValidate="txtStartTime"></asp:RequiredFieldValidator><br />
                    </div>

                    <div class="form-group">
                        <label>Start Time:</label>
                        <asp:TextBox ID="txtStartTime" runat="server" class="form-control" ReadOnly="true"></asp:TextBox>
                        <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator9" runat="server" ErrorMessage="This field is required." ControlToValidate="txtStartTime"></asp:RequiredFieldValidator><br />
                    </div>
                    <div class="form-group">
                        <label>End Time:</label>
                        <asp:TextBox ID="txtEndTime" runat="server" class="form-control" ReadOnly="true"></asp:TextBox>
                        <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator10" runat="server" ErrorMessage="This field is required." ControlToValidate="txtEndTime"></asp:RequiredFieldValidator><br />
                    </div>

                    <div class="form-group">
                        <label>Venue <span style="color:red; font-weight:900">*</span></label>
                        <asp:TextBox ID="txtVenue" runat="server" class="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator3" runat="server" ErrorMessage="This field is required." ControlToValidate="txtVenue"></asp:RequiredFieldValidator><br />
                    </div>

                    <div class="form-group" style="height:300px">
                        <label style="margin-bottom:10px">Event Banner Image:</label>
                        <br />
                        <img src="upload/<%=image%>" height="100%" width="100%" /><br />
                        <asp:Label ID="Label1" runat="server" style="color:black"><%=image %></asp:Label><br /><br />
                    </div>
                    <br />
                    <br />
                    
                    <div style="text-align: center; margin-top:30px">
                        <h4>Further Details</h4>

                    </div>
                    <hr style="height: 0.7px; color: lightgrey; background-color: lightgrey" />
                    <div class="form-group">
                        <label>Formal Event Description:</label><br />
                        <label style="font-size: small">For admin review.</label>
                        <asp:TextBox ID="txtFormalDesc" runat="server" class="form-control" TextMode="MultiLine" MaxLength="1000" ReadOnly="true" Height="200px"></asp:TextBox>
                        <label style="font-size: small; color: grey">Word limit: 1000 words</label>
                        <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator2" runat="server" ErrorMessage="This field is required." ControlToValidate="txtFormalDesc"></asp:RequiredFieldValidator><br />
                    </div>
                    <br />
                    <div class="form-group">
                        <label>Event Description:</label><br />
                        <label style="font-size: small">For target audience.</label>
                        <asp:TextBox ID="txtDescr" runat="server" class="form-control" TextMode="MultiLine" MaxLength="500" ReadOnly="true" Height="200px"></asp:TextBox>
                        <label style="font-size: small; color: grey">Word limit: 500 words</label>
                        <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator11" runat="server" ErrorMessage="This field is required." ControlToValidate="txtDescr"></asp:RequiredFieldValidator><br />
                    </div>
                    <br />
                    
                    <div class="form-group">
                        <label>Ticket Price:</label>
                        <asp:TextBox ID="txtPrice" step=".01" runat="server" TextMode="Number" class="form-control" ReadOnly="true"></asp:TextBox>
                        <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator4" runat="server" ErrorMessage="This field is required." ControlToValidate="txtPrice"></asp:RequiredFieldValidator><br />
                    </div>

                    <div class="form-group">
                        <label>Participant Eligibility:</label><br />
                        <asp:TextBox ID="txtEligibility" runat="server" class="form-control" ReadOnly="true"></asp:TextBox>
                    </div>
                    <br />
                    <div class="form-group">
                        <label>Number of Participants:</label>
                        <asp:TextBox ID="txtNoOfP" runat="server" TextMode="Number" class="form-control" ReadOnly="true"></asp:TextBox>
                        <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator13" runat="server" ErrorMessage="This field is required." ControlToValidate="txtNoOfP"></asp:RequiredFieldValidator><br />
                    </div>
                    <br />
                    <div class="form-group" style="margin-bottom: 40px;">
                        <label>Registration Closing Date:</label>
                        <asp:TextBox ID="txtRegClose" runat="server" class="form-control" Width="200px" ReadOnly="true"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Resources Needed from APU:</label><br />
                        <label style="font-size: small">PA System, Transportation, Tables, etc.</label>
                        <asp:TextBox ID="txtResources" runat="server" class="form-control" TextMode="MultiLine" MaxLength="500" ReadOnly="true"></asp:TextBox>
                    </div>
                    <br />
                    <div class="form-group">
                        <label>Additional Remarks:</label><br />
                        <asp:TextBox ID="txtRemarks" runat="server" class="form-control" TextMode="MultiLine" MaxLength="500" ReadOnly="true"></asp:TextBox>
                    </div>
                    <br />
                    <div class="form-group">
                        <label>Comments <span style="color:red; font-weight:900">*</span></label><br />
                        <asp:TextBox ID="txtComments" runat="server" class="form-control" TextMode="MultiLine" MaxLength="500"></asp:TextBox>
                        <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator5" runat="server" ErrorMessage="This field is required." ControlToValidate="txtComments"></asp:RequiredFieldValidator><br />
                    </div>
                    <div class="form-group" style="margin-top: 30px; position:center">
                        <asp:Button ID="btnApprove" runat="server" Text="Approve" class="btn btn-primary btn-lg" OnClick="btnApprove_Click" />
                        &nbsp&nbsp&nbsp<asp:Button ID="btnReject" runat="server" Text="Reject" class="btn btn-primary btn-lg" OnClick="btnReject_Click" />
                    </div>
                </div>

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [EVENTS_CREATED] WHERE ([event_id] = @event_id)">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="event_id" QueryStringField="id" Type="Decimal" />
                    </SelectParameters>
                </asp:SqlDataSource>

                <div class="col-sm-3" style="margin-bottom: 50px"></div>
            </div>
        </div>
        <!--/.row-->
    </div>
</asp:Content>

