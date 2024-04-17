<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html class="no-js" lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Order Detail</title>
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
                        <div class=" col-12">
                            <h3 class="box-title" style="text-align: center">Order Detail</h3>
                            <table class="table table-bordered table-striped" style="font-size: 20px;">
                                <thead>
                                    <tr>
                                        <th class="book-price">Book Title</th>
                                        <th class="book-name">Book Image</th>
                                        <th class="book-price">Price</th>
                                        <th class="book-subtotal">Quantity</th>
                                        <th class="book-subtotal">Total</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="odl" items="${odl}">
                                        <tr class="cart_item">
                                            <td class="book-thumbnail" data-title="Book Name">
                                                <a class="prd-name" href="BookDetailsURL?bid=${odl.getBook().getId()}">${odl.getBook().getName()}</a>
                                            </td>
                                            <td class="book-thumbnail" data-title="Book Name">
                                                <a class="prd-thumb" href="BookDetailsURL?bid=${odl.getBook().getId()}">
                                                    <figure><img width="113" height="113" src="${odl.getBook().getImg()}" alt="shipping cart"></figure>
                                                </a>
                                            </td>
                                            <td class="book-price" data-title="Price">
                                                <div class="price price-contain">
                                                    <ins><span class="price-amount"><span class="currencySymbol">$</span>${odl.getBook().getPrice()}</span></ins>
                                                </div>
                                            </td>
                                            <td class="book-subtotal" data-title="Quantity">
                                                <div class="quantity-box type1">
                                                    ${odl.getQuantity()}
                                                </div>
                                            </td>
                                            <td class="book-subtotal" data-title="Total">
                                                <div class="price price-contain">
                                                    <ins><span class="price-amount"><span class="currencySymbol">$</span>${odl.getBook().getPrice()*odl.getQuantity()}</span></ins>
                                                </div>
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