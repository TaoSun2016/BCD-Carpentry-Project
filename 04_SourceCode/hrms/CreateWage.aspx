<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CreateWage.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="height: 100%; width: 100%">
        <div style="text-align: center">
            <h2><strong>Add Time Sheet</strong></h2>
        </div>
        <br />
        <br />
        <div style="float: left; width: 100%">
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
        <div style="float: left; width: 100%">
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
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalide email address!" ControlToValidate="Email" Display="Dynamic" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </div>
            <div style="float: left; width: 15%">
                &nbsp;&nbsp;&nbsp;&nbsp;
            </div>
            <div style="float: right; width: 35%; text-align: left">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic" ErrorMessage="Please input work ending date!" ForeColor="Red" ControlToValidate="WeekEndingDate"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Invalide date!YYYYMMDD" ControlToValidate="WeekEndingDate" Display="Dynamic" ForeColor="Red" ValidationExpression="^\d{4}\d{1,2}\d{1,2}$"></asp:RegularExpressionValidator>
                <asp:Calendar ID="CalendarWeekEndingDate" runat="server" Visible="false" OnSelectionChanged="CalendarWeekEndingDate_SelectionChanged"></asp:Calendar>
            </div>
        </div>
        <br />
        <div style="float: left; width: 100%">
            <div style="float: left; width: 25%; text-align: right">
                Paid Amount:&nbsp;&nbsp;
            </div>
            <div style="float: left; width: 25%">
                <asp:TextBox ID="Amount" runat="server" TextMode="Number">0.00</asp:TextBox>*
            </div>
            <div style="float: left; width: 10%; text-align: right">Travel:&nbsp;&nbsp;</div>
            <div style="float: left; width: 40%">
                <asp:TextBox ID="Travel" runat="server" TextMode="Number">0.00</asp:TextBox>*
            </div>
        </div>
        <br />
        <div style="float: left; width: 100%">
            <div style="float: left; width: 25%; text-align: right">
                &nbsp;&nbsp;
            </div>
            <div style="float: left; width: 25%">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Amount" Display="Dynamic" ErrorMessage="Please input paid amount!" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
            <div style="float: left; width: 10%; text-align: right">&nbsp;&nbsp;</div>
            <div style="float: right; width: 40%">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="Travel" Display="Dynamic" ErrorMessage="Please input travel amount!" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
        </div>
        <br />
        <div style="float: left; width: 100%">
            <div style="float: left; width: 25%; text-align: right">
                Deduction:&nbsp;&nbsp;
            </div>
            <div style="float: left; width: 25%">
                <asp:TextBox ID="Deduction" runat="server" TextMode="Number">0.00</asp:TextBox>*
            </div>
            <div style="float: left; width: 10%; text-align: right">GST:&nbsp;&nbsp;</div>
            <div style="float: left; width: 40%">
                <asp:TextBox ID="GST" runat="server" TextMode="Number">0.00</asp:TextBox>*
            </div>
        </div>
        <br />
        <div style="width: 100%">
            <div style="float: left; width: 25%; text-align: right">
                &nbsp;&nbsp;
            </div>
            <div style="float: left; width: 25%">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="Deduction" Display="Dynamic" ErrorMessage="Please input deduction amount!" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
            <div style="float: left; width: 10%; text-align: right">&nbsp;&nbsp;</div>
            <div style="float: right; width: 40%">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="GST" Display="Dynamic" ErrorMessage="Please input GST amount!" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
        </div>
        <br />
        <div style="float: left; width: 100%">
            <div style="float: left; width: 25%; text-align: right">
                WINZ:&nbsp;&nbsp;
            </div>
            <div style="float: left; width: 25%">
                <asp:TextBox ID="WINZ" runat="server" TextMode="Number">0.00</asp:TextBox>*
            </div>
            <div style="float: left; width: 10%; text-align: right">IRD:&nbsp;&nbsp;</div>
            <div style="float: left; width: 40%">
                <asp:TextBox ID="IRD" runat="server" TextMode="Number">0.00</asp:TextBox>*
            </div>
        </div>
        <br />
        <div style="width: 100%">
            <div style="float: left; width: 25%; text-align: right">
                &nbsp;&nbsp;
            </div>
            <div style="float: left; width: 25%">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="WINZ" Display="Dynamic" ErrorMessage="Please input WINZ amount!" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
            <div style="float: left; width: 10%; text-align: right">&nbsp;&nbsp;</div>
            <div style="float: right; width: 40%">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="IRD" Display="Dynamic" ErrorMessage="Please input IRD amount!" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
        </div>
        <br />

        <div style="float: left; width: 100%; text-align: center">
            <asp:Button ID="Add" runat="server" Text="Add" OnClick="Add_Click" />
        </div>

    </div>
</asp:Content>

