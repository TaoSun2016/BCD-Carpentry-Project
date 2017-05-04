<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="QueryIndividualDebt.aspx.cs" Inherits="Default2"  EnableEventValidation="false"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style6 {
            text-align: center;
        }
        .auto-style7 {
            text-align: left;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h2 class="auto-style6"><strong>Individual Debt Register</strong></h2>
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
            <div style="float:left;width:10%;text-align:right">&nbsp;&nbsp;</div>
            <div style="float:left;width:40%">&nbsp;&nbsp</div>           
        </div>
        <br/>
        <br/>
    <div style="overflow-y: scroll;height:75%;width:100%;text-align:center" >     
        
        <asp:GridView ID="GridViewIndividualDebt" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="DebtID" DataSourceID="SqlDataSourceIndividualDebt" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField HeaderText="Update" ShowEditButton="true" />
                <asp:CommandField HeaderText="Delete" ShowDeleteButton="true" />

                <asp:BoundField DataField="DebtID" HeaderText="DebtID" Visible="false"/>
                <asp:BoundField DataField="Company" HeaderText="Company" SortExpression="Company" />

              

     
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceIndividualDebt" runat="server"
            ConnectionString="<%$ ConnectionStrings:HRMSDBConnectionString %>"
            SelectCommand="SELECT DebtID,Company from [INDIVIDUAL_DEBT]"
            DeleteCommand="DELETE FROM [INDIVIDUAL_DEBT] WHERE DebtID = @DebtID"
            UpdateCommand="UPDATE [INDIVIDUAL_DEBT] SET Date = @Date,INV# = @INV#,Company = @Company,Item = @Item,Amount = @Amount,DeductionAmount = @DeductionAmount,Description = @Description,InvoiceFlag = @InvoiceFlag,APTAFlag = @APTAFlag,WINZ = @WINZ,IRD = @IRD WHERE DebtID = @DebtID">

        </asp:SqlDataSource>     
    </div>
    <br />
    <br />
    <div style="text-align:center">
        <asp:Button ID="Export" runat="server" Text="Export to Excel" OnClick="Export_Click" />
    </div>
    </asp:Content>

