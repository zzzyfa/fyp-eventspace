<%@ Page Language="C#" MasterPageFile="User.master" AutoEventWireup="true" CodeFile="EO_Create.aspx.cs" Inherits="FYP.EO_Create" %>




<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Create New Event | EventSpace</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" style="margin-top: 150px">
        <div style="text-align: center">
            <h2>Create New Event</h2>

        </div>
        <div class="row contact-wrap">

            <div class="status alert alert-success" style="display: none"></div>
            <div id="main-contact-form" class="contact-form">
               
                <div class="col-sm-3"></div>
             
                <div class="col-sm-6">
                    <div style="text-align: center; margin-top:30px">
            <h4>Basic Details</h4>

        </div>
                    <hr style="margin-bottom:30px; height:1px;border:none;color:#333;background-color:#333;"/>
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

                    <div class="form-group">
                        
                            <label>Start Date:</label>
                            <asp:TextBox ID="txtStartDate" runat="server" class="form-control" TextMode="Date"></asp:TextBox>
                        </div>
                        <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator7" runat="server" ErrorMessage="This field is required." ControlToValidate="txtStartDate"></asp:RequiredFieldValidator><br />
                    

                    <div class="form-group">
                        
                            <label>End Date:</label>
                            
                            <asp:TextBox ID="txtEndDate" runat="server" class="form-control" TextMode="Date"></asp:TextBox>
                            
                        
                        <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator8" runat="server" ErrorMessage="This field is required." ControlToValidate="txtEndDate"></asp:RequiredFieldValidator><br />
                    </div>

                    

                    <div class="form-group">
                        <label>Start Time:</label>
                        <asp:TextBox ID="txtStartTime" runat="server" class="form-control" TextMode="Time"></asp:TextBox>
                        <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator9" runat="server" ErrorMessage="This field is required." ControlToValidate="txtStartTime"></asp:RequiredFieldValidator><br />
                    </div>
                    <div class="form-group">
                        <label>End Time:</label>
                        <asp:TextBox ID="txtEndTime" runat="server" class="form-control" TextMode="Time"></asp:TextBox>
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
                    <div style="text-align: center">
            <h4>Further Details</h4>

        </div>
                    <hr style="margin-bottom:30px; height:1px;border:none;color:#333;background-color:#333;"/>
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
                        <asp:CheckBox ID="chkFree" runat="server" Text="This is a free event" OnCheckedChanged="chkFree_CheckedChanged" AutoPostBack="true"  />
                        
                    </div>
                    <br />
                    <asp:Panel runat="server" CssClass="form-group" ID="panelPrice">
                        <label>Ticket Price:</label>
                        <asp:TextBox ID="txtPrice" step=".01" runat="server" TextMode="Number" class="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator4" runat="server" ErrorMessage="This field is required." ControlToValidate="txtPrice"></asp:RequiredFieldValidator><br />
                    </asp:Panel>

                    <div class="form-group">
                        <label>Participant Eligibility:</label><br />
                        <asp:DropDownList ID="drlEligibility" runat="server">
                            <asp:ListItem Enabled="true" Text="Select" Value="-1"></asp:ListItem>
                            <asp:ListItem Text="Open to all" Value="ALL"></asp:ListItem>
                            <asp:ListItem Text="Students Only" Value="student"></asp:ListItem>
                            <asp:ListItem Text="Staff Only" Value="staff"></asp:ListItem>
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
                    <div class="form-group">
                        
                            <label>Registration Closing Date:</label>
                            <asp:TextBox ID="txtRegClose" runat="server" class="form-control" TextMode="Date"></asp:TextBox>
                        </div>
                       
                        <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator14" runat="server" ErrorMessage="This field is required." ControlToValidate="txtRegClose"></asp:RequiredFieldValidator><br />
                    
                    <div class="form-group">
                        <label>Resources Needed from APU:</label><br />
                        <label style="font-size: small">If none, please type "N/A".</label>
                        <label style="font-size: small">PA System, Transportation, Tables, etc.</label>
                        <asp:TextBox ID="txtResources" runat="server" class="form-control" TextMode="MultiLine" MaxLength="500"></asp:TextBox>
                        <label style="font-size: small; color: grey">Word limit: 500 words</label>
                        <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator15" runat="server" ErrorMessage="This field is required." ControlToValidate="txtResources"></asp:RequiredFieldValidator><br />
                    </div>
                    <br />
                    <div class="form-group">
                        <label>Additional Remarks (Optional)</label><br />
                        <asp:TextBox ID="txtRemarks" runat="server" class="form-control" TextMode="MultiLine" MaxLength="500"></asp:TextBox>
                        <label style="font-size: small; color: grey">Word limit: 500 words</label>
                        
                    </div>
                    <br />
                    <div class="form-group" style="margin-top: 20px">
                        <asp:Button ID="btnAdd" runat="server" Text="Add Product" class="btn btn-primary btn-lg" OnClick="btnAdd_Click" />
                    </div>
    </div>
    <div class="col-sm-3" style="margin-bottom: 50px"></div>
            </div>
        </div>
        <!--/.row-->
    </div>
</asp:Content>

