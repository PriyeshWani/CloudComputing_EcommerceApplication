<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head lang="en" runat="server">
    <meta charset="UTF-8" />
    <title></title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css" />
    <link rel="stylesheet" href="css/bootstrap-theme.min.css" />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/angular.min.js"></script>
    <script type="text/javascript" src="js/app.js"></script>
    <style type="text/css">
        .bs-example {
            height: 750px;
            margin: 20px;
            margin-top: 20px;
            margin-bottom: 20px;
        }
    </style>

</head>

<body>
    <div class="panel panel-primary bs-example">
        <div style="text-align: center;">
            <div style="box-sizing: border-box; display: inline-block; width: auto; max-width: 480px; background-color: #FFFFFF; border: 2px solid #0361A8; border-radius: 5px; box-shadow: 0px 0px 8px #0361A8; margin: 50px auto auto;">
                <div style="background: #0361A8; border-radius: 5px 5px 0px 0px; padding: 15px;"><span style="font-family: verdana,arial; color: #D4D4D4; font-size: 1.00em; font-weight: bold;">Enter your login and password</span></div>
                <div style="padding: 15px">
                    <style type="text/css">
                        td {
                            text-align: left;
                            font-family: verdana,arial;
                            color: #064073;
                            font-size: 1.00em;
                        }

                        input {
                            border: 1px solid #CCCCCC;
                            border-radius: 5px;
                            color: #666666;
                            display: inline-block;
                            font-size: 1.00em;
                            padding: 5px;
                            width: 100%;
                        }

                            input[type="button"], input[type="reset"], input[type="submit"] {
                                height: auto;
                                width: auto;
                                cursor: pointer;
                                box-shadow: 0px 0px 5px #0361A8;
                                float: right;
                                text-align: right;
                                margin-top: 10px;
                                margin-left: 7px;
                            }

                        table.center {
                            margin-left: auto;
                            margin-right: auto;
                        }

                        .error {
                            font-family: verdana,arial;
                            color: #D41313;
                            font-size: 1.00em;
                        }
                    </style>
                    <form class="navbar-form navbar-left" method="post" runat="server" name="aform" target="_top">
                        <input type="hidden" name="action" value="login" />
                        <input type="hidden" name="hide" value="" />
                        <table class='center'>
                            <tr>
                                <td>Email:</td>
                                <td>
                                    <asp:TextBox ID="username"  runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>Password:</td>
                                <td>
                                    <asp:TextBox ID="password"  TextMode="Password" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                
                                <td>
                                    <asp:Button ID="login" runat="server" Text="Login" OnClick="Login_Click" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">&nbsp; <asp:Label ID="loginMessage" runat="server"  Visible="false" style="color:red;" Text="Label"></asp:Label></td>
                            </tr>
                            <tr>
                                <!--<td colspan="2">Forgot your password?</td>-->
                            </tr>
                            <tr>
                                <td colspan="2"><a href="CreateAccount.aspx">Click here to register.</a></td>
                            </tr>
                        </table>
                    </form>
                </div>
            </div>
        </div>
    </div>




</body>
</html>
