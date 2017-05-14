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
                <asp:TextBox ID="Forename" runat="server" MaxLength="50"></asp:TextBox>
            </div>
            <div style="float: left; width: 15%; text-align: right">Surname:&nbsp;&nbsp;</div>
            <div style="float: left; width: 35%">
                <asp:TextBox ID="Surname" runat="server" MaxLength="50"></asp:TextBox>
            </div>
        </div>
        <br />
        <br />
        <div style="width: 100%; margin-top: 20px">
            <div style="float: left; width: 25%; text-align: right">
                Email:&nbsp;&nbsp;
            </div>
            <div style="float: left; width: 25%">
                <asp:TextBox ID="Email" runat="server" MaxLength="100"></asp:TextBox>
            </div>
            <div style="float: left; width: 15%; text-align: right">Date:&nbsp;&nbsp;</div>
            <div style="float: left; width: 35%">
                <asp:TextBox ID="Date" runat="server" MaxLength="8"></asp:TextBox><asp:ImageButton ID="ImageButtonDate" runat="server" Height="22px" ImageAlign="Middle" ImageUrl="~/Images/Calendar-icon.png" OnClick="ImageButtonDate_Click" CausesValidation="False" />*</div>
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
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic" ErrorMessage="Please input date!" ForeColor="Red" ControlToValidate="Date"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Invalide date!YYYYMMDD" ControlToValidate="Date" Display="Dynamic" ForeColor="Red" ValidationExpression="^\d{4}\d{1,2}\d{1,2}$"></asp:RegularExpressionValidator>
                <asp:Calendar ID="CalendarDate" runat="server" Visible="false" OnSelectionChanged="CalendarDate_SelectionChanged"></asp:Calendar>
            </div>
        </div>
        <br />
          <div style="width: 100%; margin-top: 20px">
            <div style="float: left; width: 25%; text-align: right">
                Training Type:&nbsp;&nbsp;
            </div>
            <div style="float: left; width: 75%">
                <asp:DropDownList ID="TrainingType" runat="server">
                    <asp:ListItem Value="1">1. I OWN AND AM TRAINED IN THIS TOOL</asp:ListItem>
                    <asp:ListItem Value="2">2. I HAVE READ THIS INFORMATION BOOK AND UNDERSTAND THE USE AND CARE</asp:ListItem>
                    <asp:ListItem Value="3">3. FOREMAN TRAINED AND WITNESSED GOOD SAFE WORKING PRACTICES</asp:ListItem>
                </asp:DropDownList>*
            </div>
        </div>
        <br />
        <br />
        <div style="float: left; width: 100%; text-align: center; margin-top:30px">
            <asp:Button ID="Add" runat="server" Text="Add" OnClick="Add_Click" />
        </div>
    </div>
</asp:Content>

