<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="Classes.User" %>
<%@ page import="Classes.Product" %>
<%@ page import="java.util.*" %>
<%@ page import="Classes.Cart" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 17.10.2020
  Time: 17:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<html>
<head>
    <title>Home Page</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
</head>
<body>
<%
    Hashtable<String, Set<Product>> categories = new Hashtable<>();
    HashSet<Product> food = new HashSet();
    HashSet<Product> gadgets = new HashSet();
    HashSet<Product> clothes = new HashSet();
    Product pants = new Product("Abibas trousers", 2500);
    Product sneakers = new Product("Rita sneakers", 3300);
    Product sportivka  = new Product("NAKE clothes", 4000);
    Product kepka  = new Product("Reedok hat", 2000);
    Product ochki = new Product("Glasses" , 3000);
    clothes.add(pants);
    clothes.add(sneakers);
    clothes.add(sportivka);
    clothes.add(kepka);
    clothes.add(ochki);
    Product appleWatch = new Product("Apple Watch", 215000);
    Product iAlma = new Product("ApplePhone", 250000);
    Product redmi = new Product("Xiaomi Redmi Note 8", 71000);
    Product huawei = new Product("Huawei" , 80000);
    gadgets.add(appleWatch);
    gadgets.add(iAlma);
    gadgets.add(redmi);
    gadgets.add(huawei);
    Product alpenGold = new Product("Alpen Gold", 300);
    Product kazakhstan = new Product("Kazakhstan chocolate", 400);
    Product kurt = new Product("Qurt", 1000000);
    food.add(alpenGold);
    food.add(kazakhstan);
    food.add(kurt);
    categories.put("Clothes", clothes);
    categories.put("Gadgets", gadgets);
    categories.put("Food", food);
    request.setAttribute("products", categories);
    String category = request.getParameter("category");
    request.setAttribute("category", category);
%>
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
    <%  String login = "";
    Cookie[] ck = request.getCookies();
    for(Cookie i : ck) {
        if (i.getName().compareTo("login") == 0) {
            login = i.getValue();
        }
    }%>
<body>
<!--Checking the cookie-->
<%if (login.equals("")) {
    response.sendRedirect("login.jsp");
}
else {%>
<h1 class="text-center">Home Page</h1>
<h2 class="text-center">Hello <%=login%></h2>
<%}%>
<div class="ml-3 border border-danger">
    <!--Showing categories-->
    <div class="m-5">
    <h3>Category of products :</h3>
    <c:if test="${category == null}">
        <c:forEach var="product" items="${products.keySet()}">
            <a href="home.jsp?category=${product}" class="btn btn-lg btn-danger m-3" role="button">
                <c:out value="${product}"/>
            </a><br>
        </c:forEach>
    </c:if>
    <!--Showing products in categories-->
    <c:if test="${category != null}">
        <div class="col-12 d-flex m-3">
            <c:forEach var="product" items="${products.get(category)}">
                <form action="addToCart" method="post" style="width: 250px;" class="card mr-3">
                    <div class="card-body">
                        <b><p class="card-title text-danger">Product Name: <br> <c:out value="${product.getProductName()}"/></p></b>
                        <p class="card-text">Product Price: <br><c:out value="${product.getProductPrice()}"/>KZT</p>
                        <input type="submit" class="btn btn-danger btn-lg" value="Add to Cart"><br>
                        <input type="hidden" name="productName" value="${product.getProductName()}">
                        <input type="hidden" name="productPrice" value="${product.getProductPrice()}">
                    </div>
                </form>
                <br>
            </c:forEach>
        </div>
    </c:if>
    </div>
</div>
<style>
    .footer {
        position: fixed;
        bottom: 0;
        width: 100%;
        height: 60px;
        line-height: 60px;
        background-color: #e3f2fd;
        color:#FFF;
    }
</style>
<%String emailValue = application.getInitParameter("email");%>
<footer class="footer">
    <div class="container">
        <span class="text-muted"><%=emailValue%></span><br>
    </div>
</footer>
</body>
</html>
