<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MaintainCertification.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="height: 100%; width: 100%">
        <div style="text-align: center">
            <h2><strong>Maintain Certification Information</strong></h2>
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
            <div style="float: left; width: 10%; text-align: right">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
            <div style="float: left; width: 40%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
        </div>
        <br />
        <br />
        <div style="text-align:center">
            <asp:Button ID="Query" runat="server" Text="Query" OnClick="Query_Click" />
        </div>
        <br />
        <hr />
        <div style="width: 100%; margin-top: 20px">
            <div style="float: left; width: 25%; text-align: right">
                <asp:CheckBox ID="LBP" runat="server" Text="LBP" />
            </div>
            <div style="float: left; width: 25%">
                &nbsp;
            </div>
            <div style="float: left; width: 10%; text-align: right">Expiry:&nbsp;&nbsp;</div>
            <div style="float: left; width: 40%">
                <asp:TextBox ID="Expiry" runat="server"></asp:TextBox>
            </div>
        </div>
        <br />
        <br />
        <div style="width: 100%">
            <div style="float: left; width: 25%; text-align: right">
                BCITO#:&nbsp;&nbsp;
            </div>
            <div style="float: left; width: 25%">
                <asp:TextBox ID="BCITONumber" runat="server"></asp:TextBox>
            </div>
            <div style="float: left; width: 10%; text-align: right">NZQA#:&nbsp;&nbsp;</div>
            <div style="float: left; width: 40%">
                <asp:TextBox ID="NZQANumber" runat="server"></asp:TextBox>
            </div>
        </div>
        <br />
        <br />
        <div style="float: left; width: 100%">
            <div style="float: left; width: 20%; text-align: left">
                <asp:CheckBox ID="FirstAid" runat="server" Text="First Aid" />
            </div>
            <div style="float: left; width: 20%; text-align: left">
                <asp:CheckBox ID="FallArrest" runat="server" Text="Fall Arrest " />
            </div>
            <div style="float: left; width: 20%; text-align: left">
                <asp:CheckBox ID="ConfinedSpaces" runat="server" Text="Confined Spaces" />
            </div>
            <div style="float: left; width: 20%; text-align: left">
                <asp:CheckBox ID="Ramset" runat="server" Text="Ramset" />
            </div>
            <div style="float: left; width: 20%; text-align: left">
                <asp:CheckBox ID="HILTI" runat="server" Text="HILTI" />
            </div>
        </div>
        <div style="float: left; width: 100%">
            <div style="float: left; width: 20%; text-align: left">
                <asp:CheckBox ID="LowScaff" runat="server" Text="LowScaff" />
            </div>
            <div style="float: left; width: 20%; text-align: left">
                <asp:CheckBox ID="WTR" runat="server" Text="W,T,R" />
            </div>
            <div style="float: left; width: 20%; text-align: left">
                <asp:CheckBox ID="EWP" runat="server" Text="EWP" />
            </div>
            <div style="float: left; width: 20%; text-align: left">
                <asp:CheckBox ID="HIAB" runat="server" Text="HIAB" />
            </div>
            <div style="float: left; width: 20%; text-align: left">
                <asp:CheckBox ID="HT123" runat="server" Text="HT 1,2,3" />
            </div>
        </div>
        <div style="float: left; width: 100%">
            <div style="float: left; width: 20%; text-align: left">
                <asp:CheckBox ID="Dog" runat="server" Text="Dog" />
            </div>
            <div style="float: left; width: 20%; text-align: left">
                <asp:CheckBox ID="Crane" runat="server" Text="Crane" />
            </div>
            <div style="float: left; width: 20%; text-align: left">
                <asp:CheckBox ID="Chainsaw" runat="server" Text="Chainsaw" />
            </div>
            <div style="float: left; width: 20%; text-align: left">
                <asp:CheckBox ID="CopyFlag" runat="server" Text="Cert Copied" />
            </div>
            <div style="float: left; width: 20%; text-align: left">&nbsp;&nbsp;</div>
        </div>
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <div style="float: left; width: 100%; text-align: center">
            <asp:Button ID="Add" runat="server" Text="Add/Update" OnClick="Add_Click" />
        </div>
    </div>
</asp:Content>

