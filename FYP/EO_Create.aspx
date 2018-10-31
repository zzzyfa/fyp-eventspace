<%@ Page Language="C#" MasterPageFile="User.master" AutoEventWireup="true" CodeFile="EO_Create.aspx.cs" Inherits="FYP.EO_Create" %>




<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Create New Event | SoftwareBiz</title>
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="assets/css/github.min.css" rel="stylesheet" />
    <link href="dist/bootstrap-clockpicker.min.css" rel="stylesheet" />
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/highlight.min.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div style="text-align: center">
            <h2>Create New Event</h2>

        </div>
        <div class="row contact-wrap">

            <div class="status alert alert-success" style="display: none"></div>
            <div id="main-contact-form" class="contact-form">
                <div class="col-sm-3"></div>

                <div class="col-sm-6">
                    <hr style="margin-bottom: 50px" />
                    <div class="form-group">
                        <label>Organising Club:</label>
                        <asp:TextBox ID="txtOrgClub" runat="server" class="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator6" runat="server" ErrorMessage="This field is required." ControlToValidate="txtOrgClub"></asp:RequiredFieldValidator><br />
                    </div>
                    <div class="form-group">
                        <label>Event Name:</label>
                        <asp:TextBox ID="txtName" runat="server" class="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator1" runat="server" ErrorMessage="This field is required." ControlToValidate="txtName"></asp:RequiredFieldValidator><br />
                    </div>
                    <div class="form-group">
                        <label>Category:</label>
                        <asp:DropDownList ID="drlCategory" runat="server" class="form-control">
                            <asp:ListItem Enabled="true" Text="Select Category" Value="-1"></asp:ListItem>
                            <asp:ListItem Text="Business" Value="BS"></asp:ListItem>
                            <asp:ListItem Text="IT" Value="IT"></asp:ListItem>
                            <asp:ListItem Text="Engineering" Value="EG"></asp:ListItem>
                            <asp:ListItem Text="Extra-Curricular" Value="EX"></asp:ListItem>
                            <asp:ListItem Text="Others" Value="OT"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator17" runat="server" ErrorMessage="This field is required." ControlToValidate="drlCategory" InitialValue="-1"></asp:RequiredFieldValidator><br />
                    </div>



                    <div class="row class1s" style="margin-bottom: 40px; margin-top: 40px">
                        <div class="col-md-4">
                            <label>Start Date:</label>
                            <asp:TextBox ID="txtStartDate" runat="server" class="form-control" Width="160px"></asp:TextBox>
                        </div>
                        <div class="col-md-4" style="margin-top: 15px">
                            <asp:Button ID="btnStartDate" runat="server" Text="Choose" class="btn btn-primary btn-lg" OnClick="btnStartDate_Click" CausesValidation="False" />
                        </div>
                        <div style="width: 200px; margin-left: auto; margin-right: auto; margin-top: auto">
                            <asp:Calendar ID="CalendarStart" runat="server" Visible="False" OnSelectionChanged="CalendarStart_SelectionChanged"></asp:Calendar>
                        </div>
                        <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator7" runat="server" ErrorMessage="This field is required." ControlToValidate="txtStartDate"></asp:RequiredFieldValidator><br />
                    </div>

                    <div class="row class1s" style="margin-bottom: 40px; margin-top: 40px">
                        <div class="col-md-4">
                            <label>End Date:</label>
                            <asp:TextBox ID="txtEndDate" runat="server" class="form-control" Width="160px"></asp:TextBox>
                        </div>
                        <div class="col-md-4" style="margin-top: 15px">
                            <asp:Button ID="btnEndDate" runat="server" Text="Choose" class="btn btn-primary btn-lg" OnClick="btnEndDate_Click" CausesValidation="False" />
                        </div>
                        <div style="width: 200px; margin-left: auto; margin-right: auto; margin-top: auto">
                            <asp:Calendar ID="CalendarEnd" runat="server" Visible="False" OnSelectionChanged="CalendarEnd_SelectionChanged"></asp:Calendar>
                        </div>
                        <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator8" runat="server" ErrorMessage="This field is required." ControlToValidate="txtEndDate"></asp:RequiredFieldValidator><br />
                    </div>

                    <%--<div class="form-group">
                        <div class="col-md-4">
                            <label>Start Time:</label>
                            <div class="input-group clockpicker" data-placement="bottom" data-alignment="left" data-donetext="Done">
                                <input type="text" class="form-control" value="18:00" />
                                <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-time"></span>
                                </span>
                            </div>
                            <script type="text/javascript">
                                $('.clockpicker').clockpicker({
                                    placement: 'top',
                                    align: 'left',
                                    donetext: 'Done'
                                });
                            </script>
                        </div>
                    </div>--%>

                    <div class="form-group">
                        <label>Start Time:</label>
                        <asp:TextBox ID="txtStartTime" runat="server" class="form-control" TextMode="MultiLine"></asp:TextBox>
                        <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator9" runat="server" ErrorMessage="This field is required." ControlToValidate="txtStartTime"></asp:RequiredFieldValidator><br />
                    </div>
                    <div class="form-group">
                        <label>End Time:</label>
                        <asp:TextBox ID="txtEndTime" runat="server" class="form-control" TextMode="MultiLine"></asp:TextBox>
                        <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator10" runat="server" ErrorMessage="This field is required." ControlToValidate="txtEndTime"></asp:RequiredFieldValidator><br />
                    </div>





                    <div class="form-group">
                        <label>Venue:</label>
                        <asp:TextBox ID="txtVenue" runat="server" class="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator3" runat="server" ErrorMessage="This field is required." ControlToValidate="txtVenue"></asp:RequiredFieldValidator><br />
                    </div>

                    <div class="form-group">
                        <label>Event Poster Image:</label>
                        <asp:FileUpload ID="uploadPic" class="form-control" runat="server" text="Upload a photo" method="post" enctype="multipart/form-data" name="productpic1" />
                        <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator5" runat="server" ErrorMessage="Please upload a product image." ControlToValidate="uploadPic"></asp:RequiredFieldValidator><br />
                    </div>
                    <br />
                    <br />

                    <hr />
                    <div class="form-group">
                        <label>Formal Event Description:</label><br />
                        <label style="font-size: small">For admin review.</label>
                        <asp:TextBox ID="txtFormalDesc" runat="server" class="form-control" TextMode="MultiLine" MaxLength="1000"></asp:TextBox>
                        <label style="font-size: small; color: grey">Word limit: 1000 words</label>
                        <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator2" runat="server" ErrorMessage="This field is required." ControlToValidate="txtFormalDesc"></asp:RequiredFieldValidator><br />
                    </div>
                    <br />
                    <div class="form-group">
                        <label>Event Description:</label><br />
                        <label style="font-size: small">For target audience.</label>
                        <asp:TextBox ID="txtDescr" runat="server" class="form-control" TextMode="MultiLine" MaxLength="500"></asp:TextBox>
                        <label style="font-size: small; color: grey">Word limit: 500 words</label>
                        <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator11" runat="server" ErrorMessage="This field is required." ControlToValidate="txtDescr"></asp:RequiredFieldValidator><br />
                    </div>
                    <br />
                    <div class="form-group">
                        <asp:CheckBox ID="CheckBox1" runat="server" Text="This is a free event" />
                    </div>
                    <br />
                    <div class="form-group">
                        <label>Ticket Price:</label>
                        <asp:TextBox ID="txtPrice" step=".01" runat="server" TextMode="Number" class="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator4" runat="server" ErrorMessage="This field is required." ControlToValidate="txtPrice"></asp:RequiredFieldValidator><br />
                    </div>

                    <div class="form-group">
                        <label>Participant Eligibility:</label><br />
                        <asp:DropDownList ID="drlEligibility" runat="server">
                            <asp:ListItem Enabled="true" Text="Select" Value="-1"></asp:ListItem>
                            <asp:ListItem Text="Open to all" Value="ALL"></asp:ListItem>
                            <asp:ListItem Text="Students Only" Value="STU"></asp:ListItem>
                            <asp:ListItem Text="Staff Only" Value="STA"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator12" runat="server" ErrorMessage="This field is required." ControlToValidate="drlEligibility" InitialValue="-1"></asp:RequiredFieldValidator><br />
                    </div>
                    <br />
                    <div class="form-group">
                        <label>Number of Participants:</label>
                        <asp:TextBox ID="txtNoOfP" runat="server" TextMode="Number" class="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator13" runat="server" ErrorMessage="This field is required." ControlToValidate="txtNoOfP"></asp:RequiredFieldValidator><br />
                    </div>
                    <br />
                    <div class="form-group" style="margin-bottom: 40px;">
                        <label>Registration Closing Date:</label>
                        <asp:TextBox ID="txtRegClose" runat="server" class="form-control" Width="200px"></asp:TextBox>
                        <asp:Button ID="btnClosingDate" runat="server" Text="Choose" class="btn btn-primary btn-lg" OnClick="btnClosingDate_Click" CausesValidation="False" />
                        <div style="width: 200px; margin-left: auto; margin-right: auto; margin-top: auto">
                            <asp:Calendar ID="CalendarClose" runat="server" Visible="False" OnSelectionChanged="CalendarClose_SelectionChanged"></asp:Calendar>
                        </div>
                        <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator14" runat="server" ErrorMessage="This field is required." ControlToValidate="txtRegClose"></asp:RequiredFieldValidator><br />
                    </div>
                    <div class="form-group">
                        <label>Resources Needed from APU:</label><br />
                        <label style="font-size: small">PA System, Transportation, Tables, etc.</label>
                        <asp:TextBox ID="txtResources" runat="server" class="form-control" TextMode="MultiLine" MaxLength="500"></asp:TextBox>
                        <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator15" runat="server" ErrorMessage="This field is required." ControlToValidate="txtResources"></asp:RequiredFieldValidator><br />
                    </div>
                    <br />
                    <div class="form-group">
                        <label>Additional Remarks</label><br />
                        <asp:TextBox ID="txtRemarks" runat="server" class="form-control" TextMode="MultiLine" MaxLength="500"></asp:TextBox>
                        <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator16" runat="server" ErrorMessage="This field is required." ControlToValidate="txtRemarks"></asp:RequiredFieldValidator><br />
                    </div>
                    <br />
                    <div class="form-group" style="margin-top: 30px">
                        <asp:Button ID="btnAdd" runat="server" Text="Add Product" class="btn btn-primary btn-lg" OnClick="btnAdd_Click" />
                    </div>
                </div>
                <div class="col-sm-3" style="margin-bottom: 50px"></div>
            </div>
        </div>
        <!--/.row-->
    </div>
</asp:Content>

