        <%@ page import="Classes.Cart" %>
<%@ page import="java.util.Queue" %>
<%@ page import="Classes.Product" %>
<%@ page import="java.util.PriorityQueue" %>
<%@ page import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 18.10.2020
  Time: 18:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Home Page</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-lg" style="background-color: #e3f2fd;">
    <a class="navbar-brand" href="home.jsp">Boys of the GYM (Legendary Team)</a>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav">
            <li class="nav-item active">
                <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="cart.jsp">Cart <span class="sr-only">(current)</span></a>
            </li>
            <li>
                <a href="logout" class="btn btn-outline my-2 my-sm-0" type="submit">Log out</a>
            </li>
        </ul>
    </div>
</nav>
<div class="card mr-3" style="width: 18rem;">
    <div class="card-body">
        <c:forEach var="product" items="${myCart.getProductList()}">
        <h5 class="card-title"><c:out value="${product.getProductName()}"/></h5>
        <p class="card-text"><c:out value="${product.getProductPrice()}"/> KZT</p>
            <hr>
        </c:forEach>
        <h4 class="card-title">Price of all products</h4>
        <c:if test="${myCart != null}">
            <p class="card-text"> <c:out value="${myCart.showAllPrice()}"/> </p>
                <a href="home.jsp">BUY</a>
        </c:if>
        <c:if test="${myCart == null}">
            <p class="card-text">You have not add products to your cart!</p>
        </c:if>
    </div>
</div>
</body>
</html>
