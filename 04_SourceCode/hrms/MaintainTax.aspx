<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MaintainTax.aspx.cs" Inherits="Default2"  EnableEventValidation="false"%>

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
        <h2 class="auto-style6"><strong>Maintan Tax Information</strong></h2>
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
            <div style="float: left; width: 20%; text-align: right">Week Ending:&nbsp;&nbsp;</div>
            <div style="float: left; width: 30%"><asp:TextBox ID="WeekEndingDate" runat="server"></asp:TextBox></div>
        </div>
        <br />
        <br />
        
        <div style="text-align: center">
        <asp:Button ID="Query" runat="server" Text="Query" OnClick="Query_Click" />
        </div>
        <br />
        <hr />

        <div style=" width: 100%; text-align: center">

            <asp:GridView ID="GridViewTax" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="EmployeeID,WeekEndingDate,Category" DataSourceID="SqlDataSourceTax" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField HeaderText="Update" ShowEditButton="true" />
                    <asp:CommandField HeaderText="Delete" ShowDeleteButton="true" />
                    <asp:BoundField DataField="WeekEndingDate" ReadOnly="True" HeaderText="Week Ending"/>
                    <asp:BoundField DataField="Forename" HeaderText="Forename" ReadOnly="True" SortExpression="Forename" />
                    <asp:BoundField DataField="Surname" HeaderText="Surname" ReadOnly="true" SortExpression="Surname" />
                    <asp:BoundField DataField="IRDNumber" HeaderText="IRD Number" ReadOnly="true" SortExpression="DIRDNumberate" />                   
                    <asp:BoundField DataField="TaxRate" HeaderText="Tax Rate(%)" ReadOnly="true" SortExpression="TaxRate"/>
                    <asp:BoundField DataField="WeekEndingDate" HeaderText="Week Ending" ReadOnly="true" SortExpression="WeekEndingDate" />
                    <asp:BoundField DataField="Category" HeaderText="Category" ReadOnly="true" SortExpression="Category" />
                    <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" />
                    <asp:BoundField DataField="Note" HeaderText="Deduction Note" SortExpression="Note" />                
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
            <asp:SqlDataSource ID="SqlDataSourceTax" runat="server"
                ConnectionString="<%$ ConnectionStrings:HRMSDBConnectionString %>"
                SelectCommand="SELECT e.Forename, e.Surname, e.IRDNumber, e.TaxRate,  t.* FROM [EMPLOYEE] e,[TAX] t WHERE e.EmployeeID = t.EmployeeID and e.EmployeeStatus = 'Y' order by e.Forename, e.Surname, t.WeekEndingDate, t.Category"
                DeleteCommand="DELETE FROM [TAX] WHERE EmployeeID = @EmployeeID AND WeekEndingDate = @WeekEndingDate AND Category = @Category"
                UpdateCommand="UPDATE [Tax] SET Amount = @Amount, Note = @Note WHERE EmployeeID = @EmployeeID AND WeekEndingDate = @WeekEndingDate  AND Category = @Category"></asp:SqlDataSource>
        </div>
        <br />
        <br />
        <div style="text-align: center">
            <asp:Button ID="Export" runat="server" Text="Export to Excel" OnClick="Export_Click" />
        </div>
    </div>
</asp:Content>

