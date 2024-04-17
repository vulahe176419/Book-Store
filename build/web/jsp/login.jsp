<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html class="no-js" lang="en">

    
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Login or Sign up</title>
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
        <style>

            .inline{
                display:inline-block;
            }
        </style>
    </head>

    <body class="biolife-body" onload="generate()">

        <jsp:include page="header.jsp"/>
        <div class="page-contain login-page">
            <div id="main-content" class="main-content">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                            <div class="signin-container">
                                <h1>Login</h1>
                                <form action="LoginURL" name="frm-login" method="post">
                                    <p class="form-row">
                                        <label for="fid-name">Email<span class="requite">*</span></label>
                                        <input type="email" id="fid-name" name="email" value="" class="txt-input">
                                    </p>
                                    <p class="form-row">
                                        <label for="fid-pass">Password:<span class="requite">*</span></label>
                                        <input type="password" id="fid-pass" minlength="6" name="pass" value="" class="txt-input">
                                    </p>
                                    <p style="color: red;">${mess}</p>
                                    <p class="form-row wrap-btn">
                                        <button class="btn btn-submit "  id="btnLogin" type="submit">login</button>
                                    </p>
                                </form>
                            </div>
                        </div>

                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                            <div class="signin-container">
                                <h1>Sign up</h1>
                                <form action="RegisterURL" name="frm-login" method="post">
                                    <p class="form-row">
                                        <label for="fid-name">Username<span class="requite">*</span></label>
                                        <input type="text" id="fid-name" name="name" value="" class="txt-input">
                                    </p>
                                    <p class="form-row">
                                        <label for="fid-name">Email<span class="requite">*</span></label>
                                        <input type="email" id="fid-name" name="email" value="" class="txt-input">
                                    </p>
                                    <p class="form-row">
                                        <label for="fid-name">Phone<span class="requite">*</span></label>
                                        <input type="text" id="fid-name" name="phone" value="" class="txt-input">
                                    </p>
                                    <p class="form-row">
                                        <label for="fid-name">Address<span class="requite">*</span></label>
                                        <input type="text" id="fid-name" name="address" value="" class="txt-input">
                                    </p>
                                    <p class="form-row">
                                        <label for="fid-name">Gender<span class="requite">*</span></label>
                                    <div>
                                        <input type="radio" name="gender" value="1" > Male  
                                        <input type="radio" name="gender" value="0" > Female
                                    </div>
                                    </p>
                                    <p class="form-row">
                                        <label for="fid-pass">Password:<span class="requite">*</span></label>
                                        <input type="password" id="fid-pass"  minlength="6"  name="pass" value="" class="txt-input">
                                    </p>

                                    <p id="key" style="color: red" ></p>
                                    <p class="form-row" style="color: red">
                                        ${messregis}
                                    </p>
                                    <p class="form-row wrap-btn">
                                        <button class="btn btn-submit " id="btnRegister" type="submit">Sign up</button>
                                    </p>
                                </form>
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