<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewProductDetails.aspx.cs" Inherits="ViewProductDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="UTF-8" />
    <title></title>
    <!-- Latest compiled and minified CSS -->
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
                <div class="navbar-form navbar-right" role="form" >
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
                               <span class="badge"><asp:Label runat="server" ID="badge" Text=""></asp:Label></span>
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
    <br />    <br />
   <!-- Main jumbotron for a primary marketing message or call to action -->
<div class="jumbotron">
    <div class="container">
        <p>This is a template for a simple marketing or informational website. It includes a large callout called a jumbotron and three supporting pieces of content. Use it as a starting point to create something more unique.</p>
        <p><a class="btn btn-primary btn-lg" role="button">Learn more &raquo;</a></p>
    </div>
</div>

    <div class="container">
    <!-- Example row of columns -->
    <div class="row">
            <asp:Label ID="ProductDetails" runat="server" Text="Label"></asp:Label>
       </div>

        <hr/>

        <footer>
            <p> Copyright &copy; 2014 Priyesh Wani & Sudeep Agarwal. All Rights Reserved.</p>
        </footer>
    </div>
    <!-- /container -->
    
    <!-- Bootstrap core JavaScript
================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <script src="../../dist/js/bootstrap.min.js"></script>
        </form>
</body>
</html>
