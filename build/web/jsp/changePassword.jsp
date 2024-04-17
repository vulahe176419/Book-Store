<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html class="no-js" lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Password Changing</title>
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

    <body class="biolife-body" onload="generate()">
        <jsp:include page="header.jsp"/>
        <div class="page-contain login-page">
            <div id="main-content" class="main-content">
                <div class="container">
                    <div class="row">
                        <div class="col-12">
                            <h3 class="box-title" style="display: inline;">Change password</h3><br>
                            <form method="post" action="ChangePasswordURL">
                                <div  class="col-md-12">
                                    <label class="" >Old Password:</label><input class="form-control" type="password"name="oldpass">
                                </div>
                                <div  class="col-md-12">
                                    <label class="" >New Password::</label><input class="form-control" type="password"  name="newpass">
                                </div>
                                <div  class="col-md-12">
                                    <label class="" >Re-newPass:</label><input class="form-control" type="password"  name="renewpass">
                                </div>
                                <div  class="col-md-12" style="padding: 2px;">           
                                    <p style="color: red;">${mess}</p>
                                </div>
                                
                                <div  class="col-md-12">
                                    <input class="btn btn-primary" type="submit" id="btnRegister" value="Save change" >
                                </div>
                            </form>
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
        <script>
    </body>

</html>