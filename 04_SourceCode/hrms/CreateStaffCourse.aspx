<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CreateStaffCourse.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="height: 100%; width: 100%">
        <div style="text-align: center">
            <h2><strong>Add Staff Course Information</strong></h2>
        </div>
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
        <div style="width: 100%; margin-top: 20px">
            <div style="float: left; width: 25%; text-align: right">
                Email:&nbsp;&nbsp;
            </div>
            <div style="float: left; width: 25%">
                <asp:TextBox ID="Email" runat="server"></asp:TextBox>
            </div>
            <div style="float: left; width: 10%; text-align: right">Date:&nbsp;&nbsp;</div>
            <div style="float: left; width: 40%">
                <asp:TextBox ID="Date" runat="server" MaxLength="8"></asp:TextBox><asp:ImageButton ID="ImageButtonDate" runat="server" Height="22px" ImageAlign="Middle" ImageUrl="~/Images/Calendar-icon.png" CausesValidation="False" OnClick="ImageButtonDate_Click" />*
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
            <div style="float: left; width: 10%; text-align: right">&nbsp;&nbsp;</div>
            <div style="float: right; width: 40%">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please input date!" ControlToValidate="Date" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Invalide date!YYYYMMDD" ControlToValidate="Date" Display="Dynamic" ForeColor="Red" ValidationExpression="^\d{4}\d{1,2}\d{1,2}$"></asp:RegularExpressionValidator>
                <asp:Calendar ID="CalendarDate" runat="server" Visible="false" OnSelectionChanged="CalendarDate_SelectionChanged"></asp:Calendar>
            </div>
        </div>
        <div style="width: 100%">
            <div style="float: left; width: 25%; text-align: right">
                Course:&nbsp;&nbsp;
            </div>
            <div style="float: left; width: 25%">
                <asp:TextBox ID="Course" runat="server" MaxLength="60"></asp:TextBox>*
            </div>
            <div style="float: left; width: 10%; text-align: right">Company:&nbsp;&nbsp;</div>
            <div style="float: left; width: 40%">
                <asp:TextBox ID="Company" runat="server" MaxLength="60"></asp:TextBox>*
            </div>
        </div>
        <br />
        <div style="width: 100%">
                <div style="float: left; width: 25%; text-align: right">
                    &nbsp;&nbsp;
                </div>
                <div style="float: left; width: 25%">

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Course" Display="Dynamic" ErrorMessage="Please input course name!" ForeColor="Red"></asp:RequiredFieldValidator>

                </div>
                <div style="float: left; width: 10%; text-align: right">&nbsp;&nbsp;</div>
                <div style="float: right; width: 40%">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="Company" Display="Dynamic" ErrorMessage="Please input company name!" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            </div>
        <br />
        <br />
        <br />
        <div style="float: left; width: 100%">
            <div style="float: left; width: 20%; text-align: left">
                <asp:CheckBox ID="DebtEntered" runat="server" Text="Debt Entered" />
            </div>
            <div style="float: left; width: 20%; text-align: left">
                <asp:CheckBox ID="CertReceived" runat="server" Text="Cert Received" />
            </div>
            <div style="float: left; width: 20%; text-align: left">
                <asp:CheckBox ID="Copied" runat="server" Text="Copied" />
            </div>
            <div style="float: left; width: 20%; text-align: left">
                <asp:CheckBox ID="Scanned" runat="server" Text="Scanned" />
            </div>
            <div style="float: left; width: 20%; text-align: left">
                <asp:CheckBox ID="Presented" runat="server" Text="Presented" />
            </div>
        </div>        
        <br />
        <br />  
        <br />                 
            <div style="float:left;width:100%;text-align:center">
                <asp:Button ID="Add" runat="server" Text="ADD" OnClick="Add_Click"/>
            </div>        
    </div>
</asp:Content>

