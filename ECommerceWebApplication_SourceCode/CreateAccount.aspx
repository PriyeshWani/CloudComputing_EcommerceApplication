<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CreateAccount.aspx.cs" Inherits="CreateAccount" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <title></title>
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css" />
    <link rel="stylesheet" href="css/bootstrap-theme.min.css" />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
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
    <div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">Project name</a>
            </div>
            <div class="navbar-collapse collapse">
                <form class="navbar-form navbar-right" role="form">
                    <a id="Signin" type="submit" class="btn btn-success" href="Login.aspx">Sign in</a>
                </form>



            </div>
            <!--/.navbar-collapse -->

        </div>
    </div>

    <!-- Main jumbotron for a primary marketing message or call to action -->
    <div class="jumbotron" style="height: 125px; text-align: center">
        <h2>Create Account</h2>
    </div>

    <div class="container">
        <!-- Example row of columns -->
        <div class="row">
            <div class="col-lg-4">
            </div>
            <asp:PlaceHolder ID="PlaceHolder1" runat="server">
                <div class="col-lg-4">
                    <form role="form" method="post" runat="server">
                        <div class="form-horizontal">
                            <asp:TextBox class="form-control" ID="firstname" placeholder="Enter Firstname" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                ControlToValidate="firstname"
                                ErrorMessage="First name is a required field."
                                ForeColor="Red">
                            </asp:RequiredFieldValidator>
                        </div>
                        <br />
                        <div class="form-horizontal">
                            <asp:TextBox class="form-control" ID="lastname" placeholder="Enter Lastname" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                ControlToValidate="lastname"
                                ErrorMessage="Last name is a required field."
                                ForeColor="Red">
                            </asp:RequiredFieldValidator>
                        </div>
                        <br />
                        <div class="form-horizontal">
                            <asp:TextBox class="form-control" ID="email" placeholder="Enter Email-Id" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                                ControlToValidate="email"
                                ErrorMessage="Email is a required field."
                                ForeColor="Red">
                            </asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="regexEmailValid" runat="server" 
                                ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                ControlToValidate="email" 
                                ErrorMessage="Invalid Email Format"
                                ForeColor="Red"/>
                        </div>
                        <br />
                        <div class="form-horizontal">
                            <asp:TextBox class="form-control" ID="password" TextMode="Password" placeholder="Enter password" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                                ControlToValidate="password"
                                ErrorMessage="Password is a required field."
                                ForeColor="Red">
                            </asp:RequiredFieldValidator>
                        </div>
                        <br />
                        <div class="form-horizontal">
                            <asp:TextBox class="form-control" ID="renterpassword" TextMode="Password" placeholder="Re-Enter password" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                                ControlToValidate="renterpassword"
                                ErrorMessage="Re-Enter password."
                                ForeColor="Red">
                            </asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidator1" runat="server"
                                ControlToValidate="renterpassword"
                                ControlToCompare="password"
                                ErrorMessage="Passwords do not match." 
                                ForeColor="Red"/>
                        </div>
                        <br />
                        <div class="form-horizontal">
                            <asp:TextBox class="form-control" ID="ContactNo" placeholder="Enter Contact No." runat="server"></asp:TextBox>
                        </div>
                        <br />
                        <div class="form-horizontal" style="text-align: center;">
                            <asp:Button ID="createaccount" runat="server" class="btn btn-success" Text="Create Account" OnClick="CreateAccountMethod"></asp:Button>
                        </div>
                        <br />
                    </form>
                </div>
            </asp:PlaceHolder>
            <br />

            <div id="messageDiv" class="form-horizontal">
                <asp:Label ID="Message" runat="server" Style="color: green;" Text="" Visible="false"></asp:Label>
            </div>


            <div class="col-lg-4">
            </div>


        </div>

        <hr />

        <footer>
            <p>Copyright &copy; 2014 Priyesh Wani & Sudeep Agarwal. All Rights Reserved.</p>
        </footer>
    </div>
    <!-- /container -->


    <!-- Bootstrap core JavaScript
================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <script src="../../dist/js/bootstrap.min.js"></script>
</body>
</html>
