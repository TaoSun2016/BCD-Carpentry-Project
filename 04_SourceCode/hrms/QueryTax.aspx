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
    <div style="height: 100%;overflow-y: scroll;">
        <h2 class="auto-style6"><strong>Time Sheet Information</strong></h2>
        <br />
        <br />
        <div style="width: 100%">
            <div style="float: left; width: 25%; text-align: right">
                Begin Week Ending:&nbsp;&nbsp;
            </div>
            <div style="float: left; width: 25%">
                <asp:TextBox ID="BeginWeekEnding" runat="server"></asp:TextBox>
            </div>
            <div style="float: left; width: 20%; text-align: right">End Week Ending:&nbsp;&nbsp;</div>
            <div style="float: left; width: 30%"><asp:TextBox ID="EndWeekEnding" runat="server"></asp:TextBox></div>
        </div>
        <br />
        <br />
        
        <div style="text-align: center">
        <asp:Button ID="Query" runat="server" Text="Query" OnClick="Query_Click" />
        </div>
        <br />
        <hr />

        <div style=" width: 100%; text-align: right">

            <asp:GridView ID="GridViewTax" runat="server" AutoGenerateColumns="False" CellPadding="4"  DataSourceID="SqlDataSourceTax" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>

                    
                    <asp:BoundField DataField="Forename" HeaderText="Forename" ReadOnly="True" />
                    <asp:BoundField DataField="Surname" HeaderText="Surname" ReadOnly="true" />
                    <asp:BoundField DataField="IRDNumber" ReadOnly="True" HeaderText="IRD Number"/>
                    <asp:BoundField DataField="TaxRate" ReadOnly="True" HeaderText="Tax Rate(%)"/>
                    <asp:BoundField DataField="WeekEndingDate" ReadOnly="True" HeaderText="Week Ending"/>
                    <asp:BoundField DataField="Wage" HeaderText="Wage" ReadOnly="true" />
                    <asp:BoundField DataField="Tax" HeaderText="Tax" ReadOnly="true" />
                    <asp:BoundField DataField="GST" HeaderText="Wage" ReadOnly="true" />
                    <asp:BoundField DataField="Deduction" HeaderText="Deduction" ReadOnly="true" />
                    <asp:BoundField DataField="Note" HeaderText="Deduction Note" ReadOnly="true" />
                  
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

