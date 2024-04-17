<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html class="no-js" lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Store Management</title>
        <link href="https://fonts.googleapis.com/css?family=Cairo:400,600,700&amp;display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Poppins:600&amp;display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Playfair+Display:400i,700i" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Ubuntu&amp;display=swap" rel="stylesheet">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/animate.min.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link rel="stylesheet" href="css/nice-select.css">
        <link rel="stylesheet" href="css/slick.min.css">
        <link rel="stylesheet" href="css/main-color.css">

    </head>

    <body class="biolife-body">
        <nav class="navbar navbar-default">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#alignment-example" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                    </button>
                    <a class="navbar-brand" href="DashboardURL">STORE MANAGEMENT</a>
                </div>
                <div class="collapse navbar-collapse" id="alignment-example">

                    <!-- Links -->
                    <ul class="nav navbar-nav">
                        <li >
                            <a href="DashboardURL" class="nav-link" style="font-size: 20px;">Dashboard</a>
                        </li>
                        <li >
                            <a style="text-decoration: none;" href="ManagerBookURL"> Manage Book</a>
                        </li>
                        <li >
                            <a style="text-decoration: none;" href="ManagerCategoryURL"> Manage Category</a>
                        </li>
                        <li >
                            <a style="text-decoration: none;" href="ManagerOrderURL"> Manage Order</a>
                        </li>
                        <li >
                            <a style="text-decoration: none;" href="ManagerUserURL"> Manage User</a>
                        </li>
                        <li >
                            <a style="text-decoration: none;" href="HomePageURL">Back to Home</a>
                        </li>

                    </ul>
                </div>

            </div>
        </nav>
        <div id="main-content" class="main-content">
            <div class="container-fluid">

                <div class="row" >
                    <div class="col-md-12">
                        <h1>Dashboard</h1>
                        <div class="col-md-3">
                            <button type="button" class="btn btn-info btn-lg " data-toggle="modal" data-target="#myModalAddNew">Number Of Book: ${numb}</button>
                        </div>
                        <div class="col-md-3">
                            <button type="button" class="btn btn-info btn-lg " data-toggle="modal" data-target="#myModalAddNew">Number Of Order: ${numo}</button>
                        </div>
                        <div class="col-md-3">
                            <button type="button" class="btn btn-info btn-lg " data-toggle="modal" data-target="#myModalAddNew">Number Of Customer: ${numu}</button>
                        </div>
                        <div class="col-md-3">
                            <button type="button" class="btn btn-info btn-lg " data-toggle="modal" data-target="#myModalAddNew">Profit : ${profit}$</button>

                        </div>


                    </div>
                </div>
            </div>
        </div>

        <!-- Scroll Top Button -->
        <a class="btn-scroll-top"><i class="biolife-icon icon-left-arrow"></i></a>

        <script src="js/jquery-3.4.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.countdown.min.js"></script>
        <script src="js/jquery.nice-select.min.js"></script>
        <script src="js/jquery.nicescroll.min.js"></script>
        <script src="js/slick.min.js"></script>
        <script src="js/biolife.framework.js"></script>
        <script src="js/functions.js"></script>
    </body>

</html>