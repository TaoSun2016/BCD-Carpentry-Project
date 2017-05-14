<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CreateToolList.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="height: 100%; width: 100%">
        <div style="text-align: center">
            <h2><strong>Add Tool List</strong></h2>
        </div>
        <br />
        <div style="width: 100%">
            <div style="float: left; width: 25%; text-align: right">
                Forename:&nbsp;&nbsp;
            </div>
            <div style="float: left; width: 25%">
                <asp:TextBox ID="Forename" runat="server" MaxLength="50"></asp:TextBox>
            </div>
            <div style="float: left; width: 15%; text-align: right">Surname:&nbsp;&nbsp;</div>
            <div style="float: left; width: 35%">
                <asp:TextBox ID="Surname" runat="server" MaxLength="50"></asp:TextBox>
            </div>
        </div>
        <br />
        <br />
        <div style="width: 100%;float:left">
            <div style="float: left; width: 25%; text-align: right">
                Email:&nbsp;&nbsp;
            </div>
            <div style="float: left; width: 25%">
                <asp:TextBox ID="Email" runat="server" MaxLength="100"></asp:TextBox>
            </div>
            <div style="float: left; width: 15%; text-align: right">Tool Name:&nbsp;&nbsp;</div>
            <div style="float: left; width: 35%">
                <asp:TextBox ID="ToolName" runat="server" MaxLength="60"></asp:TextBox>*
            </div>
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
            <div style="float: right; width: 35%; text-align: left">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic" ErrorMessage="Please input Tool Name!" ForeColor="Red" ControlToValidate="ToolName"></asp:RequiredFieldValidator>
            </div>
        </div>
        <br />
        <div style="width: 100%">
            <div style="float: left; width: 25%; text-align: right">
                RRP:&nbsp;&nbsp;
            </div>
            <div style="float: left; width: 25%">
                <asp:TextBox ID="RRP" runat="server" TextMode="Number">0.00</asp:TextBox>
            </div>
            <div style="float: left; width: 15%; text-align: right">On Site:&nbsp;&nbsp;</div>
            <div style="float: left; width: 35%">
                <asp:DropDownList ID="OnSite" runat="server">
                    <asp:ListItem Value="Y">Y</asp:ListItem>
                    <asp:ListItem Value="N">N</asp:ListItem>
                </asp:DropDownList>*
            </div>
        </div>
        <br />
        <br />
        <div style="width: 100%">
            <div style="float: left; width: 25%; text-align: right">
                Need:&nbsp;&nbsp;
            </div>
            <div style="float: left; width: 25%">
                <asp:DropDownList ID="Need" runat="server">
                    <asp:ListItem Value="Y">Y</asp:ListItem>
                    <asp:ListItem Value="N">N</asp:ListItem>
                </asp:DropDownList>*
            </div>
            <div style="float: left; width: 15%; text-align: right">Competent:&nbsp;&nbsp;</div>
            <div style="float: left; width: 35%">
                <asp:DropDownList ID="Competent" runat="server">
                    <asp:ListItem Value="Y">Y</asp:ListItem>
                    <asp:ListItem Value="N">N</asp:ListItem>
                </asp:DropDownList>*
            </div>
        </div>
        <br />
        <br />
        <div style="width: 100%">
            <div style="float: left; width: 25%; text-align: right">
                Require Training:&nbsp;&nbsp;
            </div>
            <div style="float: left; width: 25%">
                <asp:DropDownList ID="RequireTraining" runat="server">
                    <asp:ListItem Value="Y">Y</asp:ListItem>
                    <asp:ListItem Value="N">N</asp:ListItem>
                </asp:DropDownList>*
            </div>
            <div style="float: left; width: 15%; text-align: right">&nbsp;&nbsp;</div>
            <div style="float: left; width: 35%">
                &nbsp;&nbsp;
            </div>
        </div>
        <br />
        <br />
        <br />

        <div style="float: left; width: 100%; text-align: center; margin-top: 30px">
            <asp:Button ID="Add" runat="server" Text="Add" OnClick="Add_Click" />
        </div>
    </div>
</asp:Content>

