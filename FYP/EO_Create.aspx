<%@ Page Language="C#" MasterPageFile="User.master" AutoEventWireup="true" CodeFile="EO_Create.aspx.cs" Inherits="FYP.EO_Create" %>




<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Create New Event | EventSpace</title>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" style="margin-top: 150px">
        
        <div style="text-align: center">
            <h2>Create New Event</h2>
            <asp:Label ID="HiddenField1" runat="server" />
        </div>
        <div class="row contact-wrap">

            <div class="status alert alert-success" style="display: none"></div>
            <div id="main-contact-form" class="contact-form">

                <div class="col-sm-3"></div>

                <div class="col-sm-6">
                    <div style="text-align: center; margin-top: 40px">
                        <h4>Basic Details</h4>

                    </div>
                    <hr style="height: 0.7px; color: lightgrey; background-color: lightgrey" />
                    <label style="margin-bottom: 30px"><span style="color: red; font-weight: 900">*</span> <span style="font-weight: 400">Required</span></label>

                    <div class="form-group">
                        <label>Organising Club <span style="color: red; font-weight: 900">*</span></label>
                        <asp:TextBox ID="txtOrgClub" runat="server" class="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator6" runat="server" ErrorMessage="This field is required." ControlToValidate="txtOrgClub"></asp:RequiredFieldValidator><br />
                    </div>

                    <div class="form-group">
                        <label>Event Name <span style="color: red; font-weight: 900">*</span></label>
                        <asp:TextBox ID="txtName" runat="server" class="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator1" runat="server" ErrorMessage="This field is required." ControlToValidate="txtName"></asp:RequiredFieldValidator><br />
                    </div>
                    <div class="form-group">
                        <label>Event Category <span style="color: red; font-weight: 900">*</span></label>
                        <asp:DropDownList ID="drlCategory" runat="server" class="form-control">
                            <asp:ListItem Enabled="true" Text="Select Category" Value="-1"></asp:ListItem>
                            <asp:ListItem Text="Talks/Workshops" Value="TW"></asp:ListItem>
                            <asp:ListItem Text="Competition" Value="CO"></asp:ListItem>
                            <asp:ListItem Text="Entertainment" Value="EN"></asp:ListItem>
                            <asp:ListItem Text="Sports" Value="SP"></asp:ListItem>
                            <asp:ListItem Text="Others" Value="OT"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator17" runat="server" ErrorMessage="Please choose a value from the dropdown." ControlToValidate="drlCategory" InitialValue="-1"></asp:RequiredFieldValidator><br />
                        
                    </div>

                    <div class="form-group">

                        <label>Start Date <span style="color: red; font-weight: 900">*</span></label>
                        <%--<label>Date must be after <asp:HiddenField runat="server" ID="txtToday"></asp:HiddenField></label>--%>
                        <asp:TextBox ID="txtStartDate" runat="server" class="form-control" TextMode="Date"></asp:TextBox>
                        <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator7" runat="server" ErrorMessage="This field is required." ControlToValidate="txtStartDate"></asp:RequiredFieldValidator><br />
                    <asp:CompareValidator ID="CompareEndTodayValidator" ForeColor="Red" Operator="GreaterThan" type="Date" ControltoValidate="txtStartDate" ErrorMessage="Start date must be in the future." runat="server" />
                    </div>
                    
                    <div class="form-group">

                        <label>End Date <span style="color: red; font-weight: 900">*</span></label>

                        <asp:TextBox ID="txtEndDate" runat="server" class="form-control" TextMode="Date"></asp:TextBox>


                        <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator8" runat="server" ErrorMessage="This field is required." ControlToValidate="txtEndDate"></asp:RequiredFieldValidator><br />
                        <asp:CompareValidator ID="cvtxtStartDate" runat="server"
                            ControlToCompare="txtStartDate" CultureInvariantValues="true"
                            Display="Dynamic" EnableClientScript="true"
                            ControlToValidate="txtEndDate" ForeColor="Red"
                            ErrorMessage="The end date must be after the start date."
                            Type="Date" SetFocusOnError="true" Operator="GreaterThanEqual"
                            Text="The end date must be after the start date."></asp:CompareValidator>
                        <br />
                    </div>



                    <div class="form-group">
                        <label>Start Time <span style="color: red; font-weight: 900">*</span></label>
                        <asp:TextBox ID="txtStartTime" runat="server" class="form-control" TextMode="Time"></asp:TextBox>
                        <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator9" runat="server" ErrorMessage="This field is required." ControlToValidate="txtStartTime"></asp:RequiredFieldValidator><br />
                    </div>
                    <div class="form-group">
                        <label>End Time <span style="color: red; font-weight: 900">*</span></label>
                        <asp:TextBox ID="txtEndTime" runat="server" class="form-control" TextMode="Time"></asp:TextBox>
                        <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator10" runat="server" ErrorMessage="This field is required." ControlToValidate="txtEndTime"></asp:RequiredFieldValidator><br />
                    </div>
                    <div class="form-group">
                        <label>Max Number of Participants <span style="color: red; font-weight: 900">*</span></label>
                        <asp:TextBox ID="txtNoOfP" runat="server" TextMode="Number" class="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator13" runat="server" ErrorMessage="This field is required." ControlToValidate="txtNoOfP"></asp:RequiredFieldValidator><br />
                        <asp:RangeValidator ID="RangeValidator1" ForeColor="Red" MinimumValue="1" MaximumValue="5000" ControltoValidate="txtNoOfP" ErrorMessage="The value must be between 1 to 5000." runat="server" />
                    </div>
                    
                    <div class="form-group">
                        <label>Venue <span style="color: red; font-weight: 900">*</span></label><br />
                        <label style="font-size: small">If the venue is in APU, enter the preferred room/area.</label>
                        
                        <asp:TextBox ID="txtVenue" runat="server" class="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator3" runat="server" ErrorMessage="This field is required." ControlToValidate="txtVenue"></asp:RequiredFieldValidator><br />
                    </div>

                    <div class="form-group">
                        <label>Event Poster Image <span style="color: red; font-weight: 900">*</span></label>
                        <label style="font-size: small">Kindly ensure your poster is optimized for 851 pixels wide and 315 pixels tall</label>
                        <asp:FileUpload ID="uploadPic" class="form-control" runat="server" text="Upload a photo" method="post" enctype="multipart/form-data" name="productpic1" accept=".png,.jpg,.jpeg,.gif" />
                        <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator5" runat="server" ErrorMessage="Please upload an image for the event poster." ControlToValidate="uploadPic"></asp:RequiredFieldValidator><br />
                    </div>
                    <br />
                    <br />
                    <div style="text-align: center">
                        <h4>Further Details</h4>

                    </div>
                    <hr style="height: 0.7px; color: lightgrey; background-color: lightgrey" />
                    <div class="form-group">
                        <label>Event Background <span style="color: red; font-weight: 900">*</span></label><br />
                        <label style="font-size: small">For admin review. Include aim, agenda, overview, and action plan.</label>
                        <asp:TextBox ID="txtFormalDesc" runat="server" class="form-control" TextMode="MultiLine" Height="200px"></asp:TextBox>
                        <label style="font-size: small; color: grey">Word limit: 1000 words</label>
                        <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator2" runat="server" ErrorMessage="This field is required." ControlToValidate="txtFormalDesc"></asp:RequiredFieldValidator><br />
                        <asp:RegularExpressionValidator  ForeColor="Red" ID="RegularExpressionValidator1"
                                               runat="server" ControlToValidate="txtFormalDesc"
                                                Text="Please enter maximum 1000 words." 
                                                ValidationExpression="(((^\s*)*\S+\s+)|(\S+)){1,1000}">
                                           </asp:RegularExpressionValidator>
                    </div>
                    <br />
                    <div class="form-group">
                        <label>Event Description <span style="color: red; font-weight: 900">*</span></label><br />
                        <label style="font-size: small">This is your message for target audience. Include everything that you would like them to know about the event.</label>
                        <asp:TextBox ID="txtDescr" runat="server" class="form-control" TextMode="MultiLine" MaxLength="500" Height="200px"></asp:TextBox>
                        <label style="font-size: small; color: grey">Word limit: 1000 words</label>
                        <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator11" runat="server" ErrorMessage="This field is required." ControlToValidate="txtDescr"></asp:RequiredFieldValidator><br />
                        <asp:RegularExpressionValidator  ForeColor="Red" ID="RegularExpressionValidator2"
                                               runat="server" ControlToValidate="txtDescr"
                                               Text="Please enter maximum 1000 words." 
                                                ValidationExpression="(((^\s*)*\S+\s+)|(\S+)){1,1000}">
                                           </asp:RegularExpressionValidator>
                    </div>
                    <br />
                    <div class="form-group">
                        <asp:CheckBox ID="chkFree" runat="server" Text="This is a free event" OnCheckedChanged="chkFree_CheckedChanged" AutoPostBack="true" />

                    </div>
                    <br />
                    <asp:Panel runat="server" CssClass="form-group" ID="panelPrice">
                        <label>Ticket Price <span style="color: red; font-weight: 900">*</span></label>
                        <asp:TextBox ID="txtPrice" step=".01" runat="server" TextMode="Number" class="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator4" runat="server" ErrorMessage="This field is required." ControlToValidate="txtPrice"></asp:RequiredFieldValidator><br />
                        <asp:RangeValidator ID="RangeValidator2" ForeColor="Red" MinimumValue="0.1" MaximumValue="8000" ControltoValidate="txtPrice" ErrorMessage="The value must be greater than 0" runat="server" />
                    </asp:Panel>

                    <div class="form-group">
                        <label>Participant Eligibility <span style="color: red; font-weight: 900">*</span></label><br />
                        <asp:DropDownList ID="drlEligibility" runat="server" class="form-control">
                            <asp:ListItem Enabled="true" Text="Select" Value="-1"></asp:ListItem>
                            <asp:ListItem Text="Open to all" Value="All"></asp:ListItem>
                            <asp:ListItem Text="Students Only" Value="Student"></asp:ListItem>
                            <asp:ListItem Text="Staff Only" Value="Staff"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator12" runat="server" ErrorMessage="Please choose a value from the dropdown." ControlToValidate="drlEligibility" InitialValue="-1"></asp:RequiredFieldValidator><br />
                    </div>
                    <br />

                    <div class="form-group">

                        <label>Registration Closing Date <span style="color: red; font-weight: 900">*</span></label>
                        <asp:TextBox ID="txtRegClose" runat="server" class="form-control" TextMode="Date"></asp:TextBox>
                        <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator14" runat="server" ErrorMessage="This field is required." ControlToValidate="txtRegClose"></asp:RequiredFieldValidator><br />
                        <asp:CompareValidator ID="CompareValidator2" runat="server"
                            ControlToCompare="txtStartDate" CultureInvariantValues="true"
                            Display="Dynamic" EnableClientScript="true"
                            ControlToValidate="txtRegClose" ForeColor="Red"
                            ErrorMessage="Registration closing date must be earlier than start date."
                            Type="Date" SetFocusOnError="true" Operator="LessThanEqual"
                            Text="Registration closing date must be earlier than start date."></asp:CompareValidator><br />
                        <%--<asp:CompareValidator ID="CompareValidator1" ForeColor="Red" Operator="GreaterThan" type="Date" ControltoValidate="txtRegClose" ErrorMessage="Registration closing date must be in the future." runat="server" />--%>
                    </div>

                    <div class="form-group">
                        <asp:CheckBox ID="chkShirt" runat="server" Text="Ask for participants' shirt size." />

                    </div>
                    <br />
                    <div class="form-group">
                        <asp:CheckBox ID="chkFood" runat="server" Text="Ask for participants' food preference." />

                    </div>
                    <br />
                    <br />
                    <label>Contact Person <span style="color: red; font-weight: 900">*</span></label><br />
                    <label style="font-size: small">To receive enquiries from the audience.</label>
                    <div class="form-inline">
                        <div class="form-group">
                            <asp:TextBox ID="txtContactName" runat="server" class="form-control" placeholder="Name" ></asp:TextBox>
                         <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator18" runat="server" ErrorMessage="This field is required." ControlToValidate="txtContactName"></asp:RequiredFieldValidator><br />   
                        </div>
                        

                        <div class="form-group">
                            <asp:TextBox ID="txtContactNo" runat="server" TextMode="Number" class="form-control" placeholder="Phone No." ></asp:TextBox>
                           <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator16" runat="server" ErrorMessage="This field is required." ControlToValidate="txtContactNo"></asp:RequiredFieldValidator><br />
                        </div>
                        <br />
                         
                            
                    </div>
                    <br />
                    <br />
                    <div class="form-group">
                        <label>Link to Organiser Facebook Page (Optional)</label><br />
                        
                        
                        <asp:TextBox ID="txtLink" runat="server" class="form-control"></asp:TextBox>
                        
                    </div>
                    <br />
                    
                     <div class="form-group">
                        <label>Resources Needed from APU (Optional)<span style="color:red; font-weight:900"></span></label><br />

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
                        <asp:RegularExpressionValidator  ForeColor="Red" ID="RegularExpressionValidator3"
                                               runat="server" ControlToValidate="txtRemarks"
                                             Text="Please enter maximum 500 words." 
                                                ValidationExpression="(((^\s*)*\S+\s+)|(\S+)){1,500}" />
                    </div>
                    <br />
                    <div class="form-group" style="margin-top: 20px; margin-bottom: 50px">
                        <asp:Button ID="btnAdd" runat="server" Text="Submit Event" class="btn btn-primary btn-lg" OnClick="btnAdd_Click"  /><br /><br />
                        <asp:Label ID="lblError" runat="server" Text="Please double check your fields before submitting." ForeColor="gray" ></asp:Label>
                    </div>
                </div>
                <div class="col-sm-3" style="margin-bottom: 50px"></div>
            </div>
        </div>
        <!--/.row-->
    </div>
</asp:Content>

