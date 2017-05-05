<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CreateTax.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="height: 100%; width: 100%">
        <div style="text-align: center">
            <h2><strong>Add Time Sheet</strong></h2>
        </div>
        <br />
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
        <br />
        <div style="width: 100%">
            <div style="float: left; width: 25%; text-align: right">
                Email:&nbsp;&nbsp;
            </div>
            <div style="float: left; width: 25%">
                <asp:TextBox ID="Email" runat="server"></asp:TextBox>
            </div>
            <div style="float: left; width: 10%; text-align: right">Week Ending:&nbsp;&nbsp;</div>
            <div style="float: left; width: 40%">
                <asp:TextBox ID="WeekEndingDate" runat="server"></asp:TextBox>
            </div>
        </div>
        <br />
        <br />
        <div style="width: 100%">
            <div style="float: left; width: 25%; text-align: right">
                Category:&nbsp;&nbsp;
            </div>
            <div style="float: left; width: 25%">
                
                <asp:DropDownList ID="Category" runat="server" AutoPostBack="True" Width="128px" OnSelectedIndexChanged="Category_SelectedIndexChanged">
                    <asp:ListItem Value="1">Gross Wage</asp:ListItem>
                    <asp:ListItem Value="2">Tax</asp:ListItem>
                    <asp:ListItem Value="3">GST</asp:ListItem>
                    <asp:ListItem Value="4">Deduction</asp:ListItem>
                </asp:DropDownList>
                
            </div>
            <div style="float: left; width: 10%; text-align: right">Amount:&nbsp;&nbsp;</div>
            <div style="float: left; width: 40%">
                <asp:TextBox ID="Amount" runat="server" TextMode="Number"></asp:TextBox>
            </div>
        </div>
        <br />
        <br />
        <div id="NoteDiv" style="width: 100%">
            <div style="float: left; width: 25%; text-align: right">
                
                Note:&nbsp;&nbsp;
                
            </div>
            <div style="float: left; width: 75%">
                <asp:TextBox ID="Note" runat="server" ReadOnly="True"></asp:TextBox>
            </div>        
        </div>
        <br />
        <br />
        
    

        <div style="float: left; width: 100%; text-align: center">
            <asp:Button ID="Add" runat="server" Text="Add" OnClick="Add_Click" />
        </div>

    </div>
</asp:Content>

