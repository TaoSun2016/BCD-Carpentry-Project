<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="QueryWage.aspx.cs" Inherits="Default2"  EnableEventValidation="false"%>

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
                <asp:TextBox ID="Forename" runat="server" MaxLength="50"></asp:TextBox>
            </div>
            <div style="float: left; width: 20%; text-align: right">Surname:&nbsp;&nbsp;</div>
            <div style="float: left; width: 30%">
                <asp:TextBox ID="Surname" runat="server" MaxLength="50"></asp:TextBox>
            </div>
        </div>
        <br />
        <br />
        <div style="width: 100%">
            <div style="float: left; width: 25%; text-align: right">
                Email:&nbsp;&nbsp;
            </div>
            <div style="float: left; width: 25%">
                <asp:TextBox ID="Email" runat="server" MaxLength="100"></asp:TextBox>
            </div>
            <div style="float: left; width: 20%; text-align: right">Week Ending:&nbsp;&nbsp;</div>
            <div style="float: left; width: 30%"><asp:TextBox ID="WeekEndingDate" runat="server" MaxLength="8"></asp:TextBox><asp:ImageButton ID="ImageButtonWeekEndingDate" runat="server" Height="22px" ImageAlign="Middle" ImageUrl="~/Images/Calendar-icon.png" OnClick="ImageButtonWeekEndingDate_Click" CausesValidation="False" /></div>
        </div>
        <br />
        <div style="float: left; width: 100%">
                <div style="float: left; width: 25%">
                    &nbsp;&nbsp;&nbsp;&nbsp;
                </div>
                 <div style="float: left; width: 25%">
                     <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalide email address!" ControlToValidate="Email" Display="Dynamic" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </div>
                <div style="float: left; width: 15%">
                    &nbsp;&nbsp;&nbsp;&nbsp;
                </div>
                <div style="float: right; width: 35%;text-align:left">
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Invalide date!YYYYMMDD" ControlToValidate="WeekEndingDate" Display="Dynamic" ForeColor="Red" ValidationExpression="^\d{4}\d{1,2}\d{1,2}$"></asp:RegularExpressionValidator>
                    <asp:Calendar ID="CalendarWeekEndingDate" runat="server" Visible="false" OnSelectionChanged="CalendarWeekEndingDate_SelectionChanged"></asp:Calendar>
                </div>
            </div>
        <br />
        
        <div style="text-align: center">
        <asp:Button ID="Query" runat="server" Text="Query" OnClick="Query_Click" />
        </div>
        <br />
        <hr />

        <div style=" width: 100%; text-align: center">

            <asp:GridView ID="GridViewWage" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="EmployeeID,WeekEndingDate" DataSourceID="SqlDataSourceWage" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField HeaderText="Update" ShowEditButton="true" />
                    <asp:CommandField HeaderText="Delete" ShowDeleteButton="true" />
                    <asp:BoundField DataField="WeekEndingDate" ReadOnly="True" DataFormatString="{0:yyyyMMdd}" HeaderText="Week Ending"/>
                    <asp:BoundField DataField="Forename" HeaderText="Forename" ReadOnly="True" SortExpression="Forename" />
                    <asp:BoundField DataField="Surname" HeaderText="Surname" ReadOnly="true" SortExpression="Surname" />
                    <asp:BoundField DataField="PayRate" HeaderText="Rate" ReadOnly="true" SortExpression="Date" />                   
                    <asp:BoundField DataField="TaxRate" HeaderText="Tax(%)" ReadOnly="true" SortExpression="TaxRate"/>
                    <asp:BoundField DataField="Position" HeaderText="Type" ReadOnly="true" SortExpression="Position" />
                    <asp:BoundField DataField="Amount" HeaderText="Paid Amount" DataFormatString="{0:N2}" SortExpression="Amount" />
                    <asp:BoundField DataField="Travel" HeaderText="Travel" DataFormatString="{0:N2}" SortExpression="Travel" />
                    <asp:BoundField DataField="Deduction" HeaderText="Deduction" DataFormatString="{0:N2}" SortExpression="Deduction" />
                    <asp:BoundField DataField="GST" HeaderText="GST" DataFormatString="{0:N2}" SortExpression="GST" />
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
            <asp:SqlDataSource ID="SqlDataSourceWage" runat="server"
                ConnectionString="<%$ ConnectionStrings:HRMSDBConnectionString %>"
                SelectCommand="SELECT e.Forename, e.Surname, e.PayRate, e.TaxRate, e.Position, w.* FROM [EMPLOYEE] e,[WAGE] w WHERE e.EmployeeID = w.EmployeeID and e.EmployeeStatus = 'Y' order by e.Forename, e.Surname, w.WeekEndingDate"
                DeleteCommand="DELETE FROM [WAGE] WHERE EmployeeID = @EmployeeID AND WeekEndingDate = @WeekEndingDate"
                UpdateCommand="UPDATE [WAGE] SET Amount = @Amount, Travel = @Travel, Deduction = @Deduction, GST = @GST, WINZ = @WINZ, IRD = @IRD WHERE EmployeeID = @EmployeeID AND WeekEndingDate = @WeekEndingDate"></asp:SqlDataSource>
        </div>
        <br />
        <br />
        <div style="text-align: center">
            <asp:Button ID="Export" runat="server" Text="Export to Excel" OnClick="Export_Click" />
        </div>
    </div>
</asp:Content>

