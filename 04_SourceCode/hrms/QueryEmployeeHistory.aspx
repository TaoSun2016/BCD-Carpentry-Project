<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="QueryEmployeeHistory.aspx.cs" Inherits="Default2"  EnableEventValidation="false"%>

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
    <div style="height: 100%;overflow-y: scroll;">
        <h2 class="auto-style6"><strong>Time Sheet Information</strong></h2>
        <div style="width: 100%">
            <div style="float: left; width: 25%; text-align: right">
                Forename:&nbsp;&nbsp;
            </div>
            <div style="float: left; width: 25%">
                <asp:TextBox ID="Forename" runat="server"></asp:TextBox>
            </div>
            <div style="float: left; width: 20%; text-align: right">Surname:&nbsp;&nbsp;</div>
            <div style="float: left; width: 30%">
                <asp:TextBox ID="Surname" runat="server"></asp:TextBox>
            </div>
        </div>
        <br />
        <br />
        <div style="width: 100%">
            <div style="float: left; width: 25%; text-align: right">
                Email:&nbsp;&nbsp;
            </div>
            <div style="float: left; width: 25%">
                <asp:TextBox ID="Email" runat="server"></asp:TextBox>
            </div>
            <div style="float: left; width: 20%">&nbsp;&nbsp;</div>
            <div style="float: left; width: 30%">&nbsp;&nbsp;</div>
        </div>
        <br />
        <br />
        
        <div style="text-align: center">
        <asp:Button ID="Query" runat="server" Text="Query" OnClick="Query_Click" />
        </div>
        <br />
        <hr />

        <div style=" width: 100%; text-align: center">
            <asp:GridView ID="GridViewEmployeeHistory" runat="server" AutoGenerateColumns="False" CellPadding="4"  DataSourceID="SqlDataSourceEmployeeHistory" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
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
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSourceEmployeeHistory" runat="server"
                ConnectionString="<%$ ConnectionStrings:HRMSDBConnectionString %>"
                SelectCommand="SELECT * FROM [Employee_History]   order by EmployeeID, ModTime"></asp:SqlDataSource>
        </div>
        <br />
        <br />
        <div style="text-align: center">
            <asp:Button ID="Export" runat="server" Text="Export to Excel" OnClick="Export_Click" />
        </div>
    </div>
</asp:Content>

