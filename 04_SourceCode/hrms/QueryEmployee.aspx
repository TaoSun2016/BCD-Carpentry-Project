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
    <h2 class="auto-style6"><strong>Employee Information</strong></h2>
    <div style="overflow-y: scroll" class="auto-style7" id="Forname">     
        <asp:GridView ID="EmployeeGridView" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="EmployeeID" DataSourceID="SqlDataSource1" GridLines="None" ForeColor="#333333" AllowSorting="True">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField HeaderText="Edit" ShowEditButton="true" />
                <asp:CommandField HeaderText="Delete" ShowDeleteButton="true" />
                <asp:BoundField DataField="EmployeeID" HeaderText="EmployeeID" Visible="false"/>
                <asp:BoundField DataField="Forname" HeaderText="Forname" SortExpression="Forname" />
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
            UpdateCommand="UPDATE [EMPLOYEE] SET Forname = @Forname, Surname = @Surname, DOB = @DOB, Position = @Position, HireDate = @HireDate, ResignDate = @ResignDate, YearsInBCD = @YearsInBCD, YearsInIndustry = @YearsInIndustry, DriverLicenseNumber = @DriverLicenseNumber, DriverLicenseClass = @DriverLicenseClass, DriverLicenseExpiryDate = @DriverLicenseExpiryDate, DriverLicensePhoto = @DriverLicensePhoto, SiteSafePhoto = @SiteSafePhoto, MobileNumber = @MobileNumber, HomeNumber = @HomeNumber, Email = @Email, KinName = @KinName, KinNumber = @KinNumber, BankName = @BankName, AccountNumber = @AccountNumber, PayRate = @PayRate, TaxRate = @TaxRate, IRDNumber = @IRDNumber, Country = @Country, City = @City, Suburb = @Suburb, Street = @Street, PostCode = @PostCode, Note = @Note WHERE EmployeeID = @EmployeeID"></asp:SqlDataSource>
    </div>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
    <br />
    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="Export" runat="server" Text="Export to Excel" OnClick="Export_Click" />     
    </asp:Content>

