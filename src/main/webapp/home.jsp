<%@ page import="Classes.User" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 17.10.2020
  Time: 17:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Home Page</title>
        <%  User user = (User) session.getAttribute("user");%>
</head>
<body>
<h1>Home Page</h1>
<h2>Hello <%=user.getLogin()%></h2>
<%
    if (user.getLogin() == null) {
    response.sendRedirect("register.jsp");
}%>
<a href="logout">Logout</a>
</body>
</html>
