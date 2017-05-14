<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="QueryToolList.aspx.cs" Inherits="Default2"  EnableEventValidation="false"%>

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
    <div style="height: 100%;overflow-y: scroll;">
        <h2 class="auto-style6"><strong>Tool List Information</strong></h2>
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
            <div style="float: left; width: 10%; text-align: right">&nbsp;&nbsp;</div>
            <div style="float: left; width: 40%">&nbsp;&nbsp</div>
        </div>
        <br />
        <div style="float: left; width: 100%">
            <div style="float: left; width: 25%">
                &nbsp;&nbsp;&nbsp;&nbsp;
            </div>
            <div style="float: left; width: 25%">
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalide email address!" ControlToValidate="Email" Display="Dynamic" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </div>
            <div style="float: left; width: 50%">
                &nbsp;&nbsp;&nbsp;&nbsp;
            </div>
        </div>
        <br />

        <br />

        <div style="text-align: center">
        <asp:Button ID="Query" runat="server" Text="Query" OnClick="Query_Click" />
        </div>
        <br />
        <hr />

        <div style=" width: 100%; text-align: center">

            <asp:GridView ID="GridViewToolList" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="EmployeeID,ToolName" DataSourceID="SqlDataSourceToolList" ForeColor="#333333" GridLines="None" Visible ="false">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField HeaderText="Update" ShowEditButton="true" />
                    <asp:CommandField HeaderText="Delete" ShowDeleteButton="true" />
                    <asp:BoundField DataField="EmployeeID" HeaderText="EmployeeID" Visible="false" />
                    <asp:BoundField DataField="Forename" HeaderText="FORENAME" ReadOnly="true" SortExpression="Forename"/>
                    <asp:BoundField DataField="Surname" HeaderText="SURNAME" ReadOnly="true" SortExpression="Surname"/>
                    <asp:BoundField DataField="Position" HeaderText="POSITION" ReadOnly="true" SortExpression="Position"/>
                    <asp:BoundField DataField="ToolName" HeaderText="TOOL NAME" ReadOnly="true" SortExpression="ToolName"/>
                    <asp:BoundField DataField="RRP" HeaderText="RRP" DataFormatString="{0:N2}" SortExpression="RRP"/>
                    <asp:BoundField DataField="OnSite" HeaderText="ON SITE" SortExpression="OnSite"/>
                    <asp:BoundField DataField="Need" HeaderText="NEED" SortExpression="Need"/>
                    <asp:BoundField DataField="Competent" HeaderText="COMPETENT" SortExpression="Competent"/>
                    <asp:BoundField DataField="RequireTraining" HeaderText="REQUIRE TRAINING" SortExpression="RequireTraining"/>
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
            <asp:SqlDataSource ID="SqlDataSourceToolList" runat="server"
                ConnectionString="<%$ ConnectionStrings:HRMSDBConnectionString %>"
                SelectCommand="SELECT e.Forename, e.Surname, e.Position, t.* FROM [EMPLOYEE] e,[TOOL_LIST] t WHERE e.EmployeeID = t.EmployeeID and e.EmployeeStatus = 'Y' order by e.Forename,e.Surname,t.ToolName"
                DeleteCommand="DELETE FROM [TOOL_LIST] WHERE EmployeeID = @EmployeeID and ToolName = @ToolName"
                UpdateCommand="UPDATE [TOOL_LIST] SET ToolName = @ToolName,RRP=@RRP,OnSite=@OnSite,Need=@Need,Competent=@Competent,RequireTraining=@RequireTraining  WHERE EmployeeID = @EmployeeID and ToolName = @ToolName"></asp:SqlDataSource>
        </div>
        <br />
        <br />
        <div style="text-align: center">
            <asp:Button ID="Export" runat="server" Text="Export to Excel" OnClick="Export_Click" visible="false"/>
        </div>
    </div>
</asp:Content>

