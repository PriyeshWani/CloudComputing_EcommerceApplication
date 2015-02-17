<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProceedtoCheckout.aspx.cs" Inherits="ProceedtoCheckout" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="UTF-8" />
    <title></title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css" />
    <link rel="stylesheet" href="css/bootstrap-theme.min.css" />
    <%-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    --%>
    <script src="js/jquery-1.9.1.min.js"></script>
    <script src="js/bootstrap-datepicker.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="css/bootstrap.css" />
    <link rel="stylesheet" href="css/datepicker.css" />
    <style type="text/css">
        .bs-example {
            height: 750px;
            margin: 20px;
            margin-top: 20px;
            margin-bottom: 20px;
        }
    </style>

    <!--[endif]-->
</head>
<body>
    <form id="Form1" runat="server">
        <div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <div class="container">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">Project name</a>
                </div>
                <div class="navbar-collapse collapse">
                    <div class="navbar-form navbar-right" role="form">
                        <div class="navbar-form navbar-right">

                            <asp:PlaceHolder ID="PHUser" runat="server">
                                <a href="#" style="color: white" class="glyphicon glyphicon-user dropdown-toggle" data-toggle="dropdown">
                                    <asp:Label runat="server" ID="user" Text=""></asp:Label>
                                </a>
                                <ul class="dropdown-menu" role="menu">
                                    <li><a href="Home.aspx?userid=-1">SignOut</a></li>
                                </ul>
                            </asp:PlaceHolder>
                            <asp:PlaceHolder ID="PHSignin" runat="server">
                                <a href="Login.aspx" class="btn btn-success">Sign in</a>
                            </asp:PlaceHolder>
                        </div>
                        <div class="navbar-form navbar-right">
                            <asp:PlaceHolder ID="PHCart" runat="server">
                                <a href="#" style="color: white" class="glyphicon glyphicon-shopping-cart dropdown-toggle" data-toggle="dropdown">Cart</a>
                                <span class="badge">
                                    <asp:Label runat="server" ID="badge" Text=""></asp:Label></span>
                                <ul class="dropdown-menu" role="menu">
                                    <li><a href="#">View Cart</a></li>
                                    <li><a href="#">Proceed To Checkout</a></li>
                                </ul>
                            </asp:PlaceHolder>
                        </div>
                    </div>
                </div>
                <!--/.navbar-collapse -->

            </div>
        </div>
        <br />
        <br />
        <!-- Main jumbotron for a primary marketing message or call to action -->
        <div class="jumbotron" style="height: 75px">
            <h3 class="form-signin-heading">Confirm Order</h3>
        </div>

        <div class="container">
            <!-- Example row of columns -->
            <div class="row">
                <div class="col-lg-6">
                    <asp:Label ID="CartDetails" runat="server" Text=""></asp:Label>
                    <asp:Label ID="AvailabiltyMessge" runat="server" Text=""></asp:Label>
                </div>
                <div class="col-lg-6">
                    <!--Insert here-->
                    <div class="col-lg-2">
                    </div>
                    <div class="col-lg-10" style="">

                        <asp:TextBox class="form-control" ID="cardNumber" placeholder="Credit Card Number" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                                ControlToValidate="cardNumber"
                                ErrorMessage="Card Number password."
                                ForeColor="Red">
                            </asp:RequiredFieldValidator><br />
                        <asp:TextBox class="form-control" ID="CardName" placeholder="Name as displayed on Card" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                ControlToValidate="CardName"
                                ErrorMessage="Card Name required."
                                ForeColor="Red">
                            </asp:RequiredFieldValidator><br />
                        <asp:TextBox class="form-control" ID="email" placeholder="Email address" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                ControlToValidate="email"
                                ErrorMessage="Email required."
                                ForeColor="Red">
                            </asp:RequiredFieldValidator><br />
                        <div class="form-inline">
                            <asp:TextBox class="form-control" ID="valid" placeholder="Valid Through" runat="server"></asp:TextBox>&nbsp;&nbsp;&nbsp;
                            <asp:TextBox class="form-control" ID="cvv" placeholder="CVV" runat="server"></asp:TextBox><br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                                ControlToValidate="valid"
                                ErrorMessage="Valid through required."
                                ForeColor="Red">
                            </asp:RequiredFieldValidator>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                                ControlToValidate="cvv"
                                ErrorMessage="CVV required."
                                ForeColor="Red">
                            </asp:RequiredFieldValidator>
                        </div>
                        
                        <asp:TextBox class="form-control" ID="address" placeholder="Shipping Address" runat="server"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"
                                ControlToValidate="address"
                                ErrorMessage="Shipping Address required."
                                ForeColor="Red">
                            </asp:RequiredFieldValidator><br />
                        <asp:button id="btnMakePayment" class="btn btn-success" runat="server" Text="Make Payment" OnClick="MakePayment_Click"></asp:button>
                    </div>



                </div>

            </div>

            <hr />

            <footer>
                <p>Copyright &copy; 2014 Priyesh Wani & Sudeep Agarwal. All Rights Reserved.p>
            </footer>
        </div>
        <!-- /container -->

        <!-- Bootstrap core JavaScript
================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <%--<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>--%>
        <script src="../../dist/js/bootstrap.min.js"></script>
        <script type="text/javascript">
            // When the document is ready
            $(document).ready(function () {

                $('#valid').datepicker({
                    format: "dd/mm/yyyy"
                });

            });
        </script>
    </form>
</body>
</html>
