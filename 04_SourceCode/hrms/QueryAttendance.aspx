<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="QueryAttendance.aspx.cs" Inherits="Default2"  EnableEventValidation="false"%>

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
    <div style="height: 100%; width: 100%; overflow-y: scroll;">
        <h2 class="auto-style6"><strong>Attendance Information</strong></h2>
        <br />
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
        <div style="width: 100%; margin-top: 20px">
            <div style="float: left; width: 25%; text-align: right">
                Email:&nbsp;&nbsp;
            </div>
            <div style="float: left; width: 25%">
                <asp:TextBox ID="Email" runat="server"></asp:TextBox>
            </div>
            <div style="float: left; width: 10%; text-align: right">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
            <div style="float: left; width: 40%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
        </div>
        <br />
                <div style="float: left; width: 100%">
            <div style="float: left; width: 25%">
                &nbsp;&nbsp;&nbsp;&nbsp;
            </div>
            <div style="float: left; width: 25%">
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Invalide email address!" ControlToValidate="Email" Display="Dynamic" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </div>
            <div style="float: left; width: 50%">
                &nbsp;&nbsp;&nbsp;&nbsp;
            </div>
        </div>
        <br />
        <div style="width: 100%; float: left">
            <div style="float: left; width: 25%; text-align: right">
                Year:&nbsp;&nbsp;
            </div>
            <div style="float: left; width: 25%">
                <asp:DropDownList ID="DropDownListYear" runat="server">
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem>2017</asp:ListItem>
                    <asp:ListItem>2018</asp:ListItem>
                    <asp:ListItem>2019</asp:ListItem>
                    <asp:ListItem>2020</asp:ListItem>
                    <asp:ListItem>2021</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div style="float: left; width: 10%; text-align: right">Month:&nbsp;&nbsp;</div>
            <div style="float: left; width: 40%">
                <asp:DropDownList ID="DropDownListMonth" runat="server">
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem>1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                    <asp:ListItem>3</asp:ListItem>
                    <asp:ListItem>4</asp:ListItem>
                    <asp:ListItem>5</asp:ListItem>
                    <asp:ListItem>6</asp:ListItem>
                    <asp:ListItem>7</asp:ListItem>
                    <asp:ListItem>8</asp:ListItem>
                    <asp:ListItem>9</asp:ListItem>
                    <asp:ListItem>10</asp:ListItem>
                    <asp:ListItem>11</asp:ListItem>
                    <asp:ListItem>12</asp:ListItem>
                </asp:DropDownList>
            </div>
            <br />
            <br />
            <div style="text-align: center">
                <asp:Button ID="Query" runat="server" Text="Query" OnClick="Query_Click" />
            </div>
            <br />
            <hr />
        </div>


        <div style="" class="auto-style7">
            <asp:GridView ID="GridViewAttendance" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="EmployeeID,Year,Month" DataSourceID="SqlDataSourceAttendance" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField HeaderText="Edit" ShowEditButton="true" />
                    <asp:CommandField HeaderText="Delete" ShowDeleteButton="true" />
                    <asp:BoundField DataField="EmployeeID" HeaderText="EmployeeID" ReadOnly="True" SortExpression="EmployeeID" Visible="false" />
                    <asp:BoundField DataField="Forename" HeaderText="Forename" ReadOnly="True" SortExpression="Forename" />
                    <asp:BoundField DataField="Surname" HeaderText="Surname" ReadOnly="True" SortExpression="Surname" />
                    <asp:BoundField DataField="Year" HeaderText="Year" ReadOnly="True" SortExpression="Year" />
                    <asp:BoundField DataField="Month" HeaderText="Month" ReadOnly="True" SortExpression="Month" />
                    <asp:BoundField DataField="Day1" HeaderText="1" SortExpression="Day1" />
                    <asp:BoundField DataField="Day2" HeaderText="2" SortExpression="Day2" />
                    <asp:BoundField DataField="Day3" HeaderText="3" SortExpression="Day3" />
                    <asp:BoundField DataField="Day4" HeaderText="4" SortExpression="Day4" />
                    <asp:BoundField DataField="Day5" HeaderText="5" SortExpression="Day5" />
                    <asp:BoundField DataField="Day6" HeaderText="6" SortExpression="Day6" />
                    <asp:BoundField DataField="Day7" HeaderText="7" SortExpression="Day7" />
                    <asp:BoundField DataField="Day8" HeaderText="8" SortExpression="Day8" />
                    <asp:BoundField DataField="Day9" HeaderText="9" SortExpression="Day9" />
                    <asp:BoundField DataField="Day10" HeaderText="10" SortExpression="Day10" />
                    <asp:BoundField DataField="Day11" HeaderText="11" SortExpression="Day11" />
                    <asp:BoundField DataField="Day12" HeaderText="12" SortExpression="Day12" />
                    <asp:BoundField DataField="Day13" HeaderText="13" SortExpression="Day13" />
                    <asp:BoundField DataField="Day14" HeaderText="14" SortExpression="Day14" />
                    <asp:BoundField DataField="Day15" HeaderText="15" SortExpression="Day15" />
                    <asp:BoundField DataField="Day16" HeaderText="16" SortExpression="Day16" />
                    <asp:BoundField DataField="Day17" HeaderText="17" SortExpression="Day17" />
                    <asp:BoundField DataField="Day18" HeaderText="18" SortExpression="Day18" />
                    <asp:BoundField DataField="Day19" HeaderText="19" SortExpression="Day19" />
                    <asp:BoundField DataField="Day20" HeaderText="20" SortExpression="Day20" />
                    <asp:BoundField DataField="Day21" HeaderText="21" SortExpression="Day21" />
                    <asp:BoundField DataField="Day22" HeaderText="22" SortExpression="Day22" />
                    <asp:BoundField DataField="Day23" HeaderText="23" SortExpression="Day23" />
                    <asp:BoundField DataField="Day24" HeaderText="24" SortExpression="Day24" />
                    <asp:BoundField DataField="Day25" HeaderText="25" SortExpression="Day25" />
                    <asp:BoundField DataField="Day26" HeaderText="26" SortExpression="Day26" />
                    <asp:BoundField DataField="Day27" HeaderText="27" SortExpression="Day27" />
                    <asp:BoundField DataField="Day28" HeaderText="28" SortExpression="Day28" />
                    <asp:BoundField DataField="Day29" HeaderText="29" SortExpression="Day29" />
                    <asp:BoundField DataField="Day30" HeaderText="30" SortExpression="Day30" />
                    <asp:BoundField DataField="Day31" HeaderText="31" SortExpression="Day31" />
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
                SelectCommand="SELECT e.Forename, e.Surname, a.EmployeeID, a.Year, a.Month,
                                CASE a.Day1 WHEN 0 THEN null WHEN 1 THEN 'Y' END AS Day1,
                                CASE a.Day2 WHEN 0 THEN null WHEN 1 THEN 'Y' END AS Day2,
                                CASE a.Day3 WHEN 0 THEN null WHEN 1 THEN 'Y' END AS Day3,
                                CASE a.Day4 WHEN 0 THEN null WHEN 1 THEN 'Y' END AS Day4,
                                CASE a.Day5 WHEN 0 THEN null WHEN 1 THEN 'Y' END AS Day5,
                                CASE a.Day6 WHEN 0 THEN null WHEN 1 THEN 'Y' END AS Day6,
                                CASE a.Day7 WHEN 0 THEN null WHEN 1 THEN 'Y' END AS Day7,
                                CASE a.Day8 WHEN 0 THEN null WHEN 1 THEN 'Y' END AS Day8,
                                CASE a.Day9 WHEN 0 THEN null WHEN 1 THEN 'Y' END AS Day9,
                                CASE a.Day10 WHEN 0 THEN null WHEN 1 THEN 'Y' END AS Day10,
                                CASE a.Day11 WHEN 0 THEN null WHEN 1 THEN 'Y' END AS Day11,
                                CASE a.Day12 WHEN 0 THEN null WHEN 1 THEN 'Y' END AS Day12,
                                CASE a.Day13 WHEN 0 THEN null WHEN 1 THEN 'Y' END AS Day13,
                                CASE a.Day14 WHEN 0 THEN null WHEN 1 THEN 'Y' END AS Day14,
                                CASE a.Day15 WHEN 0 THEN null WHEN 1 THEN 'Y' END AS Day15,
                                CASE a.Day16 WHEN 0 THEN null WHEN 1 THEN 'Y' END AS Day16,
                                CASE a.Day17 WHEN 0 THEN null WHEN 1 THEN 'Y' END AS Day17,
                                CASE a.Day18 WHEN 0 THEN null WHEN 1 THEN 'Y' END AS Day18,
                                CASE a.Day19 WHEN 0 THEN null WHEN 1 THEN 'Y' END AS Day19,
                                CASE a.Day20 WHEN 0 THEN null WHEN 1 THEN 'Y' END AS Day20,
                                CASE a.Day21 WHEN 0 THEN null WHEN 1 THEN 'Y' END AS Day21,
                                CASE a.Day22 WHEN 0 THEN null WHEN 1 THEN 'Y' END AS Day22,
                                CASE a.Day23 WHEN 0 THEN null WHEN 1 THEN 'Y' END AS Day23,
                                CASE a.Day24 WHEN 0 THEN null WHEN 1 THEN 'Y' END AS Day24,
                                CASE a.Day25 WHEN 0 THEN null WHEN 1 THEN 'Y' END AS Day25,
                                CASE a.Day26 WHEN 0 THEN null WHEN 1 THEN 'Y' END AS Day26,
                                CASE a.Day27 WHEN 0 THEN null WHEN 1 THEN 'Y' END AS Day27,
                                CASE a.Day28 WHEN 0 THEN null WHEN 1 THEN 'Y' END AS Day28,
                                CASE a.Day29 WHEN 0 THEN null WHEN 1 THEN 'Y' END AS Day29,
                                CASE a.Day30 WHEN 0 THEN null WHEN 1 THEN 'Y' END AS Day30,
                                CASE a.Day31 WHEN 0 THEN null WHEN 1 THEN 'Y' END AS Day31              
                                FROM [EMPLOYEE] e, [ATTENDANCE] a WHERE e.EmployeeID = a.EmployeeID and e.EmployeeStatus = 'Y' order by e.Forename,e.Surname, a.Year desc, a.Month desc"
                DeleteCommand="DELETE FROM [ATTENDANCE] WHERE EmployeeID = @EmployeeID AND Year = @Year AND Month = @Month"
                UpdateCommand="UPDATE [ATTENDANCE] SET Day1 = CASE @Day1 WHEN 'Y' THEN 1 ELSE 0 END, 
                                                       Day2 = CASE @Day2 WHEN 'Y' THEN 1 ELSE 0 END,
                                                       Day3 = CASE @Day3 WHEN 'Y' THEN 1 ELSE 0 END,
                                                       Day4 = CASE @Day4 WHEN 'Y' THEN 1 ELSE 0 END,
                                                       Day5 = CASE @Day5 WHEN 'Y' THEN 1 ELSE 0 END,
                                                       Day6 = CASE @Day6 WHEN 'Y' THEN 1 ELSE 0 END,
                                                       Day7 = CASE @Day7 WHEN 'Y' THEN 1 ELSE 0 END,
                                                       Day8 = CASE @Day8 WHEN 'Y' THEN 1 ELSE 0 END,
                                                       Day9 = CASE @Day9 WHEN 'Y' THEN 1 ELSE 0 END,
                                                       Day10 = CASE @Day10 WHEN 'Y' THEN 1 ELSE 0 END,
                                                       Day11 = CASE @Day11 WHEN 'Y' THEN 1 ELSE 0 END,
                                                       Day12 = CASE @Day12 WHEN 'Y' THEN 1 ELSE 0 END,
                                                       Day13 = CASE @Day13 WHEN 'Y' THEN 1 ELSE 0 END,
                                                       Day14 = CASE @Day14 WHEN 'Y' THEN 1 ELSE 0 END,
                                                       Day15 = CASE @Day15 WHEN 'Y' THEN 1 ELSE 0 END,
                                                       Day16 = CASE @Day16 WHEN 'Y' THEN 1 ELSE 0 END,
                                                       Day17 = CASE @Day17 WHEN 'Y' THEN 1 ELSE 0 END,
                                                       Day18 = CASE @Day18 WHEN 'Y' THEN 1 ELSE 0 END,
                                                       Day19 = CASE @Day19 WHEN 'Y' THEN 1 ELSE 0 END,
                                                       Day20 = CASE @Day20 WHEN 'Y' THEN 1 ELSE 0 END,
                                                       Day21 = CASE @Day21 WHEN 'Y' THEN 1 ELSE 0 END,
                                                       Day22 = CASE @Day22 WHEN 'Y' THEN 1 ELSE 0 END,
                                                       Day23 = CASE @Day23 WHEN 'Y' THEN 1 ELSE 0 END,
                                                       Day24 = CASE @Day24 WHEN 'Y' THEN 1 ELSE 0 END,
                                                       Day25 = CASE @Day25 WHEN 'Y' THEN 1 ELSE 0 END,
                                                       Day26 = CASE @Day26 WHEN 'Y' THEN 1 ELSE 0 END,
                                                       Day27 = CASE @Day27 WHEN 'Y' THEN 1 ELSE 0 END,
                                                       Day28 = CASE @Day28 WHEN 'Y' THEN 1 ELSE 0 END,
                                                       Day29 = CASE @Day29 WHEN 'Y' THEN 1 ELSE 0 END,
                                                       Day30 = CASE @Day30 WHEN 'Y' THEN 1 ELSE 0 END,
                                                       Day31 = CASE @Day31 WHEN 'Y' THEN 1 ELSE 0 END                
                               WHERE EmployeeID = @EmployeeID AND Year = @Year AND Month = @Month"></asp:SqlDataSource>
        </div>
        <br />
        <br />
        <div style="text-align: center">
            <asp:Button ID="Export" runat="server" Text="Export to Excel" OnClick="Export_Click" />
        </div>
    </div>
</asp:Content>

