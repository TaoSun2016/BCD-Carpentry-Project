﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Attendance.aspx.cs" Inherits="Default2"  EnableEventValidation="false"%>

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
    <h2 class="auto-style6"><strong>Attendance Information</strong></h2>
    <div style="overflow-y: scroll;height:75%" class="auto-style7" >     
        
        <asp:GridView ID="GridViewAttendance" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="EmployeeID,Year,Month" DataSourceID="SqlDataSourceAttendance" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField HeaderText="Edit" ShowEditButton="true" />
                <asp:CommandField HeaderText="Delete" ShowDeleteButton="true" />
                <asp:BoundField DataField="EmployeeID" HeaderText="EmployeeID" ReadOnly="True" SortExpression="EmployeeID" Visible="false"/>
                <asp:BoundField DataField="Year" HeaderText="Year" ReadOnly="True" SortExpression="Year" />
                <asp:BoundField DataField="Month" HeaderText="Month" ReadOnly="True" SortExpression="Month" />
                <asp:BoundField DataField="Day1" HeaderText="Day1" SortExpression="Day1" />
                <asp:BoundField DataField="Day2" HeaderText="Day2" SortExpression="Day2" />
                <asp:BoundField DataField="Day3" HeaderText="Day3" SortExpression="Day3" />
                <asp:BoundField DataField="Day4" HeaderText="Day4" SortExpression="Day4" />
                <asp:BoundField DataField="Day5" HeaderText="Day5" SortExpression="Day5" />
                <asp:BoundField DataField="Day6" HeaderText="Day6" SortExpression="Day6" />
                <asp:BoundField DataField="Day7" HeaderText="Day7" SortExpression="Day7" />
                <asp:BoundField DataField="Day8" HeaderText="Day8" SortExpression="Day8" />
                <asp:BoundField DataField="Day9" HeaderText="Day9" SortExpression="Day9" />
                <asp:BoundField DataField="Day10" HeaderText="Day10" SortExpression="Day10" />
                <asp:BoundField DataField="Day11" HeaderText="Day11" SortExpression="Day11" />
                <asp:BoundField DataField="Day12" HeaderText="Day12" SortExpression="Day12" />
                <asp:BoundField DataField="Day13" HeaderText="Day13" SortExpression="Day13" />
                <asp:BoundField DataField="Day14" HeaderText="Day14" SortExpression="Day14" />
                <asp:BoundField DataField="Day15" HeaderText="Day15" SortExpression="Day15" />
                <asp:BoundField DataField="Day16" HeaderText="Day16" SortExpression="Day16" />
                <asp:BoundField DataField="Day17" HeaderText="Day17" SortExpression="Day17" />
                <asp:BoundField DataField="Day18" HeaderText="Day18" SortExpression="Day18" />
                <asp:BoundField DataField="Day19" HeaderText="Day19" SortExpression="Day19" />
                <asp:BoundField DataField="Day20" HeaderText="Day20" SortExpression="Day20" />
                <asp:BoundField DataField="Day21" HeaderText="Day21" SortExpression="Day21" />
                <asp:BoundField DataField="Day22" HeaderText="Day22" SortExpression="Day22" />
                <asp:BoundField DataField="Day23" HeaderText="Day23" SortExpression="Day23" />
                <asp:BoundField DataField="Day24" HeaderText="Day24" SortExpression="Day24" />
                <asp:BoundField DataField="Day25" HeaderText="Day25" SortExpression="Day25" />
                <asp:BoundField DataField="Day26" HeaderText="Day26" SortExpression="Day26" />
                <asp:BoundField DataField="Day27" HeaderText="Day27" SortExpression="Day27" />
                <asp:BoundField DataField="Day28" HeaderText="Day28" SortExpression="Day28" />
                <asp:BoundField DataField="Day29" HeaderText="Day29" SortExpression="Day29" />
                <asp:BoundField DataField="Day30" HeaderText="Day30" SortExpression="Day30" />
                <asp:BoundField DataField="Day31" HeaderText="Day31" SortExpression="Day31" />
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
        <asp:SqlDataSource ID="SqlDataSourceAttendance" runat="server"
            ConnectionString="<%$ ConnectionStrings:HRMSDBConnectionString %>"
            SelectCommand="SELECT e.Forname,e.Surname,a.* FROM [EMPLOYEE] e, [ATTENDANCE] a WHERE e.EmployeeID = a.EmployeeID and e.EmployeeStatus = 'Y' order by a.Year desc, a.Month desc, e.Forname"
            DeleteCommand="DELETE FROM [ATTENDANCE] WHERE EmployeeID = @EmployeeID AND Year = @Year AND Month = @Month"
            UpdateCommand="UPDATE [ATTENDANCE] SET Day1 = @Day1, Day2 = @Day2, Day3 = @Day3
                                                  ,Day4 = @Day4, Day5 = @Day5, Day6 = @Day6
                                                  ,Day7 = @Day7, Day8 = @Day8, Day9 = @Day9
                                                  ,Day10 = @Day10, Day11 = @Day11, Day12 = @Day12
                                                  ,Day13 = @Day13, Day14 = @Day14, Day15 = @Day15
                                                  ,Day16 = @Day16, Day17 = @Day17, Day18 = @Day18
                                                  ,Day19 = @Day19, Day20 = @Day20, Day21 = @Day21
                                                  ,Day22 = @Day22, Day23 = @Day23, Day24 = @Day24
                                                  ,Day25 = @Day25, Day26 = @Day26, Day27 = @Day27
                                                  ,Day28 = @Day28, Day29 = @Day29, Day30 = @Day30, Day31 = @Day31 WHERE EmployeeID = @EmployeeID AND Year = @Year AND Month = @Month">
        </asp:SqlDataSource>     
    </div>
    <br />
    <br />
    <div style="text-align:center">
        <asp:Button ID="Export" runat="server" Text="Export to Excel" OnClick="Export_Click" />
    </div>
    </asp:Content>

