<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<nav class="navbar navbar-default">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#alignment-example" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="HomePageURL">BOOK STORE</a>
        </div>

        <div class="collapse navbar-collapse" id="alignment-example">
            <ul class="nav navbar-nav">
                <li >
                    <a href="HomePageURL" class="nav-link" style="font-size: 20px;">Home</a>
                </li>
                <li >
                    <a href="BookListURL" class="nav-link" data-title="Shop" style="font-size: 20px;" >Books</a>
                </li>
                <c:if test="${sessionScope['account'].getRoles().getId() ==1}">
                    <li >
                    <a href="ViewCartURL" class="link-to">
                        Cart 
                        <c:if test="${sessionScope['cart']==null}">
                            (0)
                        </c:if>
                        <c:if test="${sessionScope['cart']!=null}">
                             (${sessionScope['cart'].getItems().size()})
                        <!-- (${sessionScope['cart'].getTotalQuantity()})-->
                        </c:if>
                    </a>
                </li>
                </c:if>
            </ul>

            <form action="BookListURL?index=1" class="navbar-form nav navbar-nav" name="desktop-seacrh" method="get">
                <input type="text" name="search"  class="input-text" value="" placeholder="Search books...">
                <button type="submit" class="btn-submit"><i class="biolife-icon icon-search"></i></button>
            </form>
            <ul class="nav navbar-nav navbar-right">

                <c:if test="${sessionScope['account'].getRoles().getId() ==1}">
                    <li><a href="MyOrderURL" >My order</a>
                </c:if>
                <c:if test="${sessionScope['account'].getRoles().getId() ==2}">
                    <li ><a href="DashboardURL" >Store Management</a></li>
                </c:if>
                <c:if test="${sessionScope['account']!=null}">
                    </li>
                    <li><a href="ProfileURL" style="color: black;" class="login-link" ><i class="biolife-icon icon-login"></i> Profile</a></li> <!-- Hi ${sessionScope['account'].getName()} -->
                </c:if>
                <c:if test="${sessionScope['account']==null}">
                    <li><a href="LoginURL" style="color: black;" class="login-link" style="color: black;"><i class="biolife-icon icon-login"></i>Login/SignUp</a></li>
                </c:if>
                <c:if test="${sessionScope['account']!=null}">
                    <li><a href="LogoutURL" style="color: black;" class="login-link" ><i class="fa fa-sign-out" style="font-size: 18px; margin-left: 10px;" aria-hidden="true"> </i> </a></li>
                </c:if>
            </ul>
        </div>

    </div>
</nav>