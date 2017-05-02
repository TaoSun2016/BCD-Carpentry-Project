<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Attendance.aspx.cs" Inherits="Default2"  EnableEventValidation="false"%>

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
    <h2 class="auto-style6"><strong>Attendance</strong></h2>
    <div>
        Forname:<asp:TextBox ID="Q_Forname" runat="server"></asp:TextBox>
&nbsp;Surname:<asp:TextBox ID="Q_Surname" runat="server"></asp:TextBox>
        &nbsp;Email:<asp:TextBox ID="Q_Email" runat="server"></asp:TextBox>
        <br />
        <br />
        Year:<asp:DropDownList ID="Year" runat="server">
            <asp:ListItem Value="2017"></asp:ListItem>
            <asp:ListItem Value="2018"></asp:ListItem>
            <asp:ListItem Value="2019"></asp:ListItem>
        </asp:DropDownList>
    &nbsp;Month:<asp:DropDownList ID="Month" runat="server" >
            <asp:ListItem Value="1"></asp:ListItem>
            <asp:ListItem Value="2"></asp:ListItem>
            <asp:ListItem Value="3"></asp:ListItem>
            <asp:ListItem Value="4"></asp:ListItem>
            <asp:ListItem Value="5"></asp:ListItem>
            <asp:ListItem Value="6"></asp:ListItem>
            <asp:ListItem Value="7"></asp:ListItem>
            <asp:ListItem Value="8"></asp:ListItem>
            <asp:ListItem Value="9"></asp:ListItem>
            <asp:ListItem Value="10"></asp:ListItem>
            <asp:ListItem Value="11"></asp:ListItem>
            <asp:ListItem Value="12"></asp:ListItem>
         </asp:DropDownList>
    </div>
    <div style="overflow-y: scroll" class="auto-style7" id="Forname">     
        
       
        <asp:GridView ID="GridViewAttendance" runat="server" DataSourceID="SqlDataSourceAttendance">
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceAttendance" runat="server"></asp:SqlDataSource>
       
    </div>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
    <br />
    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="Export" runat="server" Text="Export to Excel" OnClick="Export_Click" />     
    </asp:Content>

