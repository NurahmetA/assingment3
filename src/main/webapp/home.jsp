<%@ page import="java.util.ArrayList" %>
<%@ page import="Classes.Items" %>
<%@ page import="java.io.PrintWriter" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 13.10.2020
  Time: 15:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%
        ArrayList<Items> phones = (ArrayList<Items>) request.getAttribute("phones");
        ArrayList<Items> headPhones = (ArrayList<Items>) request.getAttribute("headPhones");
    %>
    <title>Home</title>
</head>
<%if (session.getAttribute("login") == null) {
    response.sendRedirect("login.jsp");
}%>
<body>
<h1>Hello <%=session.getAttribute("login")%></h1>
<a href="Servlets.LogoutServlet">Logout</a>
<div class="container">
    <%for (Items phone : phones) { %>
    <h2>ITEM NAME :<%=phone.getItemName()%> <br></h2>
    <h2>ITEM PRICE :<%=phone.getItemPrice()%> <br></h2>
    <hr>
    <%} %>
</div>
</body>
</html>
