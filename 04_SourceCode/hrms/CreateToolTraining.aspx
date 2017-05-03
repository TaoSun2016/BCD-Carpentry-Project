<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CreateToolTraining.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="height: 100%; width: 100%">
        <div style="text-align: center">
            <h2><strong>Attendance Information</strong></h2>
        </div>
        <br />
        <div style="width: 100%">
            <div style="float: left; width: 25%; text-align: right">
                Forename:&nbsp;&nbsp;
            </div>
            <div style="float: left; width: 25%">
                <asp:TextBox ID="Forename" runat="server"></asp:TextBox>
            </div>
            <div style="float: left; width: 15%; text-align: right">Surname:&nbsp;&nbsp;</div>
            <div style="float: left; width: 35%">
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
            <div style="float: left; width: 15%; text-align: right">Date:&nbsp;&nbsp;</div>
            <div style="float: left; width: 35%">
                <asp:TextBox ID="Date" runat="server"></asp:TextBox></div>
        </div>
        <br />
                <div style="width: 100%; margin-top: 20px">
            <div style="float: left; width: 25%; text-align: right">
                Training Type:&nbsp;&nbsp;
            </div>
            <div style="float: left; width: 75%">
                <asp:DropDownList ID="TrainingType" runat="server">
                    <asp:ListItem Value="1">I OWN AND AM TRAINED IN THIS TOOL</asp:ListItem>
                    <asp:ListItem Value="2">I HAVE READ THIS INFORMATION BOOK AND UNDERSTAND THE USE AND CARE</asp:ListItem>
                    <asp:ListItem Value="3">FOREMAN TRAINED AND WITNESSED GOOD SAFE WORKING PRACTICES</asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>
        <br />
        <br />
        <div style="float: left; width: 100%; text-align: center; margin-top:30px">
            <asp:Button ID="Add" runat="server" Text="Add" OnClick="Add_Click" />
        </div>
    </div>
</asp:Content>

