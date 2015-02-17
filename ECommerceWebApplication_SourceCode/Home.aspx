<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
    <form runat="server">
    <div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <div class="navbar-header">
                <a class="navbar-brand" href="#"><span style="color:white;font-size:40px;font-family:Verdana;font-style:italic">RHYTHM</span></a>
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
                                <li><a href="ProceedToCheckOut.aspx">Proceed To Checkout</a></li>
                            </ul>
                        </asp:PlaceHolder>
                    </div>                  
                </div>
            </div>
            <!--/.navbar-collapse -->

        </div>
    </div>
    <br />    <br />

        <div id="myCarousel" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
                <br />    <br />

                <div class="item active">
                    <center><img src="images/CarousalImage01.jpg" alt="First slide" height="275" width="400"></center>
                </div>
                <div class="item">
                     <center><img src="images/CarousalImage02.jpg" alt="First slide" height="250" width="400"></center>
                </div>
                <div class="item">
                     <center><img src="images/CarousalImage03.jpg" alt="First slide" height="250" width="300"></center>
                </div>
            </div>
            <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a>
            <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
        </div>
        <!-- /.carousel -->

   <!-- Main jumbotron for a primary marketing message or call to action -->
<!--<div class="jumbotron">
    <div class="container">

        <p>This is a template for a simple marketing or informational website. It includes a large callout called a jumbotron and three supporting pieces of content. Use it as a starting point to create something more unique.</p>
        <p><a class="btn btn-primary btn-lg" role="button">Learn more &raquo;</a></p>
    </div>
</div>-->
        <br /> <br />
    <div class="container">
    <!-- Example row of columns -->
    <div class="row">
        <div class="col-lg-2">
            <div class="panel panel-default">
                <div class="panel-body">
                    <ul class="list-group">
                        <li class="list-group-item" style="overflow-y: scroll;height: 150px">
                            <label>Brand</label>
                                <asp:CheckBoxList ID="ChkBxLstBrand" runat="server">
                                                                  </asp:CheckBoxList>
                        </li>
                        <li class="list-group-item" style="overflow-y: scroll;height: 150px">
                            <label>Price Range</label>
                            <asp:RadioButtonList ID="RDBLstPrice" runat="server">
                                 
                            </asp:RadioButtonList>
                        </li>
                    </ul>
                    <ul>
                        
                    </ul>
                </div>
            </div>
           <asp:LinkButton id="LinkButton1" Text="Apply Filter" class="btn btn-success" OnClick="LinkButton_Click" runat="server"/>
        </div>
        <div class="col-lg-10">
            <asp:Label ID="ProductList" runat="server" Text="Label"></asp:Label>
            
        </div>

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
<%--  --%>