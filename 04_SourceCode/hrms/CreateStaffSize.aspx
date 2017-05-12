<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CreateStaffSize.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="height: 100%; width: 100%">
        <div style="text-align: center">
            <h2><strong>Add Staff Size Information</strong></h2>
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
        <div style="width: 100%; margin-top: 20px">
            <div style="float: left; width: 25%; text-align: right">
                Email:&nbsp;&nbsp;
            </div>
            <div style="float: left; width: 25%">
                <asp:TextBox ID="Email" runat="server" MaxLength="100"></asp:TextBox>
            </div>
            <div style="float: left; width: 15%; text-align: right">&nbsp;&nbsp;</div>
            <div style="float: left; width: 35%">
                &nbsp;&nbsp;
            </div>
        </div>
        <br />
        <br />
        <div style="width: 100%">
            <div style="float: left; width: 25%; text-align: right">
                Shirt:&nbsp;&nbsp;
            </div>
            <div style="float: left; width: 25%">
                <asp:DropDownList ID="Shirt" runat="server">
                    <asp:ListItem Value="S">S</asp:ListItem>
                    <asp:ListItem Value="M">M</asp:ListItem>
                    <asp:ListItem Value="L">L</asp:ListItem>
                    <asp:ListItem Value="XL">XL</asp:ListItem>
                    <asp:ListItem Value="2XL">2XL</asp:ListItem>
                    <asp:ListItem Value="3XL">3XL</asp:ListItem>
                    <asp:ListItem Value="4XL">4XL</asp:ListItem>
                    <asp:ListItem Value="5XL">5XL</asp:ListItem>
                </asp:DropDownList>*
            </div>
            <div style="float: left; width: 15%; text-align: right">Jersey:&nbsp;&nbsp;</div>
            <div style="float: left; width: 35%">
                <asp:DropDownList ID="Jersey" runat="server">
                    <asp:ListItem Value="S">S</asp:ListItem>
                    <asp:ListItem Value="M">M</asp:ListItem>
                    <asp:ListItem Value="L">L</asp:ListItem>
                    <asp:ListItem Value="XL">XL</asp:ListItem>
                    <asp:ListItem Value="2XL">2XL</asp:ListItem>
                    <asp:ListItem Value="3XL">3XL</asp:ListItem>
                    <asp:ListItem Value="4XL">4XL</asp:ListItem>
                    <asp:ListItem Value="5XL">5XL</asp:ListItem>
                </asp:DropDownList>*
            </div>
        </div>
        <br />
        <br />
        <div style="width: 100%">
            <div style="float: left; width: 25%; text-align: right">
                WW Top:&nbsp;&nbsp;
            </div>
            <div style="float: left; width: 25%">
                <asp:DropDownList ID="WWTop" runat="server">
                    <asp:ListItem Value="S">S</asp:ListItem>
                    <asp:ListItem Value="M">M</asp:ListItem>
                    <asp:ListItem Value="L">L</asp:ListItem>
                    <asp:ListItem Value="XL">XL</asp:ListItem>
                    <asp:ListItem Value="2XL">2XL</asp:ListItem>
                    <asp:ListItem Value="3XL">3XL</asp:ListItem>
                    <asp:ListItem Value="4XL">4XL</asp:ListItem>
                    <asp:ListItem Value="5XL">5XL</asp:ListItem>
                </asp:DropDownList>*
            </div>
            <div style="float: left; width: 15%; text-align: right">WW Pants:&nbsp;&nbsp;</div>
            <div style="float: left; width: 35%">
                <asp:DropDownList ID="WWPants" runat="server">
                    <asp:ListItem Value="S">S</asp:ListItem>
                    <asp:ListItem Value="M">M</asp:ListItem>
                    <asp:ListItem Value="L">L</asp:ListItem>
                    <asp:ListItem Value="XL">XL</asp:ListItem>
                    <asp:ListItem Value="2XL">2XL</asp:ListItem>
                    <asp:ListItem Value="3XL">3XL</asp:ListItem>
                    <asp:ListItem Value="4XL">4XL</asp:ListItem>
                    <asp:ListItem Value="5XL">5XL</asp:ListItem>
                </asp:DropDownList>*
            </div>
        </div>
        <br />
        <br />
        <div style="width: 100%">
            <div style="float: left; width: 25%; text-align: right">
                Pants:&nbsp;&nbsp;
            </div>
            <div style="float: left; width: 25%">
                <asp:TextBox ID="Pants" runat="server" MaxLength="20"></asp:TextBox>*
            </div>
            <div style="float: left; width: 15%; text-align: right">Shoe:&nbsp;&nbsp;</div>
            <div style="float: left; width: 35%">
                <asp:TextBox ID="Shoe" runat="server" MaxLength="20"></asp:TextBox>*
            </div>
        </div>
        <br />
        <div style="width: 100%">
                <div style="float: left; width: 25%; text-align: right">
                    &nbsp;&nbsp;
                </div>
                <div style="float: left; width: 25%">

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Pants" Display="Dynamic" ErrorMessage="Please input the size of pants!" ForeColor="Red"></asp:RequiredFieldValidator>

                </div>
                <div style="float: left; width: 15%; text-align: right">&nbsp;&nbsp;</div>
                <div style="float: right; width: 35%">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Shoe" Display="Dynamic" ErrorMessage="Please input the size of shoe!" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
        </div>
        <br />
        <br />

        <div style="float: left; width: 100%; text-align: center; margin-top: 30px">
            <asp:Button ID="Add" runat="server" Text="Add" OnClick="Add_Click" />
        </div>
    </div>
</asp:Content>

