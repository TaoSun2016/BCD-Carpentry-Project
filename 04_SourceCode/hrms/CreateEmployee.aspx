<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CreateEmployee.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style6 {
            text-align: center;
        }
        .auto-style7 {
            text-align: left;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="height: 100%; overflow-y: scroll" class="auto-style7">
        <h2 class="auto-style6"><strong>Add New Employee Information</strong></h2>
        <p class="auto-style6">
            <strong>Basic Information</strong>
        </p>
        <div>
            <div style="width: 100%">
                <div style="float: left; width: 25%; text-align: right">
                    Forename:&nbsp;&nbsp;
                </div>
                <div style="float: left; width: 25%">
                    <asp:TextBox ID="Forename" runat="server" MaxLength="50"></asp:TextBox>*
                </div>
                <div style="float: left; width: 15%; text-align: right">Surname:&nbsp;&nbsp;</div>
                <div style="float: left; width: 35%">
                    <asp:TextBox ID="Surname" runat="server" MaxLength="50"></asp:TextBox>*
                </div>
            </div>
            <br />
            <div style="width: 100%">
                <div style="float: left; width: 25%; text-align: right">
                    &nbsp;&nbsp;
                </div>
                <div style="float: left; width: 25%">

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Forename" Display="Dynamic" ErrorMessage="Please input Forename!" ForeColor="Red"></asp:RequiredFieldValidator>

                </div>
                <div style="float: left; width: 15%; text-align: right">&nbsp;&nbsp;</div>
                <div style="float: right; width: 35%">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Surname" Display="Dynamic" ErrorMessage="Please input Surname!" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            </div>
            <br />

            <div style="float: left; width: 100%">
                <div style="float: left; width: 25%; text-align: right">
                    DOB:&nbsp;&nbsp;
                </div>
                <div style="float: left; width: 25%">
                    <asp:TextBox ID="DOB" runat="server" MaxLength="8"></asp:TextBox><asp:Button ID="CalendarButtonDOB" runat="server" Height="22px" Width="16px" OnClick="CalendarButtonDOB_Click" />*
                </div>
                <div style="float: left; width: 15%; text-align: right">Position:&nbsp;&nbsp;</div>
                <div style="float: left; width: 35%">
                    <asp:DropDownList ID="Position" runat="server" DataSourceID="SqlDataSourcePosition" DataTextField="PositionName" DataValueField="PositionName"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourcePosition" runat="server" ConnectionString="<%$ ConnectionStrings:HRMSDBConnectionString %>" SelectCommand="SELECT * FROM [POSITION]"></asp:SqlDataSource>
                    *
                </div>
            </div>
            <div style="float: left; width: 100%">
                <div style="float: left; width: 25%">
                    &nbsp;&nbsp;&nbsp;&nbsp;
                </div>
                <div style="float: left; width: 75%">
                    <asp:Calendar ID="CalendarDOB" runat="server" Visible="false" OnSelectionChanged="CalendarDOB_SelectionChanged"></asp:Calendar>
                </div>
            </div>
            <br />
            <br />
            <div style="float: left; width: 100%">
                <div style="float: left; width: 25%; text-align: right">
                    Hire Date:&nbsp;&nbsp;
                </div>
                <div style="float: left; width: 25%">
                    <asp:TextBox ID="HireDate" runat="server" MaxLength="8"></asp:TextBox><asp:Button ID="CalendarButtonHireDate" runat="server" Height="22px" Width="16px" OnClick="CalendarButtonHireDate_Click" />*
                </div>
                <div style="float: left; width: 15%; text-align: right">Resign Date:&nbsp;&nbsp;</div>
                <div style="float: left; width: 35%">
                    <asp:TextBox ID="ResignDate" runat="server" MaxLength="8"></asp:TextBox><asp:Button ID="CalendarButtonResignDate" runat="server" Height="22px" Width="16px" OnClick="CalendarButtonResignDate_Click" />
                </div>
            </div>
            <br />
            <br />
            <div style="float: left; width: 100%">
                <div style="float: left; width: 25%">
                    &nbsp;&nbsp;&nbsp;&nbsp;
                </div>
                <div style="float: left; width: 30%">
                    <asp:Calendar ID="CalendarHireDate" runat="server" Visible="false" OnSelectionChanged="CalendarHireDate_SelectionChanged"></asp:Calendar>
                </div>
                <div style="float: left; width: 5%">
                    &nbsp;&nbsp;&nbsp;&nbsp;
                </div>
                <div style="float: right; width: 40%">
                    <asp:Calendar ID="CalendarResignDate" runat="server" Visible="false" OnSelectionChanged="CalendarResignDate_SelectionChanged"></asp:Calendar>
                </div>
            </div>
            <br />
            <br />
            <div style="width: 100%">
                <div style="float: left; width: 25%; text-align: right">
                    Years In BCD:&nbsp;&nbsp;
                </div>
                <div style="float: left; width: 25%">
                    <asp:TextBox ID="YearsInBCD" runat="server" TextMode="Number"></asp:TextBox>*
                </div>
                <div style="float: left; width: 15%; text-align: right">Years In Industry:&nbsp;&nbsp;</div>
                <div style="float: left; width: 35%">
                    <asp:TextBox ID="YearsInIndustry" runat="server" TextMode="Number"></asp:TextBox>*
                </div>
            </div>
            <br />
            <br />
            <div style="width: 100%">
                <div style="float: left; width: 25%; text-align: right">
                    Driver License Number:&nbsp;&nbsp;
                </div>
                <div style="float: left; width: 25%">
                    <asp:TextBox ID="DriverLicenseNumber" runat="server" MaxLength="30"></asp:TextBox>
                </div>
                <div style="float: left; width: 15%; text-align: right">Driver License Class:&nbsp;&nbsp;</div>
                <div style="float: left; width: 35%">
                    <asp:TextBox ID="DriverLicenseClass" runat="server" MaxLength="10"></asp:TextBox>
                </div>
            </div>
            <br />
            <br />
            <div style="width: 100%">
                <div style="float: left; width: 25%; text-align: right">
                    Driver License ExpiryDate:&nbsp;&nbsp;
                </div>
                <div style="float: left; width: 25%">
                    <asp:TextBox ID="DriverLicenseExpiryDate" runat="server" MaxLength="8"></asp:TextBox>
                </div>
                <div style="float: left; width: 15%; text-align: right">Site Safe Number:&nbsp;&nbsp;</div>
                <div style="float: left; width: 35%">
                    <asp:TextBox ID="SiteSafeNumber" runat="server" MaxLength="50"></asp:TextBox>
                </div>
            </div>
            <br />
            <br />
            <div style="width: 100%">
                <div style="float: left; width: 25%; text-align: right">
                    Site Safe ExpiryDate:&nbsp;&nbsp;
                </div>
                <div style="float: left; width: 25%">
                    <asp:TextBox ID="SiteSafeExpiryDate" runat="server" MaxLength="8"></asp:TextBox>
                </div>
                <div style="float: left; width: 15%; text-align: right">Other Positions:&nbsp;&nbsp;</div>
                <div style="float: left; width: 35%">
                    <asp:TextBox ID="OtherPositions" runat="server" MaxLength="128"></asp:TextBox>
                </div>
            </div>
            <br />
            <br />
            <div style="width: 100%">
                <div style="float: left; width: 25%; text-align: right">
                    Driver License Photo:&nbsp;&nbsp;
                </div>
                <div style="float: left; width: 25%">
                    <asp:FileUpload ID="DriverLicensePhoto" runat="server" />
                </div>
                <div style="float: left; width: 15%; text-align: right">Site Safe Photo:&nbsp;&nbsp;</div>
                <div style="float: left; width: 35%">
                    <asp:FileUpload ID="SiteSafePhoto" runat="server" />
                </div>
            </div>
            <br />
            <br />
        </div>
        <hr />
        <br />
        <p class="auto-style6">
            <strong>Contact Information</strong>
        </p>
        <div class="auto-style7">
            <div style="width: 100%">
                <div style="float: left; width: 25%; text-align: right">
                    Mobile Number:&nbsp;&nbsp;
                </div>
                <div style="float: left; width: 25%">
                    <asp:TextBox ID="MobileNumber" runat="server" MaxLength="20"></asp:TextBox>*
                </div>
                <div style="float: left; width: 15%; text-align: right">Home Number:&nbsp;&nbsp;</div>
                <div style="float: left; width: 35%">
                    <asp:TextBox ID="HomeNumber" runat="server" MaxLength="20"></asp:TextBox>
                </div>
            </div>
            <br />
            <br />
            <div style="width: 100%">
                <div style="float: left; width: 25%; text-align: right">
                    Email:&nbsp;&nbsp;
                </div>
                <div style="float: left; width: 25%">
                    <asp:TextBox ID="Email" runat="server"></asp:TextBox>*
                </div>
                <div style="float: left; width: 15%; text-align: right">&nbsp;&nbsp;</div>
                <div style="float: left; width: 35%">&nbsp;&nbsp;</div>
            </div>
            <br />
            <br />
            <div style="width: 100%">
                <div style="float: left; width: 25%; text-align: right">
                    Kin Name:&nbsp;&nbsp;
                </div>
                <div style="float: left; width: 25%">
                    <asp:TextBox ID="KinName" runat="server" MaxLength="100"></asp:TextBox>
                </div>
                <div style="float: left; width: 15%; text-align: right">Kin Number:&nbsp;&nbsp;</div>
                <div style="float: left; width: 35%">
                    <asp:TextBox ID="KinNumber" runat="server" MaxLength="20"></asp:TextBox>
                </div>
            </div>
            <br />
            <br />
        </div>
        <hr />
        <br />
        <p class="auto-style6">
            <strong>Account Information</strong>
        </p>
        <div class="auto-style7">
            <div style="width: 100%">
                <div style="float: left; width: 25%; text-align: right">
                    Bank Name:&nbsp;&nbsp;
                </div>
                <div style="float: left; width: 25%">
                    <asp:TextBox ID="BankName" runat="server" MaxLength="30"></asp:TextBox>*
                </div>
                <div style="float: left; width: 15%; text-align: right">Account Number:&nbsp;&nbsp;</div>
                <div style="float: left; width: 35%">
                    <asp:TextBox ID="AccountNumber" runat="server" MaxLength="30"></asp:TextBox>*
                </div>
            </div>
            <br />
            <br />
            <div style="width: 100%">
                <div style="float: left; width: 25%; text-align: right">
                    Pay Rate:&nbsp;&nbsp;
                </div>
                <div style="float: left; width: 25%">
                    <asp:TextBox ID="PayRate" runat="server" TextMode="Number"></asp:TextBox>*
                </div>
                <div style="float: left; width: 15%; text-align: right">Tax Rate:&nbsp;&nbsp;</div>
                <div style="float: left; width: 35%">
                    <asp:TextBox ID="TaxRate" runat="server" TextMode="Number"></asp:TextBox>*
                </div>
            </div>
            <br />
            <br />
            <div style="width: 100%">
                <div style="float: left; width: 25%; text-align: right">
                    IRD Number:&nbsp;&nbsp;
                </div>
                <div style="float: left; width: 25%">
                    <asp:TextBox ID="IRDNumber" runat="server" MaxLength="20"></asp:TextBox>*
                </div>
                <div style="float: left; width: 15%; text-align: right">&nbsp;&nbsp;</div>
                <div style="float: left; width: 35%">&nbsp;&nbsp;</div>
            </div>
            <br />
            <br />
        </div>
        <hr />
        <br />
        <p class="auto-style6">
            <strong>Address Information</strong>
        </p>
        <div class="auto-style7">
            <div style="width: 100%">
                <div style="float: left; width: 25%; text-align: right">
                    Country:&nbsp;&nbsp;
                </div>
                <div style="float: left; width: 25%">
                    <asp:TextBox ID="Country" runat="server" MaxLength="30"></asp:TextBox>*
                </div>
                <div style="float: left; width: 15%; text-align: right">City:&nbsp;&nbsp;</div>
                <div style="float: left; width: 35%">
                    <asp:TextBox ID="City" runat="server" MaxLength="30"></asp:TextBox>*
                </div>
            </div>
            <br />
            <br />
            <div style="width: 100%">
                <div style="float: left; width: 25%; text-align: right">
                    Suburb:&nbsp;&nbsp;
                </div>
                <div style="float: left; width: 25%">
                    <asp:TextBox ID="Suburb" runat="server" MaxLength="30"></asp:TextBox>
                </div>
                <div style="float: left; width: 15%; text-align: right">Street:&nbsp;&nbsp;</div>
                <div style="float: left; width: 35%">
                    <asp:TextBox ID="Street" runat="server" MaxLength="100"></asp:TextBox>*
                </div>
            </div>
            <br />
            <br />
            <div style="width: 100%">
                <div style="float: left; width: 25%; text-align: right">
                    Post Code:&nbsp;&nbsp;
                </div>
                <div style="float: left; width: 25%">
                    <asp:TextBox ID="PostCode" runat="server" MaxLength="10"></asp:TextBox>
                </div>
                <div style="float: left; width: 15%; text-align: right">&nbsp;&nbsp;</div>
                <div style="float: left; width: 35%">&nbsp;&nbsp;</div>
            </div>
            <br />
            <br />
            <hr />
            <br />
        </div>
        <p class="auto-style6">
            <strong>Note</strong>
        </p>
        <div class="auto-style7">
            <div style="width: 100%">
                <div style="float: left; width: 25%; text-align: right">
                    Note:&nbsp;&nbsp;
                </div>
                <div style="float: left; width: 75%">
                    <asp:TextBox ID="Note" runat="server" MaxLength="255" Width="525px"></asp:TextBox>
                </div>
            </div>
            <br />
            <br />
        </div>
        <br />
        <br />
        <div style="width: 100%; text-align: center">
            <asp:Button ID="Add" runat="server" Text="Add" OnClick="Add_Click" Width="69px" />
            &nbsp;&nbsp;       
    <asp:Button ID="Reset" runat="server" Text="Reset" Width="68px" OnClick="Reset_Click" />
        </div>
    </div>
</asp:Content>

