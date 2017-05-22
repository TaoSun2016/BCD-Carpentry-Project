<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            font-size: large;
        }

        .auto-style2 {
            height: 186px;
            width: 100%;
        }

        .auto-style3 {
            font-size: xx-large;
            color: #FF0000;
        }

        .auto-style4 {
            font-size: xx-large;
            color: #0000FF;
        }

        .auto-style5 {
            font-size: xx-large;
        }
    </style>
</head>
<body style="background-position: center; background-image: url('/hrms/Images/Bankground.jpg'); background-repeat: repeat;">
    <div style="height: 40%; text-align: center; margin-top: 100px; margin-bottom: 100px">
        <strong><span class="auto-style3">BCD</span></strong> <span class="auto-style4"><strong>CARPENTRY</strong></span> <span class="auto-style5"><strong>LTD</strong></span>
    </div>

    <hr />
    <div style="height: 30%; margin-bottom: 50px; margin-top: 50px">
        <form id="form1" runat="server">

            <div>
                <div style="float: left; width: 100%">
                    <div style="float: left; width: 50%; text-align: right">
                        <strong>User Name:</strong>&nbsp;&nbsp;
                    </div>
                    <div style="float: left; width: 50%">
                        <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                    </div>
                </div>

                <div style="float: left; width: 100%">
                    <div style="float: left; width: 50%; text-align: right">
                        &nbsp;&nbsp;
                    </div>
                    <div style="float: left; width: 50%">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="UserName" Display="Dynamic" ErrorMessage="Please input user name!" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div style="float: left; width: 100%">
                    <div style="float: left; width: 50%; text-align: right">
                        <strong>Password:</strong>&nbsp;&nbsp;
                    </div>
                    <div style="float: left; width: 50%">
                        <asp:TextBox ID="Password" runat="server" TextMode="Password" MaxLength="6"></asp:TextBox>
                    </div>
                </div>

                <div style="float: left; width: 100%">
                    <div style="float: left; width: 50%; text-align: right">
                        &nbsp;&nbsp;
                    </div>
                    <div style="float: left; width: 50%">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Password" Display="Dynamic" ErrorMessage="Can't be null!" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="Password" ErrorMessage="6 letters or numbers!" ForeColor="Red" ValidationExpression="([a-z]|[A-Z]|[0-9]){6}"></asp:RegularExpressionValidator>
                    </div>
                </div>

                <div style="float: left; width: 100%; text-align: center; margin-top: 50px;margin-bottom:50px">
                    <asp:Button ID="LoginButton" runat="server" Text="Log In" OnClick="LoginButton_Click" Height="26px" Width="87px" />
                </div>
            </div>
        </form>
        <hr />
    </div>
    <div style="text-align: center">
        <asp:Label ID="Error" runat="server" ForeColor="Red"></asp:Label>
    </div>
</body>
</html>
