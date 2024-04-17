<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html class="no-js" lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Book Store</title>
        <link href="https://fonts.googleapis.com/css?family=Cairo:400,600,700&amp;display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Poppins:600&amp;display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Playfair+Display:400i,700i" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Ubuntu&amp;display=swap" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/animate.min.css">
        <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="css/nice-select.css">
        <link rel="stylesheet" type="text/css" href="css/slick.min.css">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="stylesheet" type="text/css" href="css/main-color.css">
    </head>
    
    <body class="biolife-body">
        <jsp:include page="header.jsp"/>
        <div class="page-contain">
            <div id="main-content" class="main-content">
                <div class="product-tab z-index-20 sm-margin-top-193px xs-margin-top-30px">
                    <div class="container">
                        <div class="biolife-tab biolife-tab-contain sm-margin-top-34px">
                            <div class="tab-head tab-head__icon-top-layout icon-top-layout">
                                <h1 style="color: black; font-weight: 600; ">New Releases</h1>
                                <div class="row" style="margin-bottom: 50px;">
                                    <ul class="products-list" style="list-style: none;">
                                        <c:forEach var="b" items="${blist}">
                                            <li class="product-item col-lg-4 col-xs-6" style="min-height: 550px;">
                                                <div class="contain-product layout-default">
                                                    <div class="product-thumb">
                                                        <a href="BookDetailsURL?bid=${b.getId()}" class="link-to-product" style="display: block; width: 300px; height: 300px; padding: auto;">
                                                            <img src="${b.getImg()}" alt="img" width="300" height="300" style="margin-left: 8%;">
                                                        </a>
                                                    </div>
                                                            <div class="info">
                                                                <h4 class="product-title" style="margin-top: 45px;"><a href="BookDetailsURL?bid=${b.getId()}" class="pr-name"  style="color: black;"> ${b.getName()}</a></h4>
                                                                <div class="price">
                                                                    <ins ><span class="price-amount"  style="color: black;"><span class="currencySymbol">$</span >${b.getPrice()}</span></ins>
                                                                    <div class="buttons">
                                                                        <a href="AddToCartURL?bid=${b.getId()}&quantity=1"  class="btn btn-primary"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i>add to cart</a>
                                                                    </div>
                                                                </div>

                                                            </div>
                                                    <div class="info">
                                                        <h4 class="product-title"  style="margin-top: 25px;"><a style="color: black;" href="BookDetailsURL?bid=${b.getId()}" class="pr-name">${b.getName()}</a></h4>
                                                        <div class="price">
                                                            <ins><span class="price-amount" style="color: black;" ><span class="currencySymbol">$</span>${b.getPrice()}</span></ins>

                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                        </c:forEach>

                                    </ul>
                                </div>
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
    </body>

</html>