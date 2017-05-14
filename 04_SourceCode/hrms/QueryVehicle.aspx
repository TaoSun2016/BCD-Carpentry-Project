<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="QueryVehicle.aspx.cs" Inherits="Default2"  EnableEventValidation="false"%>

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
    <div style="overflow-y: scroll">
        <h2 class="auto-style6"><strong>Vehicle Information</strong></h2>


        <asp:GridView ID="GridViewVehicle" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="RegisterNumber" DataSourceID="SqlDataSourceVehicle" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField HeaderText="Edit" ShowEditButton="true" />
                <asp:CommandField HeaderText="Delete" ShowDeleteButton="true" />
                <asp:BoundField DataField="RegisterNumber" HeaderText="RegisterNumber" ReadOnly="True" SortExpression="RegisterNumber" />
                <asp:BoundField DataField="SaleAgreement" HeaderText="SaleAgreement" SortExpression="SaleAgreement" />
                <asp:BoundField DataField="OwnershipChanged" HeaderText="OwnershipChanged" SortExpression="OwnershipChanged" />
                <asp:BoundField DataField="Insured" HeaderText="Insured" SortExpression="Insured" />
                <asp:BoundField DataField="WOFDueDate" HeaderText="WOFDueDate" DataFormatString="{0:yyyyMMdd}" SortExpression="WOFDueDate" />
                <asp:BoundField DataField="ServiceDue" HeaderText="ServiceDue" SortExpression="ServiceDue" />
                <asp:BoundField DataField="REGODueDate" HeaderText="REGODueDate" DataFormatString="{0:yyyyMMdd}" SortExpression="REGODueDate" />
                <asp:BoundField DataField="FuelCardNumber" HeaderText="FuelCardNumber" SortExpression="FuelCardNumber" />
                <asp:BoundField DataField="GPSInstalled" HeaderText="GPSInstalled" SortExpression="GPSInstalled" />
                <asp:BoundField DataField="GPSSerialNumber" HeaderText="GPSSerialNumber" SortExpression="GPSSerialNumber" />
                <asp:BoundField DataField="SimCardNumber" HeaderText="SimCardNumber" SortExpression="SimCardNumber" />
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
        <asp:SqlDataSource ID="SqlDataSourceVehicle" runat="server"
            ConnectionString="<%$ ConnectionStrings:HRMSDBConnectionString %>"
            SelectCommand="SELECT * FROM [Vehicle]  order by RegisterNumber"
            DeleteCommand="DELETE FROM [Vehicle] WHERE RegisterNumber = @RegisterNumber"
            UpdateCommand="UPDATE [Vehicle] SET SaleAgreement = @SaleAgreement, OwnershipChanged = @OwnershipChanged, Insured = @Insured,
                                                WOFDueDate = @WOFDueDate, ServiceDue = @ServiceDue, REGODueDate = @REGODueDate,
                                                FuelCardNumber = @FuelCardNumber, GPSInstalled = @GPSInstalled, GPSSerialNumber = @GPSSerialNumber,
                                                SimCardNumber = @SimCardNumber  WHERE RegisterNumber = @RegisterNumber"></asp:SqlDataSource>

        <br />
        <br />
        <div style="text-align: center">
            <asp:Button ID="Export" runat="server" Text="Export to Excel" OnClick="Export_Click" />
        </div>
    </div>
</asp:Content>

