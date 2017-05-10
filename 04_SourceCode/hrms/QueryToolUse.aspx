<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="QueryToolUse.aspx.cs" Inherits="Default2"  EnableEventValidation="false"%>

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
        <h2 class="auto-style6"><strong>Tool Issue/Return Register</strong></h2>
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
        <br />
        <div style="width: 100%">
            <div style="float: left; width: 25%; text-align: right">
                Begin Date:&nbsp;&nbsp;
            </div>
            <div style="float: left; width: 25%">
                <asp:TextBox ID="BeginDate" runat="server"></asp:TextBox><asp:Button ID="CalendarButtonBeginDate" runat="server" Height="22px" Width="16px" OnClick="CalendarButtonBeginDate_Click" />
            </div>
            <div style="float: left; width: 10%; text-align: right">End Date:&nbsp;&nbsp;</div>
            <div style="float: left; width: 40%">
                <asp:TextBox ID="EndDate" runat="server"></asp:TextBox><asp:Button ID="CalendarButtonEndDate" runat="server" Height="22px" Width="16px" OnClick="CalendarButtonEndDate_Click" />
            </div>
        </div>
        <br />


     <div style="float: left; width: 100%">
        <div style="float: left; width: 25%">
            &nbsp;&nbsp;&nbsp;&nbsp;
        </div>
        <div style="float: left; width: 30%">
            <asp:Calendar ID="CalendarBeginDate" runat="server" Visible="false" OnSelectionChanged="CalendarBeginDate_SelectionChanged"></asp:Calendar>
        </div>
        <div style="float: left; width: 5%">
            &nbsp;&nbsp;&nbsp;&nbsp;
        </div>
        <div style="float: right; width: 40%">
            <asp:Calendar ID="CalendarEndDate" runat="server" Visible="false" OnSelectionChanged="CalendarEndDate_SelectionChanged"></asp:Calendar>
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

            <asp:GridView ID="GridViewToolUse" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="RegisterID" DataSourceID="SqlDataSourceToolUse" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField HeaderText="Update" ShowEditButton="true" />
                    <asp:CommandField HeaderText="Delete" ShowDeleteButton="true" />
                    <asp:BoundField DataField="RegisterID" HeaderText="RegisterID" Visible="false" />
                    <asp:BoundField DataField="Date" HeaderText="DATE"  SortExpression="Date" />
                    <asp:BoundField DataField="ToolName" HeaderText="TOOL NAME" SortExpression="ToolName"/>
                    <asp:BoundField DataField="ToolNumber" HeaderText="TOOL NUMBER" SortExpression="ToolNumber"/>
                    <asp:BoundField DataField="InOut" HeaderText="In/Out" SortExpression="InOut"/>
                    <asp:BoundField DataField="Forename" HeaderText="FORENAME" ReadOnly="True" SortExpression="Forename" />
                    <asp:BoundField DataField="Surname" HeaderText="SURNAME" ReadOnly="true" SortExpression="Surname" />
                    <asp:BoundField DataField="Comment" HeaderText="COMMENT"  SortExpression="Comment" />
                    
                    
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
            <asp:SqlDataSource ID="SqlDataSourceToolUse" runat="server"
                ConnectionString="<%$ ConnectionStrings:HRMSDBConnectionString %>"
                SelectCommand="SELECT e.Forename, e.Surname,t.* FROM [EMPLOYEE] e,[TOOL_USE_REGISTER] t WHERE e.EmployeeID = t.EmployeeID and e.EmployeeStatus = 'Y' order by e.Forename,e.Surname,t.[Date]"
                DeleteCommand="DELETE FROM [TOOL_USE_REGISTER] WHERE RegisterID = @RegisterID"
                UpdateCommand="UPDATE [INDIVIDUAL_DEBT] SET Date = @Date, ToolName = @ToolName, ToolNumber = @ToolNumber, InOut = @InOut, Comment = @Comment WHERE RegisterID = @RegisterID"></asp:SqlDataSource>
        </div>
        <br />
        <br />
        <div style="text-align: center">
            <asp:Button ID="Export" runat="server" Text="Export to Excel" OnClick="Export_Click" visible="false"/>
        </div>
    </div>
</asp:Content>

