﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="QueryIndividualDebt.aspx.cs" Inherits="Default2"  EnableEventValidation="false"%>

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
        <h2 class="auto-style6"><strong>Individual Debt Register</strong></h2>
        <div style="width: 100%">
            <div style="float: left; width: 25%; text-align: right">
                Forename:&nbsp;&nbsp;
            </div>
            <div style="float: left; width: 25%">
                <asp:TextBox ID="Forename" runat="server"></asp:TextBox>
            </div>
            <div style="float: left; width: 10%; text-align: right">Surname:&nbsp;&nbsp;</div>
            <div style="float: left; width: 40%">
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
            <div style="float: left; width: 10%; text-align: right">&nbsp;&nbsp;</div>
            <div style="float: left; width: 40%">&nbsp;&nbsp</div>
        </div>
        <br />
        <div style="float: left; width: 100%">
            <div style="float: left; width: 25%">
                &nbsp;&nbsp;&nbsp;&nbsp;
            </div>
            <div style="float: left; width: 25%">
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalide email address!" ControlToValidate="Email" Display="Dynamic" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </div>
            <div style="float: left; width: 50%">
                &nbsp;&nbsp;&nbsp;&nbsp;
            </div>
        </div>
        <br />
        <div style="width: 100%">
            <div style="float: left; width: 25%; text-align: right">
                Begin Date:&nbsp;&nbsp;
            </div>
            <div style="float: left; width: 25%">
                <asp:TextBox ID="BeginDate" runat="server"></asp:TextBox><asp:ImageButton ID="ImageButtonBeginDate" runat="server" Height="22px" ImageAlign="Middle" ImageUrl="~/Images/Calendar-icon.png" OnClick="ImageButtonBeginDate_Click" CausesValidation="False" />
            </div>
            <div style="float: left; width: 10%; text-align: right">End Date:&nbsp;&nbsp;</div>
            <div style="float: left; width: 40%">
                <asp:TextBox ID="EndDate" runat="server"></asp:TextBox><asp:ImageButton ID="ImageButtonEndDate" runat="server" Height="22px" ImageAlign="Middle" ImageUrl="~/Images/Calendar-icon.png" OnClick="ImageButtonEndDate_Click" CausesValidation="False" />
            </div>
        </div>
        <br />
        <div style="float: left; width: 100%">
            <div style="float: left; width: 25%">
                &nbsp;&nbsp;&nbsp;&nbsp;
            </div>
            <div style="float: left; width: 25%">
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Invalide date!YYYYMMDD" ControlToValidate="BeginDate" Display="Dynamic" ForeColor="Red" ValidationExpression="^\d{4}\d{1,2}\d{1,2}$"></asp:RegularExpressionValidator>
                <asp:Calendar ID="CalendarBeginDate" runat="server" Visible="false" OnSelectionChanged="CalendarBeginDate_SelectionChanged"></asp:Calendar>
            </div>
            <div style="float: left; width: 10%">
                &nbsp;&nbsp;&nbsp;&nbsp;
            </div>
            <div style="float: right; width: 40%; text-align: left">
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Invalide date!YYYYMMDD" ControlToValidate="EndDate" Display="Dynamic" ForeColor="Red" ValidationExpression="^\d{4}\d{1,2}\d{1,2}$"></asp:RegularExpressionValidator>
                <asp:Calendar ID="CalendarEndDate" runat="server" Visible="false" OnSelectionChanged="CalendarEndDate_SelectionChanged"></asp:Calendar>
            </div>
        </div>
        <br />

        <div style="text-align: center">
        <asp:Button ID="Query" runat="server" Text="Query" OnClick="Query_Click" />
        </div>
        <br />
        <hr />

        <div style=" width: 100%; text-align: center">

            <asp:GridView ID="GridViewIndividualDebt" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="DebtID" DataSourceID="SqlDataSourceIndividualDebt" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField HeaderText="Update" ShowEditButton="true" />
                    <asp:CommandField HeaderText="Delete" ShowDeleteButton="true" />
                    <asp:BoundField DataField="Forename" HeaderText="Forename" ReadOnly="True" SortExpression="Forename" />
                    <asp:BoundField DataField="Surname" HeaderText="Surname" ReadOnly="true" SortExpression="Surname" />
                    <asp:BoundField DataField="DebtID" HeaderText="DebtID" Visible="false" />
                    <asp:BoundField DataField="EmployeeID" HeaderText="EmployeeID" Visible="false" />
                    <asp:BoundField DataField="Date" HeaderText="Date" DataFormatString="{0:yyyyMMdd}" SortExpression="Date" />
                    <asp:BoundField DataField="INV#" HeaderText="INV#" SortExpression="INV#" />
                    <asp:BoundField DataField="Company" HeaderText="Company" SortExpression="Company" />
                    <asp:BoundField DataField="Item" HeaderText="Item" SortExpression="Item" />
                    <asp:BoundField DataField="Amount" HeaderText="Amount" DataFormatString="{0:N2}" SortExpression="Amount" />
                    <asp:BoundField DataField="DeductionAmount" HeaderText="Deduction" DataFormatString="{0:N2}" SortExpression="DeductionAmount" />
                    <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                    <asp:BoundField DataField="InvoiceFlag" HeaderText="Invoice Flag" SortExpression="InvoiceFlag" />
                    <asp:BoundField DataField="ATPAFlag" HeaderText="ATPA Flag" SortExpression="ATPAFlag" />
                    <asp:BoundField DataField="WINZ" HeaderText="WINZ" DataFormatString="{0:N2}" SortExpression="WINZ" />
                    <asp:BoundField DataField="IRD" HeaderText="IRD" DataFormatString="{0:N2}" SortExpression="IRD" />
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
            <asp:SqlDataSource ID="SqlDataSourceIndividualDebt" runat="server"
                ConnectionString="<%$ ConnectionStrings:HRMSDBConnectionString %>"
                SelectCommand="SELECT e.Forename, e.Surname,i.* FROM [EMPLOYEE] e,[INDIVIDUAL_DEBT] i WHERE e.EmployeeID = i.EmployeeID and e.EmployeeStatus = 'Y' order by e.Forename,i.[Date]"
                DeleteCommand="DELETE FROM [INDIVIDUAL_DEBT] WHERE DebtID = @DebtID"
                UpdateCommand="UPDATE [INDIVIDUAL_DEBT] SET Date = @Date,INV# = @INV#,Company = @Company,Item = @Item,Amount = @Amount,DeductionAmount = @DeductionAmount,Description = @Description,InvoiceFlag = @InvoiceFlag,ATPAFlag = @ATPAFlag,WINZ = @WINZ,IRD = @IRD WHERE DebtID = @DebtID"></asp:SqlDataSource>
        </div>
        <br />
        <br />
        <div style="text-align: center">
            <asp:Button ID="Export" runat="server" Text="Export to Excel" OnClick="Export_Click" />
        </div>
    </div>
</asp:Content>

