<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="height: 100%; width: 100%">
        <div style="text-align: center">
            <h2><strong>Change Password</strong></h2>
        </div>
        <br />
        <div style="width: 100%">
            <div style="float: left; width: 25%; text-align: right">
                User name:&nbsp;&nbsp;
            </div>
            <div style="float: left; width: 25%">
                <asp:TextBox ID="Email" runat="server"></asp:TextBox>*(Email)
            </div>
            <div style="float: left; width: 15%; text-align: right">Old Password:&nbsp;&nbsp;</div>
            <div style="float: left; width: 35%">

                <asp:TextBox ID="OldPassword" runat="server" TextMode="Password"></asp:TextBox>

            </div>
        </div>
        <br />
        <div style="width: 100%; margin-top: 20px">
            <div style="float: left; width: 25%; text-align: right">
                New Password:&nbsp;&nbsp;
            </div>
            <div style="float: left; width: 25%">

                <asp:TextBox ID="NewPassword" runat="server" TextMode="Password"></asp:TextBox>

            </div>
            <div style="float: left; width: 15%; text-align: right">Confirm Password:&nbsp;&nbsp;</div>
            <div style="float: left; width: 35%">

                <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>

            </div>

        <br />
        <br />
        <div style="float: left; width: 100%; text-align: center; margin-top: 30px">
            <asp:Button ID="Change" runat="server" Text="Change" OnClick="Change_Click" />
        </div>
    </div>
</asp:Content>

