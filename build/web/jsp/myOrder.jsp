<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html class="no-js" lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>My Order</title>

        <link href="https://fonts.googleapis.com/css?family=Cairo:400,600,700&amp;display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Poppins:600&amp;display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Playfair+Display:400i,700i" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Ubuntu&amp;display=swap" rel="stylesheet">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/animate.min.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link rel="stylesheet" href="css/nice-select.css">
        <link rel="stylesheet" href="css/slick.min.css">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/main-color.css">

    </head>

    <body class="biolife-body">

        <jsp:include page="header.jsp"/>

        <div class="page-contain login-page">
            <div id="main-content" class="main-content">
                <div class="container">
                    <div class="row">
                        <div class="col-12">
                            <h3 class="box-title"  style="text-align: center">Your Order List</h3>
                            <form method="get" action="MyOrderURL" style="width: 40%; padding: 15px; display: flex; justify-content: space-between">
                                <div>
                                    From date: <input type="date" name="fdate" value="${param["fdate"]}" class="form-control">
                                </div>
                                <div >  
                                    To date: <input type="date" name="tdate"  value="${param["tdate"]}" class="form-control">
                                </div>
                                <input class="btn btn-primary" type="submit" value="Find" style="margin-top: 10px; ">
                            </form>
                            <table class="table table-hover table-striped" style="font-size: 20px;">
                                <thead>
                                    <tr>
                                        <th class="book-name">Order Id </th>
                                        <th class="book-price">Order Date</th>
                                        <th class="book-quantity">Total Bill</th>
                                        <th class="book-subtotal">Notes</th>
                                        <th class="book-subtotal">Status</th>
                                        <th class="book-subtotal">Details</th>
                                        <th class="book-subtotal">To Receive</th>
                                        <th class="book-subtotal">Cancel Order</th>
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
                                            <td class="book-subtotal" >
                                                <a href="DeliveredOrderURL?oid=${o.getId()}" class="btn btn-delivered">Delivered</a>
                                            </td>
                                            <td class="book-subtotal" >
                                                <a href="CancelOrderURL?oid=${o.getId()}" class="btn btn-cancel">Cancel</a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>

                    </div>

                </div>

            </div>

        </div>

        <jsp:include page="footer.jsp"/>
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