<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="QueryEmployee.aspx.cs" Inherits="Default2"  EnableEventValidation="false"%>

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
    <div style="overflow-y: scroll; height: 100%" class="auto-style7">
        <h2 class="auto-style6"><strong>Employee Information</strong></h2>
        <br />
        <div style="width: 100%; text-align: left">
            <asp:CheckBox ID="Basic" runat="server" Text="Basic Information" AutoPostBack="True" OnCheckedChanged="Basic_CheckedChanged" />
        </div>
        <br />
        <div style="float: left; width: 100%">
            <div style="float: left; width: 20%; text-align: left">
                <asp:CheckBox ID="Forename" runat="server" Text="Forename" /></div>
            <div style="float: left; width: 20%; text-align: left">
                <asp:CheckBox ID="Surname" runat="server" Text="Surname " /></div>
            <div style="float: left; width: 20%; text-align: left">
                <asp:CheckBox ID="Position" runat="server" Text="Position" /></div>
            <div style="float: left; width: 20%; text-align: left">
                <asp:CheckBox ID="DOB" runat="server" Text="DOB" /></div>
            <div style="float: left; width: 20%; text-align: left">
                <asp:CheckBox ID="HireDate" runat="server" Text="Hire Date" /></div>
        </div>
        <div style="float: left; width: 100%">
            <div style="float: left; width: 20%; text-align: left">
                <asp:CheckBox ID="ResignDate" runat="server" Text="Resign Date" /></div>
            <div style="float: left; width: 20%; text-align: left">
                <asp:CheckBox ID="YearsInBCD" runat="server" Text="Years In BCD" /></div>
            <div style="float: left; width: 20%; text-align: left">
                <asp:CheckBox ID="YearsInIndustry" runat="server" Text="Years In Industry " /></div>
            <div style="float: left; width: 20%; text-align: left">
                <asp:CheckBox ID="DriverLicenseNumber" runat="server" Text="Driver License Number" /></div>
            <div style="float: left; width: 20%; text-align: left">
                <asp:CheckBox ID="DriverLicenseClass" runat="server" Text="Driver License Class" /></div>
            
        </div>
        <div style="float: left; width: 100%">
            <div style="float: left; width: 20%; text-align: left">
                <asp:CheckBox ID="DriverLicenseExpiryDate" runat="server" Text="Driver License Photo" /></div>
            <div style="float: left; width: 20%; text-align: left">
                <asp:CheckBox ID="DriverLicensePhoto" runat="server" Text="Driver License Photo" /></div>
            <div style="float: left; width: 20%; text-align: left">
                <asp:CheckBox ID="SiteSafePhoto" runat="server" Text="Site Safe Photo" /></div>
            <div style="float: left; width: 40%; text-align: center">&nbsp;</div>
        </div>
        <hr />
        <div style="width: 100%; text-align: left">
            <asp:CheckBox ID="Contact" runat="server" Text="Contact Information" AutoPostBack="True" OnCheckedChanged="Contact_CheckedChanged" />
        </div>
        <br />
        <div style="float: left; width: 100%">
            <div style="float: left; width: 20%; text-align: left">
                <asp:CheckBox ID="MobileNumber" runat="server" Text="Mobile Number" /></div>
            <div style="float: left; width: 20%; text-align: left">
                <asp:CheckBox ID="HomeNumber" runat="server" Text="Home Number" /></div>
            <div style="float: left; width: 20%; text-align: left">
                <asp:CheckBox ID="Email" runat="server" Text="Email" /></div>
            <div style="float: left; width: 20%; text-align: left">
                <asp:CheckBox ID="KinName" runat="server" Text="Kin Name" /></div>
            <div style="float: left; width: 20%; text-align: left">
                <asp:CheckBox ID="KinNumber" runat="server" Text="Kin Number" /></div>
        </div>
        <hr />
        <div style="width: 100%; text-align: left">
            <asp:CheckBox ID="Account" runat="server" Text="Account Information" AutoPostBack="True" OnCheckedChanged="Account_CheckedChanged" />
        </div>
        <br />
        <div style="float: left; width: 100%">
            <div style="float: left; width: 20%; text-align: left">
                <asp:CheckBox ID="BankName" runat="server" Text="BankName" /></div>
            <div style="float: left; width: 20%; text-align: left">
                <asp:CheckBox ID="AccountNumber" runat="server" Text="AccountNumber" /></div>
            <div style="float: left; width: 20%; text-align: left">
                <asp:CheckBox ID="PayRate" runat="server" Text="PayRate" /></div>
            <div style="float: left; width: 20%; text-align: left">
                <asp:CheckBox ID="TaxRate" runat="server" Text="TaxRate" /></div>
            <div style="float: left; width: 20%; text-align: left">
                <asp:CheckBox ID="IRDNumber" runat="server" Text="IRDNumber" /></div>
        </div>
        <hr />
        <div style="width: 100%; text-align: left">
            <asp:CheckBox ID="Address" runat="server" Text="Address Information" AutoPostBack="True" OnCheckedChanged="Address_CheckedChanged" />
        </div>
        <br />
        <div style="float: left; width: 100%">
            <div style="float: left; width: 20%; text-align: left">
                <asp:CheckBox ID="Country" runat="server" Text="Country" /></div>
            <div style="float: left; width: 20%; text-align: left">
                <asp:CheckBox ID="City" runat="server" Text="City" /></div>
            <div style="float: left; width: 20%; text-align: left">
                <asp:CheckBox ID="Suburb" runat="server" Text="Suburb" /></div>
            <div style="float: left; width: 20%; text-align: left">
                <asp:CheckBox ID="Street" runat="server" Text="Street" /></div>
            <div style="float: left; width: 20%; text-align: left">
                <asp:CheckBox ID="PostCode" runat="server" Text="Post Code" /></div>
        </div>
        <hr />
        <div style="width: 100%; text-align: left">
            <asp:CheckBox ID="Note" runat="server" Text="Note" />
        </div>
        <div style="width: 100%; text-align: center">
            <asp:Button ID="Query" runat="server" Text="Query" OnClick="Query_Click" />
        </div>
        <br />
        <hr />
        <div>
            <asp:GridView ID="EmployeeGridView" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="EmployeeID" DataSourceID="SqlDataSource1" GridLines="None" ForeColor="#333333" AllowSorting="True" Visible="False">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField HeaderText="Edit" ShowEditButton="true" />
                    <asp:CommandField HeaderText="Delete" ShowDeleteButton="true" />
                    <asp:BoundField DataField="EmployeeID" HeaderText="EmployeeID" Visible="false" />
                    <asp:BoundField DataField="Forename" HeaderText="Forename" SortExpression="Forename" />
                    <asp:BoundField DataField="Surname" HeaderText="Surname" SortExpression="Surname" />
                    <asp:BoundField DataField="Position" HeaderText="Position" SortExpression="Position" />
                    <asp:BoundField DataField="HomeNumber" HeaderText="HomeNumber" SortExpression="HomeNumber" />
                    <asp:BoundField DataField="MobileNumber" HeaderText="MobileNumber" SortExpression="MobileNumber" />
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                    <asp:BoundField DataField="DOB" HeaderText="DOB" SortExpression="DOB" />
                    <asp:BoundField DataField="KinName" HeaderText="KinName" SortExpression="KinName" />
                    <asp:BoundField DataField="KinNumber" HeaderText="KinNumber" SortExpression="KinNumber" />
                    <asp:BoundField DataField="BankName" HeaderText="BankName" SortExpression="BankName" />
                    <asp:BoundField DataField="AccountNumber" HeaderText="AccountNumber" SortExpression="AccountNumber" />
                    <asp:BoundField DataField="IRDNumber" HeaderText="IRDNumber" SortExpression="IRDNumber" />
                    <asp:BoundField DataField="PayRate" HeaderText="PayRate" SortExpression="PayRate" />
                    <asp:BoundField DataField="TaxRate" HeaderText="TaxRate" SortExpression="TaxRate" />
                    <asp:BoundField DataField="DriverLicenseNumber" HeaderText="DriverLicenseNumber" SortExpression="DriverLicenseNumber" />
                    <asp:BoundField DataField="DriverLicenseClass" HeaderText="DriverLicenseClass" SortExpression="DriverLicenseClass" />
                    <asp:BoundField DataField="DriverLicenseExpiryDate" HeaderText="DriverLicenseExpiryDate" SortExpression="DriverLicenseExpiryDate" />
                    <asp:BoundField DataField="DriverLicensePhoto" HeaderText="DriverLicensePhoto" SortExpression="DriverLicensePhoto" />
                    <asp:BoundField DataField="SiteSafePhoto" HeaderText="SiteSafePhoto" SortExpression="SiteSafePhoto" />
                    <asp:BoundField DataField="HireDate" HeaderText="HireDate" SortExpression="HireDate" />
                    <asp:BoundField DataField="ResignDate" HeaderText="ResignDate" SortExpression="ResignDate" />
                    <asp:BoundField DataField="YearsInBCD" HeaderText="YearsInBCD" SortExpression="YearsInBCD" />
                    <asp:BoundField DataField="YearsInIndustry" HeaderText="YearsInIndustry" SortExpression="YearsInIndustry" />
                    <asp:BoundField DataField="Country" HeaderText="Country" SortExpression="Country" />
                    <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                    <asp:BoundField DataField="Suburb" HeaderText="Suburb" SortExpression="Suburb" />
                    <asp:BoundField DataField="Street" HeaderText="Street" SortExpression="Street" />
                    <asp:BoundField DataField="PostCode" HeaderText="PostCode" SortExpression="PostCode" />
                    <asp:BoundField DataField="Note" HeaderText="Note" SortExpression="Note" />
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                ConnectionString="<%$ ConnectionStrings:HRMSDBConnectionString %>"
                SelectCommand="SELECT * FROM [EMPLOYEE] WHERE EmployeeStatus='Y'"
                DeleteCommand="UPDATE [EMPLOYEE] SET EmployeeStatus='N' WHERE EmployeeID = @EmployeeID"
                UpdateCommand="UPDATE [EMPLOYEE] SET Forename = @Forename, Surname = @Surname, DOB = @DOB, Position = @Position, HireDate = @HireDate, ResignDate = @ResignDate, YearsInBCD = @YearsInBCD, YearsInIndustry = @YearsInIndustry, DriverLicenseNumber = @DriverLicenseNumber, DriverLicenseClass = @DriverLicenseClass, DriverLicenseExpiryDate = @DriverLicenseExpiryDate, DriverLicensePhoto = @DriverLicensePhoto, SiteSafePhoto = @SiteSafePhoto, MobileNumber = @MobileNumber, HomeNumber = @HomeNumber, Email = @Email, KinName = @KinName, KinNumber = @KinNumber, BankName = @BankName, AccountNumber = @AccountNumber, PayRate = @PayRate, TaxRate = @TaxRate, IRDNumber = @IRDNumber, Country = @Country, City = @City, Suburb = @Suburb, Street = @Street, PostCode = @PostCode, Note = @Note WHERE EmployeeID = @EmployeeID"></asp:SqlDataSource>

            <br />
            <br />
        </div>
        <div style="width: 100%; text-align: center">
            <asp:Button ID="Export" runat="server" Text="Export to Excel" OnClick="Export_Click" Visible="False" />
        </div>
    </div>
</asp:Content>

