<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            font-size: large;
        }
    </style>
</head>
<body style="background-position: center; background-image: url('/hrms/Images/Bankground.jpg'); background-repeat: repeat;">

    <form id="form1" runat="server">
        <div style="height: 230px; width: 100%"></div>
        <div style="height: 40%">
            <table style="width:100%;table-layout:fixed">
                <tr>
                    <td style="width: 30%">&nbsp;</td>
                    <td style="width: 20%; text-align: right">&nbsp;</td>
                    <td style="width: 20%">&nbsp;</td>
                    <td style="width: 30%; text-align: right">&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td style="text-align: center" class="auto-style1"><strong>User Name:</strong></td>
                    <td style="text-align: center">
                        <asp:TextBox ID="UserName" runat="server"></asp:TextBox></td>
                    <td style="text-align: left">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="UserName" Display="Dynamic" ErrorMessage="Please input user name!" ForeColor="#FF3300"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td></td>
                    <td style="text-align: center" class="auto-style1"><strong>Password:</strong></td>
                    <td style="text-align: center">
                        <asp:TextBox ID="Password" runat="server" TextMode="Password" MaxLength="6"></asp:TextBox>
                    </td>
                    <td style="text-align: left">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Password" Display="Dynamic" ErrorMessage="Can't be null!" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="Password" ErrorMessage="6 letters or numbers!" ForeColor="Red" ValidationExpression="([a-z]|[A-Z]|[0-9]){6}"></asp:RegularExpressionValidator></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td colspan="2" style="text-align: center">
                        <asp:Button ID="LoginButton" runat="server" Text="Log In" OnClick="LoginButton_Click" Height="26px" Width="87px" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
        <div style="height: 30%;text-align:center">
            <asp:Label ID="Error" runat="server" ForeColor="Red"></asp:Label>
        </div>
    </form>

</body>
</html>
