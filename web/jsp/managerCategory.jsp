<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html class="no-js" lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Category Management</title>

        <link href="https://fonts.googleapis.com/css?family=Cairo:400,600,700&amp;display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Poppins:600&amp;display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Playfair+Display:400i,700i" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Ubuntu&amp;display=swap" rel="stylesheet">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/animate.min.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link rel="stylesheet" href="css/nice-select.css">
        <link rel="stylesheet" href="css/slick.min.css">
        <!--<link rel="stylesheet" href="css/style.css">-->
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
                        <h1 style="text-align: center;">Manage Category</h1>
                        <button type="button" class="btn btn-default btn-lg" data-toggle="modal" data-target="#myModalAddNew">Add Category</button>
                        <!-- Modal -->
                        <div class="modal fade" id="myModalAddNew" role="dialog">
                            <div class="modal-dialog">

                                <!-- Modal content-->
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title">Add New Category:</h4>
                                    </div>
                                    <form action="AddCategoryURL" method="post">
                                        <div class="modal-body">
                                            <b>Name: </b><input type="text" class="form-control" value="" required name="name"><br>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                            <button type="submit" class="btn btn-success" value="submit">Submit</button>
                                        </div>
                                    </form>
                                </div>

                            </div>
                        </div>

                        <table class="table" style="margin-top: 20px; margin-bottom: 20px;">
                            <thead >
                                <tr style="font-size: 20px;">
                                    <th scope="col">ID</th>
                                    <th scope="col">Name</th>
                                    <th scope="col" colspan="2" style="text-align: center">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="b" items="${clist}">
                                    <tr>
                                        <th scope="row">${b.getId()}</th>
                                        <td>${b.getName()}</td>
                                        <td> <button type="button" class="btn btn-success btn-lg" data-toggle="modal" data-target="#myModal${b.getId()}">Edit</button></td>
                                        <td ><a href="DeleteCategoryURL?bid=${b.getId()}" class="btn- btn-danger  btn-lg" style="display: block;" > Delete</a></td>
                                    </tr>
                                <div class="modal fade" id="myModal${b.getId()}" role="dialog">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                <h4 class="modal-title">Edit Category:</h4>
                                            </div>
                                            <form action="EditCategoryURL" method="post">
                                                <div class="modal-body">
                                                    <b>ID: </b><input type="text" class="form-control" name="id" value="${b.getId()}" readonly=""><br>
                                                    <b>Name: </b><input type="text" class="form-control" value="${b.getName()}" name="name"><br>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                    <button type="submit" class="btn btn-success" value="submit">Submit</button>
                                                </div>
                                            </form>
                                        </div>

                                    </div>
                                </div>
                            </c:forEach>
                            </tbody>
                        </table>
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