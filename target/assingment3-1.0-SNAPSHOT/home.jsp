<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 13.10.2020
  Time: 15:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Home</title>
</head>
<%if (session.getAttribute("login") == null) {
    response.sendRedirect("login.jsp");
}%>
<body>
<h1>Hello <%=session.getAttribute("login")%></h1>
<a href="LogoutServlet">Logout</a>
</body>
</html>
