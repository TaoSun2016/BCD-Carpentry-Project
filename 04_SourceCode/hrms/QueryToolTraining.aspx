<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="QueryToolTraining.aspx.cs" Inherits="Default2"  EnableEventValidation="false"%>

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
    <div style="height: 100%; overflow-y: scroll">
        <h2 class="auto-style6"><strong>Tool Training Record</strong></h2>
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
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Invalide email address!" ControlToValidate="Email" Display="Dynamic" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </div>
            <div style="float: left; width: 50%">
                &nbsp;&nbsp;&nbsp;&nbsp;
            </div>
        </div>
        <br />
        <div style="width: 100%">
            <div style="float: left; width: 25%; text-align: right">
                Begin Date:&nbsp;&nbsp;
            </div>
            <div style="float: left; width: 25%">
                <asp:TextBox ID="BeginDate" runat="server"></asp:TextBox><asp:ImageButton ID="ImageBeginDate" runat="server" Height="22px" ImageAlign="Middle" ImageUrl="~/Images/Calendar-icon.png" OnClick="ImageBeginDate_Click" />
            </div>
            <div style="float: left; width: 10%; text-align: right">End Date:&nbsp;&nbsp;</div>
            <div style="float: left; width: 40%">
                <asp:TextBox ID="EndDate" runat="server"></asp:TextBox><asp:ImageButton ID="ImageEndDate" runat="server" Height="22px" ImageAlign="Middle" ImageUrl="~/Images/Calendar-icon.png" OnClick="ImageEndDate_Click" />
            </div>
        </div>
        <br />
        <div style="float: left; width: 100%">
            <div style="float: left; width: 25%">
                &nbsp;&nbsp;&nbsp;&nbsp;
            </div>
            <div style="float: left; width: 30%">
                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Invalide date!YYYYMMDD" ControlToValidate="BeginDate" Display="Dynamic" ForeColor="Red" ValidationExpression="^\d{4}\d{1,2}\d{1,2}$"></asp:RegularExpressionValidator>
                <asp:Calendar ID="CalendarBeginDate" runat="server" Visible="false" OnSelectionChanged="CalendarBeginDate_SelectionChanged"></asp:Calendar>
            </div>
            <div style="float: left; width: 5%">
                &nbsp;&nbsp;&nbsp;&nbsp;
            </div>
            <div style="float: right; width: 40%">
                <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="Invalide date!YYYYMMDD" ControlToValidate="EndDate" Display="Dynamic" ForeColor="Red" ValidationExpression="^\d{4}\d{1,2}\d{1,2}$"></asp:RegularExpressionValidator>
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
        <div style="width: 100%; text-align: center">
            <asp:GridView ID="GridViewToolTraining" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="TrainingID" DataSourceID="SqlDataSourceToolTraining" ForeColor="#333333" GridLines="None" Visible="False">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField HeaderText="Delete" ShowEditButton="true" />
                    <asp:CommandField HeaderText="Delete" ShowDeleteButton="true" />
                    <asp:BoundField DataField="Forename" HeaderText="Forename" ReadOnly="True" SortExpression="Forename" />
                    <asp:BoundField DataField="Surname" HeaderText="Surname" ReadOnly="True" SortExpression="Surname" />
                    <asp:BoundField DataField="Date" HeaderText="Date" DataFormatString="{0:yyyyMMdd}" SortExpression="Date" />
                    <asp:BoundField DataField="TrainingType" HeaderText="TrainingType" SortExpression="TrainingType" />
                    <asp:BoundField DataField="TrainingTypeNote" HeaderText="TrainingTypeNote" ReadOnly="true" />

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
            <asp:SqlDataSource ID="SqlDataSourceToolTraining" runat="server"
                ConnectionString="<%$ ConnectionStrings:HRMSDBConnectionString %>"
                SelectCommand="SELECT e.Forename, e.Surname,t.* , case TrainingType when 1 then 'I OWN AND AM TRAINED IN THIS TOOL' when 2 then 'I HAVE READ THIS INFORMATION BOOK AND UNDERSTAND THE USE AND CARE' when 3 then 'FOREMAN TRAINED AND WITNESSED GOOD SAFE WORKING PRACTICES' end as TrainingTypeNote FROM [EMPLOYEE] e,[TOOL_TRAINING] t WHERE e.EmployeeID = t.EmployeeID and e.EmployeeStatus = 'Y' order by e.Forename, e.Surname, t.Date"
                DeleteCommand="DELETE FROM [TOOL_TRAINING] WHERE TrainingID = @TrainingID"
                UpdateCommand="UPDATE [TOOL_TRAINING] SET Date = @Date, TrainingType = @TrainingType WHERE TrainingID = @TrainingID"
                ></asp:SqlDataSource>
        </div>
        <br />
        <br />
        <div style="text-align: center">
            <asp:Button ID="Export" runat="server" Text="Export to Excel" OnClick="Export_Click" Visible="False" />
        </div>
    </div>
</asp:Content>

