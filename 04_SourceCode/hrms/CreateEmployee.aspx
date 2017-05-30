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
                    <asp:TextBox ID="DOB" runat="server" MaxLength="10"></asp:TextBox><asp:ImageButton ID="ImageButtonDOB" runat="server" Height="22px" ImageAlign="Middle" ImageUrl="~/Images/Calendar-icon.png" OnClick="ImageButtonDOB_Click" CausesValidation="False" />*
                </div>
                <div style="float: left; width: 15%; text-align: right">Position:&nbsp;&nbsp;</div>
                <div style="float: left; width: 35%">
                    <asp:DropDownList ID="Position" runat="server" DataSourceID="SqlDataSourcePosition" DataTextField="PositionName" DataValueField="PositionName"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourcePosition" runat="server" ConnectionString="<%$ ConnectionStrings:HRMSDBConnectionString %>" SelectCommand="SELECT * FROM [POSITION]"></asp:SqlDataSource>
                    *
                </div>
            </div>
            <br />
            <div style="float: left; width: 100%">
                <div style="float: left; width: 25%">
                    &nbsp;&nbsp;&nbsp;&nbsp;
                </div>
                 <div style="float: left; width: 25%">

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Display="Dynamic" ErrorMessage="Please input DOB!" ForeColor="Red" ControlToValidate="DOB"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Invalide date!YYYYMMDD" ControlToValidate="DOB" Display="Dynamic" ForeColor="Red" ValidationExpression="^\d{4}\d{1,2}\d{1,2}$"></asp:RegularExpressionValidator>
                </div>
                <div style="float: left; width: 50%;text-align:left">
                    <asp:Calendar ID="CalendarDOB" runat="server" Visible="false" OnSelectionChanged="CalendarDOB_SelectionChanged"></asp:Calendar>
                </div>
            </div>
            <br />
            <div style="float: left; width: 100%">
                <div style="float: left; width: 25%; text-align: right">
                    Hire Date:&nbsp;&nbsp;
                </div>
                <div style="float: left; width: 25%">
                    <asp:TextBox ID="HireDate" runat="server" MaxLength="10"></asp:TextBox><asp:ImageButton ID="ImageButtonHireDate" runat="server" Height="22px" ImageAlign="Middle" ImageUrl="~/Images/Calendar-icon.png" CausesValidation="False" OnClick="ImageButtonHireDate_Click" />*
                </div>
                <div style="float: left; width: 15%; text-align: right">Resign Date:&nbsp;&nbsp;</div>
                <div style="float: left; width: 35%">
                    <asp:TextBox ID="ResignDate" runat="server" MaxLength="10"></asp:TextBox><asp:ImageButton ID="ImageButtonResignDate" runat="server" Height="22px" ImageAlign="Middle" ImageUrl="~/Images/Calendar-icon.png" CausesValidation="False" OnClick="ImageButtonResignDate_Click" />
                </div>
            </div>
            <br />
            <div style="float: left; width: 100%">
                <div style="float: left; width: 25%">
                    &nbsp;&nbsp;&nbsp;&nbsp;
                </div>
                <div style="float: left; width: 25%">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Display="Dynamic" ErrorMessage="Please input hire date!" ForeColor="Red" ControlToValidate="HireDate"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalide date!YYYYMMDD" ControlToValidate="HireDate" Display="Dynamic" ForeColor="Red" ValidationExpression="^\d{4}\d{1,2}\d{1,2}$"></asp:RegularExpressionValidator>
                </div>
                <div style="float: left; width: 30%">
                    <asp:Calendar ID="CalendarHireDate" runat="server" Visible="false" OnSelectionChanged="CalendarHireDate_SelectionChanged"></asp:Calendar>
                </div>
                <div style="float: left; width: 5%">
                    &nbsp;&nbsp;&nbsp;&nbsp;
                </div>
                <div style="float: right; width: 40%">
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Invalide date!YYYYMMDD" ControlToValidate="ResignDate" Display="Dynamic" ForeColor="Red" ValidationExpression="^\d{4}\d{1,2}\d{1,2}$"></asp:RegularExpressionValidator>
                    <asp:Calendar ID="CalendarResignDate" runat="server" Visible="false" OnSelectionChanged="CalendarResignDate_SelectionChanged"></asp:Calendar>
                </div>
            </div>
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
            <div style="width: 100%">
                <div style="float: left; width: 25%; text-align: right">
                    &nbsp;&nbsp;
                </div>
                <div style="float: left; width: 25%">

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="YearsInBCD" Display="Dynamic" ErrorMessage="Please input years in BCD!" ForeColor="Red"></asp:RequiredFieldValidator>

                </div>
                <div style="float: left; width: 15%; text-align: right">&nbsp;&nbsp;</div>
                <div style="float: right; width: 35%">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="YearsInIndustry" Display="Dynamic" ErrorMessage="Please input years in industry!" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            </div>
            <br />
            <div style="float:left;width: 100%">
                <div style="float: left; width: 25%; text-align: right">
                    Driver License Number:&nbsp;&nbsp;
                </div>
                <div style="float: left; width: 25%">
                    <asp:TextBox ID="DriverLicenseNumber" runat="server" MaxLength="30"></asp:TextBox>
                </div>
                <div style="float: left; width: 15%; text-align: right">Site Safe Number:&nbsp;&nbsp;</div>
                <div style="float: left; width: 35%">
                    
                    <asp:TextBox ID="SiteSafeNumber" runat="server" MaxLength="50"></asp:TextBox>
                </div>
            </div>
            <br />
            <br />
            <br />
            <div style="float:left;width: 100%">
                <div style="float: left; width: 25%; text-align: right">
                    Driver License ExpiryDate:&nbsp;&nbsp;
                </div>
                <div style="float: left; width: 25%">
                    <asp:TextBox ID="DriverLicenseExpiryDate" runat="server" MaxLength="10"></asp:TextBox><asp:ImageButton ID="ImageButtonDriverLicense" runat="server" Height="22px" ImageAlign="Middle" ImageUrl="~/Images/Calendar-icon.png" CausesValidation="False" OnClick="ImageButtonDriverLicense_Click" />
                </div>
                <div style="float: left; width: 15%; text-align: right">Site Safe ExpiryDate:&nbsp;&nbsp;</div>
                <div style="float: left; width: 35%">
                       <asp:TextBox ID="SiteSafeExpiryDate" runat="server" MaxLength="10"></asp:TextBox><asp:ImageButton ID="ImageButtonSiteSafe" runat="server" Height="22px" ImageAlign="Middle" ImageUrl="~/Images/Calendar-icon.png" CausesValidation="False" OnClick="ImageButtonSiteSafe_Click" />
                </div>
            </div>
            <br />
            <div style="float: left; width: 100%">
                <div style="float: left; width: 25%">
                    &nbsp;&nbsp;&nbsp;&nbsp;
                </div>
                <div style="float: left; width: 25%">
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="Invalide date!YYYYMMDD" ControlToValidate="DriverLicenseExpiryDate" Display="Dynamic" ForeColor="Red" ValidationExpression="^\d{4}\d{1,2}\d{1,2}$"></asp:RegularExpressionValidator>
                    <asp:Calendar ID="CalendarDriverLicense" runat="server" Visible="false" OnSelectionChanged="CalendarDriverLicense_SelectionChanged"></asp:Calendar>
                </div>
                <div style="float: left; width: 10%">
                    &nbsp;&nbsp;&nbsp;&nbsp;
                </div>
                <div style="float: right; width: 40%">
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ErrorMessage="Invalide date!YYYYMMDD" ControlToValidate="SiteSafeExpiryDate" Display="Dynamic" ForeColor="Red" ValidationExpression="^\d{4}\d{1,2}\d{1,2}$"></asp:RegularExpressionValidator>
                    <asp:Calendar ID="CalendarSiteSafe" runat="server" Visible="false" OnSelectionChanged="CalendarSiteSafe_SelectionChanged"></asp:Calendar>
                </div>
            </div>
            <br />
            <div style="float:left;width: 100%">
                <div style="float: left; width: 25%; text-align: right">
                    Driver License Class:&nbsp;&nbsp;
                </div>
                <div style="float: left; width: 25%">
                    <asp:DropDownList ID="DriverLicenseClass" runat="server">
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem>Class1</asp:ListItem>
                        <asp:ListItem>Class2</asp:ListItem>
                        <asp:ListItem>Class3</asp:ListItem>
                        <asp:ListItem>Class4</asp:ListItem>
                        <asp:ListItem>Class5</asp:ListItem>
                        <asp:ListItem>Class6</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div style="float: left; width: 15%; text-align: right">Other Positions:&nbsp;&nbsp;</div>
                <div style="float: left; width: 35%">
                    <asp:TextBox ID="OtherPositions" runat="server" MaxLength="128"></asp:TextBox>
                </div>
            </div>
            <br />
            <br />
            <div style="float:left;width: 100%">
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
            <div style="width: 100%">
                <div style="float: left; width: 25%; text-align: right">
                    &nbsp;&nbsp;
                </div>
                <div style="float: left; width: 25%">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="MobileNumber" Display="Dynamic" ErrorMessage="Please input mobile number!" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <div style="float: left; width: 15%; text-align: right">&nbsp;&nbsp;</div>
                <div style="float: right; width: 35%">
                    &nbsp;&nbsp;                   
                </div>
            </div>
            <br />
            <div style="float:left;width: 100%">
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
            <div style="width: 100%">
                <div style="float: left; width: 25%; text-align: right">
                    &nbsp;&nbsp;
                </div>
                <div style="float: left; width: 25%">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="Email" Display="Dynamic" ErrorMessage="Please input email address!" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Invalide email address!" ControlToValidate="Email" Display="Dynamic" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </div>
                <div style="float: left; width: 15%; text-align: right">&nbsp;&nbsp;</div>
                <div style="float: right; width: 35%">
                    &nbsp;&nbsp;                   
                </div>
            </div>
            <br />
            <div style="float:left;width: 100%">
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
            <div style="float:left;width: 100%">
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
            <div style="float:left;width: 100%">
                <div style="float: left; width: 25%; text-align: right">
                    &nbsp;&nbsp;
                </div>
                <div style="float: left; width: 25%">

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="BankName" Display="Dynamic" ErrorMessage="Please input bank name!" ForeColor="Red"></asp:RequiredFieldValidator>

                </div>
                <div style="float: left; width: 15%; text-align: right">&nbsp;&nbsp;</div>
                <div style="float: right; width: 35%">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="AccountNumber" Display="Dynamic" ErrorMessage="Please input account number!" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ErrorMessage="Format: xx-xxxx-xxxxxxx-xxx" ControlToValidate="AccountNumber" Display="Dynamic" ForeColor="Red" ValidationExpression="^\d{2}-\d{4}-\d{7}-\d{3}$"></asp:RegularExpressionValidator>
                </div>
            </div>
            <br />
            <div style="float:left;width: 100%">
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
            <div style="float:left;width: 100%">
                <div style="float: left; width: 25%; text-align: right">
                    &nbsp;&nbsp;
                </div>
                <div style="float: left; width: 25%">

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="PayRate" Display="Dynamic" ErrorMessage="Please input pay rate!" ForeColor="Red"></asp:RequiredFieldValidator>

                </div>
                <div style="float: left; width: 15%; text-align: right">&nbsp;&nbsp;</div>
                <div style="float: right; width: 35%">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="TaxRate" Display="Dynamic" ErrorMessage="Please input tax rate!" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            </div>
            <br />
            <div style="float:left;width: 100%">
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
            <div style="float:left;width: 100%">
                <div style="float: left; width: 25%; text-align: right">
                    &nbsp;&nbsp;
                </div>
                <div style="float: left; width: 25%">

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="IRDNumber" Display="Dynamic" ErrorMessage="Please input IRD number!" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" ErrorMessage="Format: xxx-xxx-xxx" ControlToValidate="IRDNumber" Display="Dynamic" ForeColor="Red" ValidationExpression="^\d{3}-\d{3}-\d{3}$"></asp:RegularExpressionValidator>
                </div>
                <div style="float: left; width: 15%; text-align: right">&nbsp;&nbsp;</div>
                <div style="float: right; width: 35%">
                    &nbsp;&nbsp;
                </div>
            </div>
            <br />
        </div>
        <hr />
        <br />
        <p class="auto-style6">
            <strong>Address Information</strong>
        </p>
        <div class="auto-style7">
            <div style="float:left;width: 100%">
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
            <div style="float:left;width: 100%">
                <div style="float: left; width: 25%; text-align: right">
                    &nbsp;&nbsp;
                </div>
                <div style="float: left; width: 25%">

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="Country" Display="Dynamic" ErrorMessage="Please input country name!" ForeColor="Red"></asp:RequiredFieldValidator>

                </div>
                <div style="float: left; width: 15%; text-align: right">&nbsp;&nbsp;</div>
                <div style="float: right; width: 35%">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="City" Display="Dynamic" ErrorMessage="Please input city name!" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            </div>
            <br />
            <div style="float:left;width: 100%">
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
            <div style="float:left;width: 100%">
                <div style="float: left; width: 25%; text-align: right">
                    &nbsp;&nbsp;
                </div>
                <div style="float: left; width: 25%">

                    &nbsp;&nbsp;

                </div>
                <div style="float: left; width: 15%; text-align: right">&nbsp;&nbsp;</div>
                <div style="float: right; width: 35%">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="Street" Display="Dynamic" ErrorMessage="Please input street name!" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            </div>
            <br />
            <div style="float:left;width: 100%">
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
    <asp:Button ID="Reset" runat="server" Text="Reset" Width="68px" OnClick="Reset_Click" CausesValidation="False" />
        </div>
    </div>
</asp:Content>

