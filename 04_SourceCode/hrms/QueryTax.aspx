<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="QueryTax.aspx.cs" Inherits="Default2"  EnableEventValidation="false"%>

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
    <div style="height: 100%; overflow-y: scroll;">
        <h2 class="auto-style6"><strong>Tax Information</strong></h2>
        <br />
        <br />
        <div style="width: 100%">
            <div style="float: left; width: 25%; text-align: right">
                Begin Week Ending:&nbsp;&nbsp;
            </div>
            <div style="float: left; width: 25%">
                <asp:TextBox ID="BeginWeekEnding" runat="server"></asp:TextBox><asp:ImageButton ID="ImageButtonBeginDate" runat="server" Height="22px" ImageAlign="Middle" ImageUrl="~/Images/Calendar-icon.png" OnClick="ImageButtonBeginDate_Click" CausesValidation="False" />*
            </div>
            <div style="float: left; width: 20%; text-align: right">End Week Ending:&nbsp;&nbsp;</div>
            <div style="float: left; width: 30%">
                <asp:TextBox ID="EndWeekEnding" runat="server"></asp:TextBox><asp:ImageButton ID="ImageButtonEndDate" runat="server" Height="22px" ImageAlign="Middle" ImageUrl="~/Images/Calendar-icon.png" OnClick="ImageButtonEndDate_Click" CausesValidation="False" />*</div>
        </div>
        <br />

        <div style="float: left; width: 100%">
            <div style="float: left; width: 25%">
                &nbsp;&nbsp;&nbsp;&nbsp;
            </div>
            <div style="float: left; width: 25%">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic" ErrorMessage="Please input begin week ending date!" ForeColor="Red" ControlToValidate="BeginWeekEnding"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Invalide date!YYYYMMDD" ControlToValidate="BeginWeekEnding" Display="Dynamic" ForeColor="Red" ValidationExpression="^\d{4}\d{1,2}\d{1,2}$"></asp:RegularExpressionValidator>
                <asp:Calendar ID="CalendarBeginDate" runat="server" Visible="false" OnSelectionChanged="CalendarBeginDate_SelectionChanged"></asp:Calendar>
            </div>
            <div style="float: left; width: 15%">
                &nbsp;&nbsp;&nbsp;&nbsp;
            </div>
            <div style="float: right; width: 35%; text-align: left">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic" ErrorMessage="Please input end week ending date!" ForeColor="Red" ControlToValidate="EndWeekEnding"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalide date!YYYYMMDD" ControlToValidate="EndWeekEnding" Display="Dynamic" ForeColor="Red" ValidationExpression="^\d{4}\d{1,2}\d{1,2}$"></asp:RegularExpressionValidator>                
                <asp:Calendar ID="CalendarEndDate" runat="server" Visible="false" OnSelectionChanged="CalendarEndDate_SelectionChanged"></asp:Calendar>
            </div>
        </div>
        <br />

        <div style="text-align: center">
            <asp:Button ID="Query" runat="server" Text="Query" OnClick="Query_Click" />
        </div>
        <br />
        <hr />

        <div style="width: 100%; text-align: right">

            <asp:GridView ID="GridViewTax" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSourceTax" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>


                    <asp:BoundField DataField="Forename" HeaderText="FORENAME" ReadOnly="True" />
                    <asp:BoundField DataField="Surname" HeaderText="SURNAME" ReadOnly="true" />
                    <asp:BoundField DataField="IRDNumber" HeaderText="IRD NUMBER" ReadOnly="True" />
                    <asp:BoundField DataField="TaxRate" HeaderText="TAX RATE(%)" ReadOnly="True" />
                    <asp:BoundField DataField="WeekEndingDate" HeaderText="WEEK ENDING" ReadOnly="True" />
                    <asp:BoundField DataField="Wage" HeaderText="WAGE" ReadOnly="true" />
                    <asp:BoundField DataField="Tax" HeaderText="TAX" ReadOnly="true" />
                    <asp:BoundField DataField="GST" HeaderText="GST" ReadOnly="true" />
                    <asp:BoundField DataField="Deduction" HeaderText="DEDUCTION" ReadOnly="true" />
                    <asp:BoundField DataField="Note" HeaderText="DEDUCTION NOTE" ReadOnly="true" />

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
                SelectCommand="SELECT * FROM [TAX_REPORT] ORDER BY SeqNumber"></asp:SqlDataSource>
        </div>
        <br />
        <br />
        <div style="text-align: center">
            <asp:Button ID="Export" runat="server" Text="Export to Excel" OnClick="Export_Click" />
        </div>
    </div>
</asp:Content>

