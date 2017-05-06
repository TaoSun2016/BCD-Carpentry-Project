<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MaintainEmployee.aspx.cs" Inherits="Default2" %>

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
    <div style="height:100%; overflow-y:scroll" class="auto-style7">
        <h2 class="auto-style6"><strong>Maintain Employee Information</strong></h2>
        <div>
            <div style="width: 100%">
                <div style="float: left; width: 25%; text-align: right">
                    Forename:&nbsp;&nbsp;
                </div>
                <div style="float: left; width: 25%">
                    <asp:TextBox ID="Q_Forename" runat="server" MaxLength="60"></asp:TextBox>
                </div>
                <div style="float: left; width: 15%; text-align: right">Surname:&nbsp;&nbsp;</div>
                <div style="float: left; width: 35%">
                    <asp:TextBox ID="Q_Surname" runat="server" MaxLength="50"></asp:TextBox>
                </div>
            </div>
            <br />
            <br />
            <div style="width: 100%">
                <div style="float: left; width: 25%; text-align: right">
                    Email:&nbsp;&nbsp;
                </div>
                <div style="float: left; width: 25%">
                    <asp:TextBox ID="Q_Email" runat="server" MaxLength="100"></asp:TextBox>
                </div>
                <div style="float: left; width: 15%; text-align: right">&nbsp;&nbsp;</div>
                <div style="float: left; width: 35%">
                   &nbsp;&nbsp;
                </div>
            </div>
            <br />
            <br />
            <div style="width:100%;text-align:center">
                <asp:Button ID="Query" runat="server" Text="Query" Width="83px" OnClick="Query_Click" />
            </div>
            <br />
            <hr />
        </div>
        <p class="auto-style6">
            <strong>Basic Information</strong>
        </p>
        <div class="auto-style7">
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
            <br />
            <div style="width: 100%">
                <div style="float: left; width: 25%; text-align: right">
                    DOB:&nbsp;&nbsp;
                </div>
                <div style="float: left; width: 25%">
                    <asp:TextBox ID="DOB" runat="server" MaxLength="8"></asp:TextBox>*
                </div>
                <div style="float: left; width: 15%; text-align: right">Position:&nbsp;&nbsp;</div>
                <div style="float: left; width: 35%">
                    <asp:TextBox ID="Position" runat="server" MaxLength="10"></asp:TextBox>*
                </div>
            </div>
            <br />
            <br />
            <div style="width: 100%">
                <div style="float: left; width: 25%; text-align: right">
                    Hire Date:&nbsp;&nbsp;
                </div>
                <div style="float: left; width: 25%">
                    <asp:TextBox ID="HireDate" runat="server" MaxLength="8"></asp:TextBox>*
                </div>
                <div style="float: left; width: 15%; text-align: right">Resign Date:&nbsp;&nbsp;</div>
                <div style="float: left; width: 35%">
                    <asp:TextBox ID="ResignDate" runat="server" MaxLength="8"></asp:TextBox>
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
                <div style="float: left; width: 15%; text-align: right">&nbsp;&nbsp;</div>
                <div style="float: left; width: 35%">&nbsp;&nbsp;</div>
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
                <div style="float: left; width: 35%">&nbsp;&nbsp;<asp:FileUpload ID="SiteSafePhoto" runat="server" /></div>
            </div>
            <br />
            <br />
            <div style="width: 100%">
                <div style="float: left; width: 50%; text-align: center">
                    <asp:Image ID="DriverLicense" runat="server" AlternateText="Driver License Photo"  width="300px" Height="200px" BorderStyle="Dotted"/>
                </div>
                <div style="float: left; width: 50%; text-align: center">       
                    <asp:Image ID="SiteSafe" runat="server" AlternateText ="Site Safe Photo" width="300px" Height="200px" BorderStyle="Dotted" />
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
                <div style="float: left; width: 35%"><asp:TextBox ID="HomeNumber" runat="server" MaxLength="20"></asp:TextBox></div>
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
                <div style="float: left; width: 35%"><asp:TextBox ID="KinNumber" runat="server" MaxLength="20"></asp:TextBox></div>
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
                <div style="float: left; width: 35%"> <asp:TextBox ID="AccountNumber" runat="server" MaxLength="30"></asp:TextBox>*</div>
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
                <div style="float: left; width: 35%"> <asp:TextBox ID="TaxRate" runat="server" TextMode="Number"></asp:TextBox>*</div>
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
                <div style="float: left; width: 35%"> &nbsp;&nbsp;</div>
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
                <div style="float: left; width: 35%"> <asp:TextBox ID="City" runat="server" MaxLength="30"></asp:TextBox>*</div>
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
                <div style="float: left; width: 35%"> <asp:TextBox ID="Street" runat="server" MaxLength="100"></asp:TextBox>*</div>
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
                <div style="float: left; width: 35%"> &nbsp;&nbsp;</div>
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
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Update" runat="server" Text="Update" OnClick="Update_Click" Width="69px" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="Delete" runat="server" Text="Delete" Width="68px" OnClick="Delete_Click" />
       <asp:HiddenField ID="EmployeeID" runat="server" />
        <asp:HiddenField ID="oldForename" runat="server" />
        <asp:HiddenField ID="oldSurname" runat="server" />
        <asp:HiddenField ID="oldDOB" runat="server" />
        <asp:HiddenField ID="oldPosition" runat="server" />
        <asp:HiddenField ID="oldHireDate" runat="server" />
        <asp:HiddenField ID="oldResignDate" runat="server" />
        <asp:HiddenField ID="oldYearsInBCD" runat="server" />
        <asp:HiddenField ID="oldYearsInIndustry" runat="server" />
        <asp:HiddenField ID="oldDriverLicenseNumber" runat="server" />
        <asp:HiddenField ID="oldDriverLicenseClass" runat="server" />
        <asp:HiddenField ID="oldDriverLicenseExpiryDate" runat="server" />
        <asp:HiddenField ID="oldMobileNumber" runat="server" />
        <asp:HiddenField ID="oldHomeNumber" runat="server" />
        <asp:HiddenField ID="oldEmail" runat="server" />
        <asp:HiddenField ID="oldKinName" runat="server" />
        <asp:HiddenField ID="oldKinNumber" runat="server" />
        <asp:HiddenField ID="oldBankName" runat="server" />
        <asp:HiddenField ID="oldAccountNumber" runat="server" />
        <asp:HiddenField ID="oldPayRate" runat="server" />
        <asp:HiddenField ID="oldTaxRate" runat="server" />
        <asp:HiddenField ID="oldIRDNumber" runat="server" />
        <asp:HiddenField ID="oldCountry" runat="server" />
        <asp:HiddenField ID="oldCity" runat="server" />
        <asp:HiddenField ID="oldSuburb" runat="server" />
        <asp:HiddenField ID="oldStreet" runat="server" />
        <asp:HiddenField ID="oldPostCode" runat="server" />
        <asp:HiddenField ID="oldNote" runat="server" />
    </div>
</asp:Content>

