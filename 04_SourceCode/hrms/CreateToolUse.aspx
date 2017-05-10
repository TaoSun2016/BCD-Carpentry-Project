<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CreateToolUse.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="height: 100%; width: 100%">
        <div style="text-align: center">
            <h2><strong>Tool Issue/Return Register</strong></h2>
        </div>
        <br />
        <div style="width: 100%">
            <div style="float: left; width: 25%; text-align: right">
                Forename:&nbsp;&nbsp;
            </div>
            <div style="float: left; width: 25%">
                <asp:TextBox ID="Forename" runat="server" MaxLength="50"></asp:TextBox>*
            </div>
            <div style="float: left; width: 15%; text-align: right">Surname:&nbsp;&nbsp;</div>
            <div style="float: left; width: 35%">
                <asp:TextBox ID="Surname" runat="server" MaxLength="50"></asp:TextBox>*
            </div>
        </div>
        <br />
        <br />
        <div style="width: 100%; margin-top: 20px">
            <div style="float: left; width: 25%; text-align: right">
                Email:&nbsp;&nbsp;
            </div>
            <div style="float: left; width: 25%">
                <asp:TextBox ID="Email" runat="server" MaxLength="100"></asp:TextBox>*
            </div>
            <div style="float: left; width: 15%; text-align: right">Date:&nbsp;&nbsp;</div>
            <div style="float: left; width: 35%">
                <asp:TextBox ID="Date" runat="server" MaxLength="10"></asp:TextBox><asp:ImageButton ID="CalenderButton" runat="server" Height="22px" ImageAlign="Middle" ImageUrl="~/Images/Calendar-icon.png" OnClick="CalenderButton_Click" />*
            </div>
        </div>
        <br />
        <div style="float: left; width: 100%">
            <div style="float: left; width: 25%">
                &nbsp;&nbsp;&nbsp;&nbsp;
            </div>
            <div style="float: left; width: 25%">
                &nbsp;&nbsp;&nbsp;&nbsp;
            </div>
            <div style="float: left; width: 15%">
                &nbsp;&nbsp;&nbsp;&nbsp;
            </div>
            <div style="float: right; width: 35%">
                <asp:Calendar ID="Calendar" runat="server" Visible="false" OnSelectionChanged="Calendar_SelectionChanged"></asp:Calendar>
            </div>
        </div>
        <br />
        <br />
        <div style="width: 100%">
            <div style="float: left; width: 25%; text-align: right">
                Tool Name:&nbsp;&nbsp;
            </div>
            <div style="float: left; width: 25%">
                <asp:TextBox ID="ToolName" runat="server" MaxLength="60"></asp:TextBox>*
            </div>
            <div style="float: left; width: 15%; text-align: right">Tool Number:&nbsp;&nbsp;</div>
            <div style="float: left; width: 35%">
                <asp:TextBox ID="ToolNumber" runat="server" MaxLength="20"></asp:TextBox>*
            </div>
        </div>
        <br />
        <div style="width: 100%">
            <div style="float: left; width: 25%; text-align: right">
                &nbsp;&nbsp;
            </div>
            <div style="float: left; width: 25%">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ToolName" Display="Dynamic" ErrorMessage="Please input Tool Name!" ForeColor="Red" Enabled="False"></asp:RequiredFieldValidator>
            </div>
            <div style="float: left; width: 15%; text-align: right">&nbsp;&nbsp;</div>
            <div style="float: right; width: 35%">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ToolNumber" Display="Dynamic" ErrorMessage="Please input Tool Number!" ForeColor="Red" Enabled="False"></asp:RequiredFieldValidator>
            </div>
        </div>
        <br />
        <br />
        <div style="width: 100%">
            <div style="float: left; width: 25%; text-align: right">
                In/Out:&nbsp;&nbsp;
            </div>
            <div style="float: left; width: 25%">
                <asp:DropDownList ID="InOut" runat="server">
                    <asp:ListItem Value="I">In</asp:ListItem>
                    <asp:ListItem Value="O">Out</asp:ListItem>
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
        <div style="width: 100%; float: left">
            <div style="float: left; width: 25%; text-align: right">
                Comment:&nbsp;&nbsp;
            </div>
            <div style="float: left; width: 75%">
                <asp:TextBox ID="Comment" runat="server" MaxLength="120" Width="525px"></asp:TextBox>
            </div>

        </div>
        <br />
        <br />
        <div style="float: left; width: 100%; text-align: center; margin-top: 30px">
            <asp:Button ID="Add" runat="server" Text="Add" OnClick="Add_Click" />
        </div>
    </div>
</asp:Content>

