<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CreateAttendance.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="height:100%;width:100%">
        <div style="text-align:center">
             <h2><strong>Attendance Information</strong></h2>
        </div>
        <br/>
        <div style="width:100%">
            <div style="float:left;width:25%;text-align:right">
                Forename:&nbsp;&nbsp;
            </div>
            <div style="float:left;width:25%">
                <asp:TextBox ID="Forename" runat="server"></asp:TextBox>
            </div>
            <div style="float:left;width:10%;text-align:right">Surname:&nbsp;&nbsp;</div>
            <div style="float:left;width:40%">
                <asp:TextBox ID="Surname" runat="server"></asp:TextBox>
            </div>           
        </div>
        <br/>
        <div style="width:100%;margin-top:20px">
            <div style="float:left;width:25%;text-align:right">
                Email:&nbsp;&nbsp;
            </div>
            <div style="float:left;width:25%">
                <asp:TextBox ID="Email" runat="server"></asp:TextBox>
            </div>
            <div style="float:left;width:10%;text-align:right">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
            <div style="float:left;width:40%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>           
        </div>
        <br/>
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
        <div style="width:100%;float:left">
            <div style="float:left;width:25%;text-align:right">
                Year:&nbsp;&nbsp;
            </div>
            <div style="float:left;width:25%">
                
                <asp:DropDownList ID="DropDownListYear" runat="server">
                    <asp:ListItem>2017</asp:ListItem>
                    <asp:ListItem>2018</asp:ListItem>
                    <asp:ListItem>2019</asp:ListItem>
                    <asp:ListItem>2020</asp:ListItem>
                    <asp:ListItem>2021</asp:ListItem>
                </asp:DropDownList>
                
            </div>
            <div style="float:left;width:10%;text-align:right">Month:&nbsp;&nbsp;</div>
            <div style="float:left;width:40%">
                    <asp:DropDownList ID="DropDownListMonth" runat="server">
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
        <hr />
        </div>
        <div style="float:left;width:100%">
            <div style="float:left;width:20%;text-align:center"><asp:CheckBox ID="Day1" runat="server" Text="Day01" /></div>
            <div style="float:left;width:20%;text-align:center"><asp:CheckBox ID="Day2" runat="server" Text="Day02 " /></div>
            <div style="float:left;width:20%;text-align:center"><asp:CheckBox ID="Day3" runat="server" Text="Day03" /></div>
            <div style="float:left;width:20%;text-align:center"><asp:CheckBox ID="Day4" runat="server" Text="Day04" /></div>
            <div style="float:left;width:20%;text-align:center"><asp:CheckBox ID="Day5" runat="server" Text="Day05" /></div>
         </div>
         <div style="float:left;width:100%">
            <div style="float:left;width:20%;text-align:center"><asp:CheckBox ID="Day6" runat="server" Text="Day06" /></div>
            <div style="float:left;width:20%;text-align:center"><asp:CheckBox ID="Day7" runat="server" Text="Day07" /></div>
            <div style="float:left;width:20%;text-align:center"><asp:CheckBox ID="Day8" runat="server" Text="Day08" /></div>
            <div style="float:left;width:20%;text-align:center"><asp:CheckBox ID="Day9" runat="server" Text="Day09" /></div>
            <div style="float:left;width:20%;text-align:center"><asp:CheckBox ID="Day10" runat="server" Text="Day10" /></div>
         </div>  
         <div style="float:left;width:100%">
            <div style="float:left;width:20%;text-align:center"><asp:CheckBox ID="Day11" runat="server" Text="Day11" /></div>
            <div style="float:left;width:20%;text-align:center"><asp:CheckBox ID="Day12" runat="server" Text="Day12" /></div>
            <div style="float:left;width:20%;text-align:center"><asp:CheckBox ID="Day13" runat="server" Text="Day13" /></div>
            <div style="float:left;width:20%;text-align:center"><asp:CheckBox ID="Day14" runat="server" Text="Day14" /></div>
            <div style="float:left;width:20%;text-align:center"><asp:CheckBox ID="Day15" runat="server" Text="Day15" /></div>
         </div>
         <div style="float:left;width:100%">
            <div style="float:left;width:20%;text-align:center"><asp:CheckBox ID="Day16" runat="server" Text="Day16" /></div>
            <div style="float:left;width:20%;text-align:center"><asp:CheckBox ID="Day17" runat="server" Text="Day17" /></div>
            <div style="float:left;width:20%;text-align:center"><asp:CheckBox ID="Day18" runat="server" Text="Day18" /></div>
            <div style="float:left;width:20%;text-align:center"><asp:CheckBox ID="Day19" runat="server" Text="Day19" /></div>
            <div style="float:left;width:20%;text-align:center"><asp:CheckBox ID="Day20" runat="server" Text="Day20" /></div>
         </div> 
         <div style="float:left;width:100%">
            <div style="float:left;width:20%;text-align:center"><asp:CheckBox ID="Day21" runat="server" Text="Day21" /></div>
            <div style="float:left;width:20%;text-align:center"><asp:CheckBox ID="Day22" runat="server" Text="Day22" /></div>
            <div style="float:left;width:20%;text-align:center"><asp:CheckBox ID="Day23" runat="server" Text="Day23" /></div>
            <div style="float:left;width:20%;text-align:center"><asp:CheckBox ID="Day24" runat="server" Text="Day24" /></div>
            <div style="float:left;width:20%;text-align:center"><asp:CheckBox ID="Day25" runat="server" Text="Day25" /></div>
         </div> 
         <div style="float:left;width:100%">
            <div style="float:left;width:20%;text-align:center"><asp:CheckBox ID="Day26" runat="server" Text="Day26" /></div>
            <div style="float:left;width:20%;text-align:center"><asp:CheckBox ID="Day27" runat="server" Text="Day27" /></div>
            <div style="float:left;width:20%;text-align:center"><asp:CheckBox ID="Day28" runat="server" Text="Day28" /></div>
            <div style="float:left;width:20%;text-align:center"><asp:CheckBox ID="Day29" runat="server" Text="Day29" /></div>
            <div style="float:left;width:20%;text-align:center"><asp:CheckBox ID="Day30" runat="server" Text="Day30" /></div>
         </div> 
         <div style="float:left;width:100%">
            <div style="float:left;width:20%;text-align:center"><asp:CheckBox ID="Day31" runat="server" Text="Day31" /></div>
         </div> 
        <div style="float:left;width:100%;text-align:center">
        <asp:Button ID="Add" runat="server" Text="Add" OnClick="Add_Click" />
    </div>
    </div>
</asp:Content>

