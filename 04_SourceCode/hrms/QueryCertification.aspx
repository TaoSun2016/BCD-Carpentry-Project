<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="QueryCertification.aspx.cs" Inherits="Default2"  EnableEventValidation="false"%>

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
        <h2 class="auto-style6"><strong>Query Certification Information</strong></h2>
        <div style="width: 100%">
            <div style="float: left; width: 25%; text-align: right">
                Forename:&nbsp;&nbsp;
            </div>
            <div style="float: left; width: 25%">
                <asp:TextBox ID="Forename" runat="server"></asp:TextBox>
            </div>
            <div style="float: left; width: 20%; text-align: right">Surname:&nbsp;&nbsp;</div>
            <div style="float: left; width: 30%">
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
            <div style="float: left; width: 20%">&nbsp;&nbsp;</div>
            <div style="float: left; width: 30%">&nbsp;&nbsp;</div>
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
        
        <div style="text-align: center">
        <asp:Button ID="Query" runat="server" Text="Query" OnClick="Query_Click" />
        </div>
        <br />
        <hr />

        <div style=" width: 100%; text-align: center">
            <asp:GridView ID="GridViewCertification" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="EmployeeID" DataSourceID="SqlDataSourceCertification" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField HeaderText="Edit" ShowEditButton="true" />
                    <asp:CommandField HeaderText="Delete" ShowDeleteButton="true" />
                    <asp:BoundField DataField="EmployeeID" HeaderText="EmployeeID" Visible="false"  />
                    <asp:BoundField DataField="Forename" HeaderText="FORENAME" ReadOnly="true"/>
                    <asp:BoundField DataField="Surname" HeaderText="SURNAME" ReadOnly="true"/>
                    <asp:BoundField DataField="Position" HeaderText="POSITION" ReadOnly="true"/>
                    <asp:BoundField DataField="YearsInBCD" HeaderText="YEARS IN BCD" ReadOnly="true"/>
                    <asp:BoundField DataField="YearsInIndustry" HeaderText="YEARS IN INDUSTRY" ReadOnly="true" />
                    <asp:BoundField DataField="CopyFlag" HeaderText="COPY FLAG"/>
                    <asp:BoundField DataField="LBP" HeaderText="LBP" />
                    <asp:BoundField DataField="Expiry" DataFormatString="{0:yyyyMMdd}" HeaderText="EXPIRY" />
                    <asp:BoundField DataField="BCITONumber" HeaderText="BCITO#" />
                    <asp:BoundField DataField="NZQANumber" HeaderText="NZQA#" />
                    <asp:BoundField DataField="SiteSafeFlag" HeaderText="SITE SAFE" ReadOnly="true" />
                    <asp:BoundField DataField="SiteSafeNumber" HeaderText="ID NUMBER" ReadOnly="true" />
                    <asp:BoundField DataField="SiteSafeExpiryDate" HeaderText="SITE SAFE EXPIRY" DataFormatString="{0:yyyyMMdd}" ReadOnly="true" />
                    <asp:BoundField DataField="FirstAid" HeaderText="FIRST AID" />
                    <asp:BoundField DataField="FallArrest" HeaderText="FALL ARREST" />
                    <asp:BoundField DataField="ConfindSpaces" HeaderText="CONFINED SPACES" />
                    <asp:BoundField DataField="Ramset" HeaderText="RAMSET" />
                    <asp:BoundField DataField="HILTI" HeaderText="HILTI" />
                    <asp:BoundField DataField="LowScaff" HeaderText="LOW SCAFF" />
                    <asp:BoundField DataField="WTR" HeaderText="W,T,R" />
                    <asp:BoundField DataField="EWP" HeaderText="EWP" />
                    <asp:BoundField DataField="HIAB" HeaderText="HIAB" />
                    <asp:BoundField DataField="HT123" HeaderText="HT 1,2,3" />
                    <asp:BoundField DataField="Dog" HeaderText="DOG" />
                    <asp:BoundField DataField="Crane" HeaderText="CRANE" />                   
                    <asp:BoundField DataField="Chainsaw" HeaderText="CHAINSAW" />                   

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
            <asp:SqlDataSource ID="SqlDataSourceCertification" runat="server"
                ConnectionString="<%$ ConnectionStrings:HRMSDBConnectionString %>"
                SelectCommand="SELECT e.Forename, e.Surname,e.Position,e.YearsInBCD,e.YearsInIndustry,case e.SiteSafePhoto when '' then 'N' else 'Y' end as SiteSafeFlag,e.SiteSafeNumber,e.SiteSafeExpiryDate,c.* FROM [Employee] e, [Certification] c  where e.EmployeeID = c.EmployeeID order by e.Forename, e.Surname"
                UpdateCommand="update [CERTIFICATION]  set CopyFlag = @CopyFlag, LBP = @LBP, Expiry = case @Expiry when '' then null else @Expiry end, BCITONumber = @BCITONumber, NZQANumber = @NZQANumber, FirstAid = @FirstAid, FallArrest = @FallArrest, ConfindSpaces = @ConfindSpaces, Ramset = @Ramset, HILTI = @HILTI, LowScaff = @LowScaff, WTR = @WTR, EWP = @EWP, HIAB = @HIAB, HT123 = @HT123, Dog = @Dog, Crane = @Crane, Chainsaw = @Chainsaw where EmployeeID = @EmployeeID"
                DeleteCommand="DELETE FROM [CERTIFICATION] WHERE EmployeeID = @EmployeeID"
                ></asp:SqlDataSource>
        </div>
        <br />
        <br />
        <div style="text-align: center">
            <asp:Button ID="Export" runat="server" Text="Export to Excel" OnClick="Export_Click" />
        </div>
    </div>
</asp:Content>

