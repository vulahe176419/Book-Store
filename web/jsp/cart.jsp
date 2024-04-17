<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html class="no-js" lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Cart</title>
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
        <div class="page-contain shopping-cart">
            <div id="main-content" class="main-content">
                <div class="container">
                    <div class="shopping-cart-container" style="margin-bottom: 60px;">
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <h1 class="box-title">View cart </h1>
                                <table class="shop_table cart-form">
                                    <thead>
                                        <tr>
                                            <th >Book Name</th>
                                            <th class="product-name">Book Image</th>
                                            <th class="product-price">Price</th>
                                            <th class="product-quantity">Quantity</th>
                                            <th class="product-subtotal">Total</th>
                                            <th class="product-subtotal">Remove</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="cart" items="${sessionScope['cart'].getItems()}">
                                            <tr class="cart_item">
                                                <td >
                                                    <a href="BookDetailsURL?bid=${cart.getBook().getId()}">${cart.getBook().getName()}</a>
                                                </td>
                                                <td class="product-thumbnail" data-title="Book Name">
                                                    <a class="prd-thumb" href="BookDetailsURL?bid=${cart.getBook().getId()}">
                                                        <figure><img width="113" height="113" src="${cart.getBook().getImg()}" alt="shipping cart"></figure>
                                                    </a>
                                                </td>

                                                <td class="product-price" data-title="Price">
                                                    <div class="price price-contain">
                                                        <ins><span class="price-amount"><span class="currencySymbol">$</span>${cart.getBook().getPrice()}</span></ins>
                                                    </div>
                                                </td>
                                                <td class="product-quantity" data-title="Quantity">
                                                    <div class="quantity-box type1">
                                                        <div class="qty-input">
                                                            <input type="number" name="quantity" value="${cart.getQuantity()}" data-book-id="${cart.getBook().getId()}" class="quantity-input">
                                                        </div>
                                                    </div>
                                                </td>
                                                <td class="product-subtotal" data-title="Total">
                                                    <div class="price price-contain">
                                                        <ins><span class="price-amount"><span class="currencySymbol">$</span>${cart.getBook().getPrice()*cart.getQuantity()}</span></ins>
                                                    </div>
                                                </td>
                                                <td class="product-subtotal" data-title="Total">
                                                    <div class="action">
                                                        <a href="DeleteCartItemURL?bid=${cart.getBook().getId()}"style="color: red; font-size: 40px;" class="remove"><i class="fa fa-trash-o" aria-hidden="true"></i></a>
                                                    </div>
                                                </td>
                                            </tr>
                                        </c:forEach>

                                        <tr class="cart_item wrap-buttons">
                                            <td class="wrap-btn-control" colspan="4">
                                                <a class="btn back-to-shop" href="HomePageURL" style="background-color: #00ffff">Back to Home</a>
                                            </td>
                                            <td class="wrap-btn-control" colspan="2">
                                                <a class="btn back-to-shop" href="CheckoutURL" style="background-color:#00ffff">Checkout</a>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>

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
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script>
            $(document).ready(function () {
                $(".quantity-input").on("change", function () {
                    var newQuantity = $(this).val();
                    var bookId = $(this).data("book-id");
                    $.ajax({
                        url: "EditCartItemURL",
                        method: "POST",
                        data: {
                            bookId: bookId,
                            quantity: newQuantity
                        },
                        success: function (data) {
                            location.reload();
                        },
                    });
                });
            });
        </script>

    </body>

</html>