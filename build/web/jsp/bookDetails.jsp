<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html class="no-js" lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Book Shop</title>
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
        <div class="page-contain single-product">
            <div class="container">
                <div id="main-content" class="main-content">
                    <h1 style="text-align: center;">    </h1>
                    <div style="display: flex; justify-content: space-around">
                        <div class="media" style="width: 40%">
                            <img src="${b.getImg()}" alt="" width="300" height="300">
                        </div>
                        <div class="product-attribute" style="width: 50%">
                            <h2 class="title">${b.getName()}</h2>
                            <span class="sku"><p style="font-size: 20px;line-height: 20px">
                                <p style="font-size: 20px;"><b>Author:  </b>${b.getAuthor()}</p> 
                                <p style="font-size: 20px;"><b>Publish Date:  </b>${b.getPublishDate()}</p> 
                                <p style="font-size: 20px;"><b>Category:  </b>${b.getCategory().getName()}</p> 
                                <p style="font-size: 20px;"><b>In Stock:  </b>${b.getStock()}</p> 
                                <p style="font-size: 20px;"><b>Price:  $</b>${b.getPrice()}</p> 
                                </p>
                            </span>
                            <form action="AddToCartURL" method="post">
                                <div class="quantity-box">
                                    <span class="title">Quantity: <input type="hidden" value="${b.getId()}" name="bid">
                                    </span>
                                    <input type="number" class="form-control" style="width: 90px;margin: 10px 0px;" name="quantity" value="1" max="${b.getStock()}" min="1" data-step="1">
                                </div>
                                <div class="buttons" >
                                    <button type="submit" class="btn add-to-cart-btn" style="background-color: #00ffff; padding: 7px; font-size: 15px;">
                                        add to cart
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div style="width: 80%;margin: auto;">
                        <h2 style="text-align: center;">Description</h2>
                        <p style="font-size: 16px;"> ${b.getDescription()}</p>
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