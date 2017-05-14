<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Competency.aspx.cs" Inherits="Default2" %>

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
    <div style="height: 100%; overflow-y: scroll" class="auto-style7">
        <h2 class="auto-style6"><strong>Add Competency Record</strong></h2>
        <div>
            <div style="width: 100%">
                <div style="float: left; width: 25%; text-align: right">
                    Forename:&nbsp;&nbsp;
                </div>
                <div style="float: left; width: 25%">
                    <asp:TextBox ID="Q_Forename" runat="server" MaxLength="60"></asp:TextBox>
                </div>
                <div style="float: left; width: 15%; text-align: right">Surname:&nbsp;&nbsp;</div>
                <div style="float: left; width: 35%">
                    <asp:TextBox ID="Q_Surname" runat="server" MaxLength="50"></asp:TextBox>
                </div>
            </div>
            <br />
            <br />
            <div style="width: 100%">
                <div style="float: left; width: 25%; text-align: right">
                    Email:&nbsp;&nbsp;
                </div>
                <div style="float: left; width: 25%">
                    <asp:TextBox ID="Q_Email" runat="server" MaxLength="100"></asp:TextBox>
                </div>
                <div style="float: left; width: 15%; text-align: right">&nbsp;&nbsp;</div>
                <div style="float: left; width: 35%">
                    &nbsp;&nbsp;
                </div>
            </div>
            <br />
                    <div style="float: left; width: 100%">
            <div style="float: left; width: 25%">
                &nbsp;&nbsp;&nbsp;&nbsp;
            </div>
            <div style="float: left; width: 25%">
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalide email address!" ControlToValidate="Q_Email" Display="Dynamic" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </div>
            <div style="float: left; width: 50%">
                &nbsp;&nbsp;&nbsp;&nbsp;
            </div>
        </div>
            <br />
            <div style="width: 100%; text-align: center">
                <asp:Button ID="Query" runat="server" Text="Query" Width="83px" OnClick="Query_Click" CausesValidation="False" />
            </div>
            <br />
            <hr />
        </div>

        <div class="auto-style7">
            <div style="width: 100%; text-align: center">
                <asp:Image ID="SiteSafe" runat="server" AlternateText="Site Safe Photo" Width="300px" Height="200px" BorderStyle="Dotted" />
            </div>
            <br />
            <br />
            <div style="width: 100%">
                <div style="float: left; width: 25%; text-align: right">Position Held Within BCD:&nbsp;&nbsp;</div>
                <div style="float: left; width: 25%">
                    <asp:TextBox ID="Position" runat="server" MaxLength="10" ReadOnly="True"></asp:TextBox>
                </div>
                <div style="float: left; width: 15%; text-align: right">Other Positions:&nbsp;&nbsp;</div>
                <div style="float: left; width: 35%">
                    <asp:TextBox ID="OtherPositions" runat="server" ReadOnly="True"></asp:TextBox>
                </div>
            </div>
            <br />
            <br />


            <div style="width: 100%">
                <div style="float: left; width: 25%; text-align: right">
                    Years Started With BCD:&nbsp;&nbsp;
                </div>
                <div style="float: left; width: 25%">
                    <asp:TextBox ID="HireDate" runat="server" ReadOnly="True"></asp:TextBox>
                </div>
                <div style="float: left; width: 15%; text-align: right">Years In Industry:&nbsp;&nbsp;</div>
                <div style="float: left; width: 35%">
                    <asp:TextBox ID="YearsInIndustry" runat="server" TextMode="Number" ReadOnly="True"></asp:TextBox>
                </div>
            </div>
            <br />
            <br />
            <div style="width: 100%">
                <div style="float: left; width: 25%; text-align: right">Qualifications Gained:&nbsp;&nbsp;</div>
                <div style="float: left; width: 75%"></div>
            </div>
            <div style="float: left; width: 100%; text-align: center">
                <div style="float: left; width: 25%; text-align: right">&nbsp;</div>
                <div style="float: left; width: 75%; text-align: left">
                    <asp:TextBox ID="Qualifications" runat="server" TextMode="MultiLine" Width="400px" Height="100px"></asp:TextBox>
                </div>
            </div>
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <div style="width: 100%">
                <div style="float: left; width: 25%; text-align: right">Driver License Endorsements:&nbsp;&nbsp;</div>
                <div style="float: left; width: 25%">
                    <asp:TextBox ID="DriverLicenseClass" runat="server" ReadOnly="True"></asp:TextBox>
                </div>
                <div style="float: left; width: 50%">&nbsp;&nbsp;</div>
            </div>
            <br />
            <br />
            <div style="width: 100%">
                <div style="float: left; width: 25%; text-align: right">
                    General Competency:&nbsp;&nbsp;
                </div>
                <div style="float: left; width: 25%">
                    <asp:DropDownList ID="GeneralCompetency" runat="server">
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem>LOW</asp:ListItem>
                        <asp:ListItem>AVERAGE</asp:ListItem>
                        <asp:ListItem>HIGH</asp:ListItem>
                        
                    </asp:DropDownList>*
                </div>
                <div style="float: left; width: 15%; text-align: right">Tool Competency:&nbsp;&nbsp;</div>
                <div style="float: left; width: 35%">
                    <asp:DropDownList ID="ToolCompetency" runat="server">
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem>LOW</asp:ListItem>
                        <asp:ListItem>AVERAGE</asp:ListItem>
                        <asp:ListItem>HIGH</asp:ListItem>
                    </asp:DropDownList>*
                </div>
            </div>
            <br />
            <div style="width: 100%">
                <div style="float: left; width: 25%; text-align: right">
                    &nbsp;&nbsp;
                </div>
                <div style="float: left; width: 25%">

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="GeneralCompetency" Display="Dynamic" ErrorMessage="Please choose general competency!" ForeColor="Red"></asp:RequiredFieldValidator>

                </div>
                <div style="float: left; width: 15%; text-align: right">&nbsp;&nbsp;</div>
                <div style="float: right; width: 35%">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ToolCompetency" Display="Dynamic" ErrorMessage="Please choose tool competency!" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            </div>
            <asp:HiddenField ID="EmployeeID" runat="server" />
            <asp:HiddenField ID="Forename" runat="server" />
            <asp:HiddenField ID="Surname" runat="server" />
            <br />
        </div>
        <br />
        <br />
        <div style="width:100%">
            <div style="float:left;width:30%;text-align:right">
                <asp:Button ID="Add" runat="server" Text="Add/Update" OnClick="Add_Click" Visible="False" />
            </div>
            <div style="float:left;width:40%;text-align:center">
                <asp:Button ID="Delete" runat="server" Text="Delete" OnClick="Delete_Click" CausesValidation="False" Visible="False" />
            </div>
            <div style="float:left;width:30%;text-align:left">
                <asp:Button ID="Export" runat="server" Text="Export to PDF" OnClick="Export_Click" Visible="False" />
            </div>
            
        </div>
    </div>
</asp:Content>