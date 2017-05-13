<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CreateTimeSheet.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="height: 100%; width: 100%;overflow-y:scroll">
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
                <asp:TextBox ID="Forename" runat="server" MaxLength="50"></asp:TextBox>
            </div>
            <div style="float: left; width: 15%; text-align: right">Surname:&nbsp;&nbsp;</div>
            <div style="float: left; width: 35%">
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
            <div style="float: left; width: 15%; text-align: right">Week Ending:&nbsp;&nbsp;</div>
            <div style="float: left; width: 35%">
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
                <div style="float: left; width: 15%">
                    &nbsp;&nbsp;&nbsp;&nbsp;
                </div>
                <div style="float: right; width: 35%;text-align:left">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic" ErrorMessage="Please input week ending date!" ForeColor="Red" ControlToValidate="WeekEndingDate"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Invalide date!YYYYMMDD" ControlToValidate="WeekEndingDate" Display="Dynamic" ForeColor="Red" ValidationExpression="^\d{4}\d{1,2}\d{1,2}$"></asp:RegularExpressionValidator>
                    <asp:Calendar ID="CalendarWeekEndingDate" runat="server" Visible="false" OnSelectionChanged="CalendarWeekEndingDate_SelectionChanged"></asp:Calendar>
                </div>
            </div>
        <br />
        <div style="float:left;width: 100%">
            <div style="float: left; width: 25%; text-align: right">
                Main Contractor:&nbsp;&nbsp;
            </div>
            <div style="float: left; width: 25%">
                <asp:TextBox ID="MainContractor" runat="server" MaxLength="60"></asp:TextBox>*
            </div>
            <div style="float: left; width: 15%; text-align: right">Job Name:&nbsp;&nbsp;</div>
            <div style="float: left; width: 35%">
                <asp:TextBox ID="JobName" runat="server" MaxLength="60"></asp:TextBox>*
            </div>
        </div>
        <br />
            <div style="width: 100%">
                <div style="float: left; width: 25%; text-align: right">
                    &nbsp;&nbsp;
                </div>
                <div style="float: left; width: 25%">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="MainContractor" Display="Dynamic" ErrorMessage="Please input main contractor!" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <div style="float: left; width: 15%; text-align: right">&nbsp;&nbsp;</div>
                <div style="float: right; width: 35%">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="JobName" Display="Dynamic" ErrorMessage="Please input job name!" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            </div>
        <br />
        <div style="float:left;width: 100%">
            <div style="float: left; width: 25%; text-align: right">
                Date:&nbsp;&nbsp;
            </div>
            <div style="float: left; width: 25%">
                <asp:TextBox ID="Date" runat="server" MaxLength="8"></asp:TextBox><asp:ImageButton ID="ImageButtonDate" runat="server" Height="22px" ImageAlign="Middle" ImageUrl="~/Images/Calendar-icon.png" OnClick="ImageButtonDate_Click" CausesValidation="False" />*
            </div>
            <div style="float: left; width: 15%; text-align: right">Start:&nbsp;&nbsp;</div>
            <div style="float: left; width: 35%">
                <asp:TextBox ID="Start" runat="server" MaxLength="8"></asp:TextBox>*
            </div>
        </div>
        <br />
             <div style="float: left; width: 100%">
                <div style="float: left; width: 25%">
                    &nbsp;&nbsp;&nbsp;&nbsp;
                </div>
                 <div style="float: left; width: 25%">

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Display="Dynamic" ErrorMessage="Please input date!" ForeColor="Red" ControlToValidate="Date"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="Invalide date!YYYYMMDD" ControlToValidate="Date" Display="Dynamic" ForeColor="Red" ValidationExpression="^\d{4}\d{1,2}\d{1,2}$"></asp:RegularExpressionValidator>                    
                     <asp:Calendar ID="CalendarDate" runat="server" Visible="false" OnSelectionChanged="CalendarDate_SelectionChanged"></asp:Calendar>
                </div>
                <div style="float: left; width: 15%;text-align:left">
                    &nbsp;&nbsp;&nbsp;&nbsp;
                </div>
                <div style="float: right; width: 35%;text-align:left">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" Display="Dynamic" ErrorMessage="Please input start time!" ForeColor="Red" ControlToValidate="Start"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Format: HH:MM:SS" ControlToValidate="Start" ValidationExpression="[0-2][0-9]:[0-6][0-9]:[0-6][0-9]" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                </div>
            </div>
        <br />
        <div style="float:left;width: 100%">
            <div style="float: left; width: 25%; text-align: right">
                Finish:&nbsp;&nbsp;
            </div>
            <div style="float: left; width: 25%">
                <asp:TextBox ID="Finish" runat="server" MaxLength="8"></asp:TextBox>*
            </div>
            <div style="float: left; width: 15%; text-align: right">Hours:&nbsp;&nbsp;</div>
            <div style="float: left; width: 35%">
                <asp:TextBox ID="Hours" runat="server" TextMode="Number"></asp:TextBox>*
            </div>
        </div>
        <br />
             <div style="width: 100%">
                <div style="float: left; width: 25%; text-align: right">
                    &nbsp;&nbsp;
                </div>
                <div style="float: left; width: 25%">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="Finish" Display="Dynamic" ErrorMessage="Please input finish time!" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Format: HH:MM:SS" ControlToValidate="Finish" ValidationExpression="[0-2][0-9]:[0-6][0-9]:[0-6][0-9]" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                </div>
                <div style="float: left; width: 15%; text-align: right">&nbsp;&nbsp;</div>
                <div style="float: right; width: 35%">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="Hours" Display="Dynamic" ErrorMessage="Please input hours!" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            </div>
        <br />
        <div style="float:left;width: 100%">
            <div style="float: left; width: 25%; text-align: right">
                Description:&nbsp;&nbsp;
            </div>
            <div style="float: left; width: 75%">
                <asp:TextBox ID="Description" runat="server" MaxLength="255"></asp:TextBox>*
            </div>
        </div>
        <br />
            <div style="width: 100%">
                <div style="float: left; width: 25%; text-align: right">
                    &nbsp;&nbsp;
                </div>
                <div style="float: left; width: 25%">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="Finish" Display="Dynamic" ErrorMessage="Please input finish time!" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <div style="float: left; width: 50%; text-align: right">&nbsp;&nbsp;</div>
            </div>
        <br />

        <div style="float: left; width: 50%; text-align: center">
            <asp:Button ID="Add" runat="server" Text="Add" OnClick="Add_Click" />
        </div>
        <div style="float: left; width: 50%; text-align: center">
            <asp:Button ID="Reset" runat="server" Text="RESET" OnClick="Reset_Click" CausesValidation="False" />
        </div>
    </div>
</asp:Content>

