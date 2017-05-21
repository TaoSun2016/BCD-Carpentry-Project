<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CreateTax.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="height: 100%; width: 100%">
        <div style="text-align: center">
            <h2><strong>Add Tax Information</strong></h2>
        </div>
        <br />
        <br />
        <div style="width: 100%">
            <div style="float: left; width: 25%; text-align: right">
                Forename:&nbsp;&nbsp;
            </div>
            <div style="float: left; width: 25%">
                <asp:TextBox ID="Forename" runat="server" MaxLength="50"></asp:TextBox>
            </div>
            <div style="float: left; width: 10%; text-align: right">Surname:&nbsp;&nbsp;</div>
            <div style="float: left; width: 40%">
                <asp:TextBox ID="Surname" runat="server" MaxLength="50"></asp:TextBox>
            </div>
        </div>
        <br />
        <br />
        <div style="width: 100%">
            <div style="float: left; width: 25%; text-align: right">
                Email:&nbsp;&nbsp;
            </div>
            <div style="float: left; width: 25%">
                <asp:TextBox ID="Email" runat="server" MaxLength="100"></asp:TextBox>
            </div>
            <div style="float: left; width: 10%; text-align: right">Week Ending:&nbsp;&nbsp;</div>
            <div style="float: left; width: 40%">
                <asp:TextBox ID="WeekEndingDate" runat="server" MaxLength="8"></asp:TextBox><asp:ImageButton ID="ImageButtonWeekEndingDate" runat="server" Height="22px" ImageAlign="Middle" ImageUrl="~/Images/Calendar-icon.png" OnClick="ImageButtonWeekEndingDate_Click" CausesValidation="False" />*
            </div>
        </div>
        <br />
        <div style="float: left; width: 100%">
                <div style="float: left; width: 25%">
                    &nbsp;&nbsp;&nbsp;&nbsp;
                </div>
                 <div style="float: left; width: 25%">
                     <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Invalide email address!" ControlToValidate="Email" Display="Dynamic" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </div>
                <div style="float: left; width: 10%">
                    &nbsp;&nbsp;&nbsp;&nbsp;
                </div>
                <div style="float: right; width: 40%;text-align:left">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic" ErrorMessage="Please input work ending date!" ForeColor="Red" ControlToValidate="WeekEndingDate"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Invalide date!YYYYMMDD" ControlToValidate="WeekEndingDate" Display="Dynamic" ForeColor="Red" ValidationExpression="^\d{4}\d{1,2}\d{1,2}$"></asp:RegularExpressionValidator>
                    <asp:Calendar ID="CalendarWeekEndingDate" runat="server" Visible="false" OnSelectionChanged="CalendarWeekEndingDate_SelectionChanged"></asp:Calendar>
                </div>
            </div>
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
                </asp:DropDownList>*
                
            </div>
            <div style="float: left; width: 10%; text-align: right">Amount:&nbsp;&nbsp;</div>
            <div style="float: left; width: 40%">
                <asp:TextBox ID="Amount" runat="server" TextMode="Number">0.00</asp:TextBox>*
            </div>
        </div>
        <br />
        <br />
        <div id="NoteDiv" style="width: 100%">
            <div style="float: left; width: 25%; text-align: right">
                
                Note:&nbsp;&nbsp;
                
            </div>
            <div style="float: left; width: 75%">
                <asp:TextBox ID="Note" runat="server" Width="450px" MaxLength="256"></asp:TextBox>
            </div>        
        </div>
        <br />
        <br />
        
    

        <div style="float: left; width: 100%; text-align: center">
            <asp:Button ID="Add" runat="server" Text="Add" OnClick="Add_Click" />
        </div>

    </div>
</asp:Content>

