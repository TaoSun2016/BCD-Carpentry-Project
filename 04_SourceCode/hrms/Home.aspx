<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style6 {
            color: #FF0000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        Welcome, &nbsp;<asp:Label ID="Forename" runat="server" ForeColor="Red"></asp:Label>&nbsp<asp:Label ID="Surname" runat="server" ForeColor="Red"></asp:Label>
        <span class="auto-style6">!</span></div>
</asp:Content>