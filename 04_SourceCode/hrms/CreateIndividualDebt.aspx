<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CreateIndividualDebt.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="height:100%;width:100%">
        <div style="text-align:center">
             <h2><strong>Add Individual Debt Record</strong></h2>
        </div>
        <br/>
        <br/>
        <div style="width:100%">
            <div style="float:left;width:25%;text-align:right">
                Forename:&nbsp;&nbsp;
            </div>
            <div style="float:left;width:25%">
                <asp:TextBox ID="Forename" runat="server"></asp:TextBox>
            </div>
            <div style="float:left;width:10%;text-align:right">Surname:&nbsp;&nbsp;</div>
            <div style="float:left;width:40%">
                <asp:TextBox ID="Surname" runat="server"></asp:TextBox>
            </div>           
        </div>
        <br/>
        <br/>
        <div style="width:100%">
            <div style="float:left;width:25%;text-align:right">
                Email:&nbsp;&nbsp;
            </div>
            <div style="float:left;width:25%">
                <asp:TextBox ID="Email" runat="server"></asp:TextBox>
            </div>
            <div style="float:left;width:10%;text-align:right">Date:&nbsp;&nbsp;</div>
            <div style="float:left;width:40%">
                <asp:TextBox ID="Date" runat="server"></asp:TextBox>
            </div>           
        </div>
        <br/>
        <br/>
        <div style="width:100%">
            <div style="float:left;width:25%;text-align:right">
                INV#:&nbsp;&nbsp;
            </div>
            <div style="float:left;width:25%">
                <asp:TextBox ID="INV" runat="server"></asp:TextBox>
            </div>
            <div style="float:left;width:10%;text-align:right">Company:&nbsp;&nbsp;</div>
            <div style="float:left;width:40%">
                <asp:TextBox ID="Company" runat="server"></asp:TextBox>
            </div>           
        </div>
        <br/>
        <br/>
        <div style="width:100%">
            <div style="float:left;width:25%;text-align:right">
                Item:&nbsp;&nbsp;
            </div>
            <div style="float:left;width:25%">
                <asp:TextBox ID="Item" runat="server"></asp:TextBox>
            </div>
            <div style="float:left;width:10%;text-align:right">Amount:&nbsp;&nbsp;</div>
            <div style="float:left;width:40%">
                <asp:TextBox ID="Amount" runat="server" TextMode="Number">0.00</asp:TextBox>
            </div>           
        </div>
        <br/>
        <br/>
        <div style="width:100%">
            <div style="float:left;width:25%;text-align:right">
                Deduction:&nbsp;&nbsp;
            </div>
            <div style="float:left;width:25%">
                <asp:TextBox ID="Deduction" runat="server" TextMode="Number">0.00</asp:TextBox>
            </div>
            <div style="float:left;width:10%;text-align:right">Description:&nbsp;&nbsp;</div>
            <div style="float:left;width:40%">
                <asp:TextBox ID="Description" runat="server"></asp:TextBox>
            </div>           
        </div>
        <br/>
        <br/>
        <div style="width:100%">
            <div style="float:left;width:25%;text-align:right">
                WINZ:&nbsp;&nbsp;
            </div>
            <div style="float:left;width:25%">
                <asp:TextBox ID="WINZ" runat="server" TextMode="Number">0.00</asp:TextBox>
            </div>
            <div style="float:left;width:10%;text-align:right">IRD:&nbsp;&nbsp;</div>
            <div style="float:left;width:40%">
                <asp:TextBox ID="IRD" runat="server" TextMode="Number">0.00</asp:TextBox>
            </div>           
        </div>
        <br/>
        <br/>
        <div style="float:left;width:100%">
            <div style="float:left;width:50%;text-align:center"><asp:CheckBox ID="InvoiceFlag" runat="server" Text="Invoice On Staff File" /></div>
            <div style="float:left;width:50%;text-align:left"><asp:CheckBox ID="ATPAFlag" runat="server" Text="ATPA Signed On Sttaff File " /></div>
         </div>
        <br/>
        <br/>
        <div style="float:left;width:100%;text-align:center">
        <asp:Button ID="Add" runat="server" Text="Add" OnClick="Add_Click" />
    </div>
    </div>
</asp:Content>

