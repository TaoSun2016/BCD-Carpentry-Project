<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="QueryToolTraining.aspx.cs" Inherits="Default2"  EnableEventValidation="false"%>

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
    <h2 class="auto-style6"><strong>Tool Training Record</strong></h2>
    <div style="overflow-y: scroll;height:75%;width:100%;text-align:center" >     
        
        <asp:GridView ID="GridViewToolTraining" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Date,TrainingType,EmployeeID" DataSourceID="SqlDataSourceToolTraining" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField HeaderText="Delete" ShowDeleteButton="true" />
                <asp:BoundField DataField="Forname" HeaderText="Forename" ReadOnly="True" SortExpression="Forname"/>
                <asp:BoundField DataField="Surname" HeaderText="Surname" SortExpression="Surname" />
                <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
                <asp:BoundField DataField="TrainingType" HeaderText="TrainingType" SortExpression="TrainingType" />
                              
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
        <asp:SqlDataSource ID="SqlDataSourceToolTraining" runat="server"
            ConnectionString="<%$ ConnectionStrings:HRMSDBConnectionString %>"
            SelectCommand="SELECT e.Forname, e.Surname,t.* FROM [EMPLOYEE] e,[TOOL_TRAINING] t WHERE e.EmployeeID = t.EmployeeID order by Date desc, Forname"
            DeleteCommand="DELETE FROM [TOOL_TRAINING] WHERE Date = @Date and TrainingType = @TrainingType and EmployeeID = @EmployeeID">
        </asp:SqlDataSource>     
    </div>
    <br />
    <br />
    <div style="text-align:center">
        <asp:Button ID="Export" runat="server" Text="Export to Excel" OnClick="Export_Click" />
    </div>
    </asp:Content>

