<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html class="no-js" lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Order Management</title>

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
                        <h1 style="text-align: center;">Manage Order</h1>
                        <form method="get" action="ManagerOrderURL" style="width: 70%; padding: 15px; display: flex; justify-content: space-between">
                            <div>
                                <label >Account:</label>
                                <div>
                                    <select name="uid" class="form-control">
                                        <c:forEach var="u" items="${ul}">
                                            <option value="${u.id}">${u.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div>
                                <label >From date:</label> <input type="date" name="fdate" value="${param["fdate"]}" class="form-control">
                            </div>
                            <div >  
                                <label >To date:</label><input type="date" name="tdate"  value="${param["tdate"]}" class="form-control">
                            </div>
                            <input class="btn btn-primary" type="submit" value="Find" style="margin-top: 10px; ">
                        </form>
                    </div>

                    <table class="table" style="margin-top: 20px; margin-bottom: 20px;">
                        <thead>
                            <tr>
                                <th class="book-name">Order Id </th>
                                <th class="book-price">Order Date</th>
                                <th class="book-quantity">Total Bill</th>
                                <th class="book-subtotal">Note</th>
                                <th class="book-subtotal">Status</th>
                                <th class="book-subtotal">Order Details</th>
                                <th class="book-subtotal">Cancel Order</th>
                                <th class="book-subtotal">Delete Order</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="o" items="${ol}">
                                <tr class="cart_item">
                                    <td class="book-thumbnail" >
                                        ${o.getId()}
                                    </td>
                                    <td class="book-price" >
                                        ${o.getOrderDate()}
                                    </td>
                                    <td class="book-quantity" >
                                        ${o.getTotal()}
                                    </td>
                                    <td class="book-subtotal" >
                                        ${o.getNotes()}
                                    </td>
                                    <td class="book-subtotal" >
                                        ${o.getStatusName()}
                                    </td>
                                    <td class="book-subtotal" >
                                        <a href="OrderDetailsURL?oid=${o.getId()}">View</a>
                                    </td>
                                    <!-- <td class="book-subtotal" >
                                   <a href="CancelOrderURL?oid=${o.getId()}" class="btn btn-cancel" >Cancel</a>
                                   </td>-->
                                    <td class="book-subtotal" >
                                        <c:choose>
                                            <c:when test="${o.getStatusName() eq 'Delivered'}">
                                                ${'Can not cancel'}
                                            </c:when>
                                            <c:otherwise>
                                            <a href="CancelOrderURL?oid=${o.getId()}" class="btn btn-cancel">Cancel</a>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>            

                            <td class="book-subtotal" >
                                <a href="DeleteOrderURL?oid=${o.getId()}" class="btn btn-danger">Delete</a>
                            </td>
                            </tr>
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