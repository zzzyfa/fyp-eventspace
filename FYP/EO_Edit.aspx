<%@ Page Language="C#" MasterPageFile="User.master" AutoEventWireup="true" CodeFile="EO_Edit.aspx.cs" Inherits="FYP.EO_Edit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Edit Event | SoftwareBiz</title>
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="assets/css/github.min.css" rel="stylesheet" />
    <link href="dist/bootstrap-clockpicker.min.css" rel="stylesheet" />
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/highlight.min.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" style="margin-top: 150px">
        <asp:HiddenField ID="HiddenField_Id1" runat="server" />
        <div style="text-align: center">
            <h2>Edit Event</h2>

        </div>
        <div class="row contact-wrap">

            <div class="status alert alert-success" style="display: none"></div>
            <div id="main-contact-form" class="contact-form">
                <div class="col-sm-3"></div>

                <div class="col-sm-6">
                    <div style="text-align: center; margin-top: 30px">
                        <h4>Basic Details</h4>

                    </div>
                    <div>
                        <hr style="height: 0.7px; color: lightgrey; background-color: lightgrey" />
                        <label style="margin-bottom:30px"><span style="color:red; font-weight:900">*</span> <span style="font-weight:400">Required</span></label>
                        <div class="form-group">
                            <label>Organising Club <span style="color:red; font-weight:900">*</span></label>
                            <asp:TextBox ID="txtOrgClub" runat="server" class="form-control" ReadOnly="true"></asp:TextBox>
                            <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator6" runat="server" ErrorMessage="This field is required." ControlToValidate="txtOrgClub"></asp:RequiredFieldValidator><br />
                        </div>
                        <div class="form-group">
                            <label>Event Name <span style="color:red; font-weight:900">*</span></label>
                            <asp:TextBox ID="txtName" runat="server" class="form-control" ReadOnly="true"></asp:TextBox>
                            <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator1" runat="server" ErrorMessage="This field is required." ControlToValidate="txtName"></asp:RequiredFieldValidator><br />
                        </div>
                        <div class="form-group">
                            <label>Category <span style="color:red; font-weight:900">*</span></label>
                            <asp:DropDownList ID="drlCategory" runat="server" class="form-control">
                                <asp:ListItem Enabled="true" Text="Select Category" Value="-1"></asp:ListItem>
                                <asp:ListItem Text="Business" Value="BS"></asp:ListItem>
                                <asp:ListItem Text="IT" Value="IT"></asp:ListItem>
                                <asp:ListItem Text="Engineering" Value="EG"></asp:ListItem>
                                <asp:ListItem Text="Sports" Value="SP"></asp:ListItem>
                                <asp:ListItem Text="Others" Value="OT"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator17" runat="server" ErrorMessage="This field is required." ControlToValidate="drlCategory" InitialValue="-1"></asp:RequiredFieldValidator><br />
                        </div>



                        <div class="row class1s" style="margin-bottom: 40px; margin-top: 40px">
                            <div class="col-md-4">
                                <label>Start Date <span style="color:red; font-weight:900">*</span></label>
                                <asp:TextBox ID="txtStartDate" runat="server" class="form-control" Width="160px" ReadOnly="true" TextMode="DateTime"></asp:TextBox>
                            </div>
                        </div>

                        <div class="row class1s" style="margin-bottom: 40px; margin-top: 40px">
                            <div class="col-md-4">
                                <label>End Date <span style="color:red; font-weight:900">*</span></label>
                                <asp:TextBox ID="txtEndDate" runat="server" class="form-control" Width="160px" ReadOnly="true" TextMode="DateTime"></asp:TextBox>
                            </div>
                        </div>



                        <div class="form-group">
                            <label>Start Time <span style="color:red; font-weight:900">*</span></label>
                            <asp:TextBox ID="txtStartTime" runat="server" class="form-control" ReadOnly="true"></asp:TextBox>
                            <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator9" runat="server" ErrorMessage="This field is required." ControlToValidate="txtStartTime"></asp:RequiredFieldValidator><br />
                        </div>
                        <div class="form-group">
                            <label>End Time <span style="color:red; font-weight:900">*</span></label>
                            <asp:TextBox ID="txtEndTime" runat="server" class="form-control" ReadOnly="true"></asp:TextBox>
                            <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator10" runat="server" ErrorMessage="This field is required." ControlToValidate="txtEndTime"></asp:RequiredFieldValidator><br />
                        </div>





                        <div class="form-group">
                            <label>Venue <span style="color:red; font-weight:900">*</span></label>
                            <asp:TextBox ID="txtVenue" runat="server" class="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator3" runat="server" ErrorMessage="This field is required." ControlToValidate="txtVenue"></asp:RequiredFieldValidator><br />
                        </div>

                        <div class="form-group" style="height: 300px; margin-bottom: 30px">
                            <label>Event Banner Image <span style="color:red; font-weight:900">*</span></label>
                            <label style="font-size: small">Kindly ensure your banner is optimized for 851 pixels wide and 315 pixels tall.</label>
                            <img src="upload/<%=image%>" class="img-responsive" height="100px" width="200px" /><br />
                            <asp:Label ID="Label1" runat="server" Style="color: black"><%=image %></asp:Label><br />
                            <br />
                            <asp:FileUpload ID="uploadPic" class="form-control" runat="server" text="Upload a photo" method="post" enctype="multipart/form-data" name="productpic1" />

                        </div>


                    </div>
                <div style="text-align: center; margin-top: 20px">
                    <h4>Further Details</h4>

                </div>
                <hr style="height: 0.7px; color: lightgrey; background-color: lightgrey" />
                <div class="form-group">
                    <label>Event Background <span style="color:red; font-weight:900">*</span></label><br />
                    <label style="font-size: small">For admin review</label>
                    <asp:TextBox ID="txtFormalDesc" runat="server" class="form-control" TextMode="MultiLine" MaxLength="1000" Height="200px" ></asp:TextBox>
                    <label style="font-size: small; color: grey">Word limit: 1000 words</label>
                    <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator2" runat="server" ErrorMessage="This field is required." ControlToValidate="txtFormalDesc"></asp:RequiredFieldValidator><br />
                </div>
                <br />
                <div class="form-group">
                    <label>Event Description <span style="color:red; font-weight:900">*</span></label><br />
                    <label style="font-size: small">For target audience</label>
                    <asp:TextBox ID="txtDescr" runat="server" class="form-control" TextMode="MultiLine" MaxLength="500" Height="200px" ></asp:TextBox>
                    <label style="font-size: small; color: grey">Word limit: 500 words</label>
                    <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator11" runat="server" ErrorMessage="This field is required." ControlToValidate="txtDescr"></asp:RequiredFieldValidator><br />
                </div>
                <br />
                <div class="form-group">
                    <asp:CheckBox ID="chkFree" runat="server" Text="This is a free event" OnCheckedChanged="chkFree_CheckedChanged" AutoPostBack="true" />

                </div>
                <br />
                <asp:Panel runat="server" CssClass="form-group" ID="panelPrice">
                    <label>Ticket Price <span style="color:red; font-weight:900">*</span></label>
                    <asp:TextBox ID="txtPrice" step=".01" runat="server" TextMode="Number" class="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator4" runat="server" ErrorMessage="This field is required." ControlToValidate="txtPrice"></asp:RequiredFieldValidator><br />
                </asp:Panel>

                <div class="form-group">
                    <label>Participant Eligibility <span style="color:red; font-weight:900">*</span></label><br />
                    <asp:DropDownList ID="drlEligibility" runat="server" class="form-control">
                        <asp:ListItem Enabled="true" Text="Select" Value="-1"></asp:ListItem>
                        <asp:ListItem Text="Open to all" Value="All"></asp:ListItem>
                        <asp:ListItem Text="Students Only" Value="Student"></asp:ListItem>
                        <asp:ListItem Text="Staff Only" Value="Staff"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator12" runat="server" ErrorMessage="This field is required." ControlToValidate="drlEligibility" InitialValue="-1"></asp:RequiredFieldValidator><br />
                </div>
                <br />
                <div class="form-group">
                    <label>Max Number of Participants <span style="color:red; font-weight:900">*</span></label>
                    <asp:TextBox ID="txtNoOfP" runat="server" TextMode="Number" class="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator13" runat="server" ErrorMessage="This field is required." ControlToValidate="txtNoOfP"></asp:RequiredFieldValidator><br />
                </div>
                <br />
                <div class="form-group" style="margin-bottom: 40px;">
                    <label>Registration Closing Date <span style="color:red; font-weight:900">*</span></label>
                    <asp:TextBox ID="txtRegClose" runat="server" class="form-control" TextMode="Date"></asp:TextBox>
                    <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator14" runat="server" ErrorMessage="This field is required." ControlToValidate="txtRegClose"></asp:RequiredFieldValidator>
                    <asp:CompareValidator id="CompareValidator2" runat="server" 
     ControlToCompare="txtStartDate" cultureinvariantvalues="true" 
     display="Dynamic" enableclientscript="true"  
     ControlToValidate="txtRegClose"  ForeColor="Red"
     ErrorMessage="Registration closing date must be earlier than start date."
     type="Date" setfocusonerror="true" Operator="GreaterThanEqual" 
     text="Registration closing date must be earlier than start date."></asp:CompareValidator><br />
                </div>
                <%--<div class="form-group">
                    <label>Resources Needed from APU <span style="color:red; font-weight:900">*</span></label><br />
                    <label style="font-size: small">PA System, Transportation, Tables, etc. If none, please type "N/A".</label>
                    <asp:TextBox ID="txtResources" runat="server" class="form-control" TextMode="MultiLine" MaxLength="500"></asp:TextBox>
                    <label style="font-size: small; color: grey">Word limit: 500 words</label>
                    <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator15" runat="server" ErrorMessage="This field is required." ControlToValidate="txtResources"></asp:RequiredFieldValidator><br />
                </div>
                <br />--%>
                     <div class="form-group">
                        <label>Resources Needed from APU <span style="color:red; font-weight:900"></span></label><br />

                        <label style="font-size: small">For checked items, please make booking at the respective link.</label>
                        <asp:CheckBoxList ID="CheckBoxList1" runat="server">
                            <asp:ListItem Value="Room"> Room / Auditorium (<a href="http://bit.ly/APU001">bit.ly/APU001</a>) </asp:ListItem>
                             <asp:ListItem Value="Transportation"> Transportation (<a href="http://bit.ly/APU002">bit.ly/APU002</a>) </asp:ListItem>
                            <asp:ListItem Value="Logistics/Booth"> Logistics / Atrium / Booth (<a href="http://bit.ly/APU003">bit.ly/APU003</a>)  </asp:ListItem> 
                            <asp:ListItem Value="Audio/Visual"> Audio & Visual (<a href="http://bit.ly/APU005">bit.ly/APU005</a>)  </asp:ListItem>
                            <asp:ListItem Value="Certificates"> Certificates </asp:ListItem>
                        </asp:CheckBoxList>
                        
                    </div>
                    <br />
                <div class="form-group">
                    <label>Additional Remarks (Optional)</label><br />
                    <asp:TextBox ID="txtRemarks" runat="server" class="form-control" TextMode="MultiLine" MaxLength="500"></asp:TextBox>
                    <label style="font-size: small; color: grey">Word limit: 500 words</label>
                </div>
                <br />
                <div class="form-group" style="margin-top: 30px; margin-bottom:30px">
                    <asp:Button ID="btnUpdate" runat="server" Text="Save Changes" class="btn btn-primary btn-lg" OnClick="btnUpdate_Click" />
                </div>
                </div>
                <div class="col-sm-3" style="margin-bottom: 50px"></div>
            </div>

        </div>
        <!--/.row-->
    </div>

</asp:Content>

