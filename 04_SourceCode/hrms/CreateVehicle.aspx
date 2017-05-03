<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CreateVehicle.aspx.cs" Inherits="Default2" %>

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
                Register Number:&nbsp;&nbsp;
            </div>
            <div style="float: left; width: 25%">
                <asp:TextBox ID="RegisterNumber" runat="server"></asp:TextBox>*
            </div>
            <div style="float: left; width: 15%; text-align: right">WOF Due Date:&nbsp;&nbsp;</div>
            <div style="float: left; width: 35%">
                <asp:TextBox ID="WOFDueDate" runat="server"></asp:TextBox>*
            </div>
        </div>
        <br />
        <div style="width: 100%; margin-top: 20px">
            <div style="float: left; width: 25%; text-align: right">
                Service Due:&nbsp;&nbsp;
            </div>
            <div style="float: left; width: 25%">
                <asp:TextBox ID="ServiceDue" runat="server"></asp:TextBox>*
            </div>
            <div style="float: left; width: 15%; text-align: right">REGO Due Date:&nbsp;&nbsp;</div>
            <div style="float: left; width: 35%">
                <asp:TextBox ID="REGODueDate" runat="server"></asp:TextBox>*</div>
        </div>
        <br />
        <div style="width: 100%; margin-top: 20px">
            <div style="float: left; width: 25%; text-align: right">
                Fuel Card Number:&nbsp;&nbsp;
            </div>
            <div style="float: left; width: 25%">
                <asp:TextBox ID="FuelCardNumber" runat="server"></asp:TextBox>
            </div>
            <div style="float: left; width: 15%; text-align: right">GPS Serial Number:&nbsp;&nbsp;</div>
            <div style="float: left; width: 35%">
                <asp:TextBox ID="GPSSerialNumber" runat="server"></asp:TextBox></div>
        </div>
        <br />
        <div style="width: 100%; margin-top: 20px">
            <div style="float: left; width: 25%; text-align: right">
                SIM Card Number:&nbsp;&nbsp;
            </div>
            <div style="float: left; width: 25%">
                <asp:TextBox ID="SIMCardNumber" runat="server"></asp:TextBox>
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
        <div style="float: left; width: 100%; text-align: center; margin-top:30px">
            <asp:Button ID="Add" runat="server" Text="Add" OnClick="Add_Click" />
        </div>
    </div>
</asp:Content>

