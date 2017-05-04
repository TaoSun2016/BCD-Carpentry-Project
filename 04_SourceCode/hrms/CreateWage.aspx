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
                Paid Amount:&nbsp;&nbsp;
            </div>
            <div style="float: left; width: 25%">
                <asp:TextBox ID="Amount" runat="server" TextMode="Number"></asp:TextBox>
            </div>
            <div style="float: left; width: 10%; text-align: right">Travel:&nbsp;&nbsp;</div>
            <div style="float: left; width: 40%">
                <asp:TextBox ID="Travel" runat="server" TextMode="Number"></asp:TextBox>
            </div>
        </div>
        <br />
        <br />
        <div style="width: 100%">
            <div style="float: left; width: 25%; text-align: right">
                Deduction:&nbsp;&nbsp;
            </div>
            <div style="float: left; width: 25%">
                <asp:TextBox ID="Deduction" runat="server" TextMode="Number"></asp:TextBox>
            </div>
            <div style="float: left; width: 10%; text-align: right">GST:&nbsp;&nbsp;</div>
            <div style="float: left; width: 40%">
                <asp:TextBox ID="GST" runat="server" TextMode="Number"></asp:TextBox>
            </div>
        </div>
        <br />
        <br />
        <div style="width: 100%">
            <div style="float: left; width: 25%; text-align: right">
                WINZ:&nbsp;&nbsp;
            </div>
            <div style="float: left; width: 25%">
                <asp:TextBox ID="WINZ" runat="server" TextMode="Number"></asp:TextBox>
            </div>
            <div style="float: left; width: 10%; text-align: right">IRD:&nbsp;&nbsp;</div>
            <div style="float: left; width: 40%">
                <asp:TextBox ID="IRD" runat="server" TextMode="Number"></asp:TextBox>
            </div>
        </div>
        <br />
        <br />       

        <div style="float: left; width: 100%; text-align: center">
            <asp:Button ID="Add" runat="server" Text="Add" OnClick="Add_Click" />
        </div>

    </div>
</asp:Content>

