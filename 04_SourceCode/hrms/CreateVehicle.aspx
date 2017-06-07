<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CreateVehicle.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="height: 100%; width: 100%">
        <div style="text-align: center">
            <h2><strong>Vehicle Information</strong></h2>
        </div>
        <br />
        <div style="width: 100%;float:left"">
            <div style="float: left; width: 25%; text-align: right">
                Register Number:&nbsp;&nbsp;
            </div>
            <div style="float: left; width: 25%">
                <asp:TextBox ID="RegisterNumber" runat="server" MaxLength="10"></asp:TextBox>*
            </div>
            <div style="float: left; width: 15%; text-align: right">WOF Due Date:&nbsp;&nbsp;</div>
            <div style="float: left; width: 35%">
                <asp:TextBox ID="WOFDueDate" runat="server" MaxLength="8"></asp:TextBox><asp:ImageButton ID="ImageButtonWOFDueDate" runat="server" Height="22px" ImageAlign="Middle" ImageUrl="~/Images/Calendar-icon.png" OnClick="ImageButtonWOFDueDate_Click" CausesValidation="False" />*
            </div>
        </div>
        <br />
         <div style="float: left; width: 100%">
            <div style="float: left; width: 25%">
                &nbsp;&nbsp;&nbsp;&nbsp;
            </div>
            <div style="float: left; width: 25%">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic" ErrorMessage="Please input Register Number!" ForeColor="Red" ControlToValidate="RegisterNumber"></asp:RequiredFieldValidator>
            </div>
            <div style="float: left; width: 15%">
                &nbsp;&nbsp;&nbsp;&nbsp;
            </div>
            <div style="float: right; width: 35%; text-align: left">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic" ErrorMessage="Please input WOF Due Date!" ForeColor="Red" ControlToValidate="WOFDueDate"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalide date!YYYYMMDD" ControlToValidate="WOFDueDate" Display="Dynamic" ForeColor="Red" ValidationExpression="^\d{4}\d{1,2}\d{1,2}$"></asp:RegularExpressionValidator>
                <asp:Calendar ID="CalendarWOFDueDate" runat="server" Visible="false" OnSelectionChanged="CalendarWOFDueDate_SelectionChanged"></asp:Calendar>
            </div>
        </div>
        <br />
        <div style="width: 100%;float:left">
            <div style="float: left; width: 25%; text-align: right">
                Service Due:&nbsp;&nbsp;
            </div>
            <div style="float: left; width: 25%">
                <asp:TextBox ID="ServiceDue" runat="server" TextMode="Number"></asp:TextBox>*
            </div>
            <div style="float: left; width: 15%; text-align: right">REGO Due Date:&nbsp;&nbsp;</div>
            <div style="float: left; width: 35%">
                <asp:TextBox ID="REGODueDate" runat="server" MaxLength="8"></asp:TextBox><asp:ImageButton ID="ImageButtonREGODueDate" runat="server" Height="22px" ImageAlign="Middle" ImageUrl="~/Images/Calendar-icon.png" OnClick="ImageButtonREGODueDate_Click" CausesValidation="False" />*</div>
        </div>
        <br />
        <div style="float: left; width: 100%">
            <div style="float: left; width: 25%">
                &nbsp;&nbsp;&nbsp;&nbsp;
            </div>
            <div style="float: left; width: 25%">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Display="Dynamic" ErrorMessage="Please input Service Due!" ForeColor="Red" ControlToValidate="ServiceDue"></asp:RequiredFieldValidator>
            </div>
            <div style="float: left; width: 15%">
                &nbsp;&nbsp;&nbsp;&nbsp;
            </div>
            <div style="float: right; width: 35%; text-align: left">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Display="Dynamic" ErrorMessage="Please input REGO Due Date!" ForeColor="Red" ControlToValidate="REGODueDate"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Invalide date!YYYYMMDD" ControlToValidate="REGODueDate" Display="Dynamic" ForeColor="Red" ValidationExpression="^\d{4}\d{1,2}\d{1,2}$"></asp:RegularExpressionValidator>
                <asp:Calendar ID="CalendarREGODueDate" runat="server" Visible="false" OnSelectionChanged="CalendarREGODueDate_SelectionChanged"></asp:Calendar>
            </div>
        </div>
        <br />
        <div style="width: 100%;float:left">
            <div style="float: left; width: 25%; text-align: right">
                Fuel Card Number:&nbsp;&nbsp;
            </div>
            <div style="float: left; width: 25%">
                <asp:TextBox ID="FuelCardNumber" runat="server" MaxLength="30"></asp:TextBox>
            </div>
            <div style="float: left; width: 15%; text-align: right">GPS Serial Number:&nbsp;&nbsp;</div>
            <div style="float: left; width: 35%">
                <asp:TextBox ID="GPSSerialNumber" runat="server" MaxLength="60"></asp:TextBox></div>
        </div>
        <br />
        <br />
        <br />
        <div style="float: left;width: 100%">
            <div style="float: left; width: 25%; text-align: right">
                SIM Card Number:&nbsp;&nbsp;
            </div>
            <div style="float: left; width: 25%">
                <asp:TextBox ID="SIMCardNumber" runat="server" MaxLength="60"></asp:TextBox>
            </div>
            <div style="float: left; width: 15%; text-align: right">&nbsp;&nbsp;&nbsp;&nbsp;</div>
            <div style="float: left; width: 35%">&nbsp;&nbsp;&nbsp;&nbsp;</div>
        </div>
        <br />
        <br />
        <hr />
        <div style="float: left; width: 100%">
            <div style="float: left; width: 25%; text-align: center">
                <asp:CheckBox ID="SaleAgreement" runat="server" Text="Sale Agreement" /></div>
            <div style="float: left; width: 25%; text-align: center">
                <asp:CheckBox ID="OwnershipChanged" runat="server" Text="Ownership Changed " /></div>
            <div style="float: left; width: 25%; text-align: center">
                <asp:CheckBox ID="Insured" runat="server" Text="Insured" /></div>
            <div style="float: left; width: 25%; text-align: center">
                <asp:CheckBox ID="GPSInstalled" runat="server" Text="GPS Installed" /></div>           
        </div>
        <br />
        <br />
        <div style="float: left; width: 100%; text-align: center">
            <asp:Button ID="Add" runat="server" Text="Add" OnClick="Add_Click" />
        </div>
    </div>
</asp:Content>

