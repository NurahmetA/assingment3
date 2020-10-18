<%@ page import="Classes.User" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 17.10.2020
  Time: 17:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login Page</title>
</head>
<body>
<%  User user = (User) session.getAttribute("user");
    if (user.getLogin() != null) {
        response.sendRedirect("home.jsp");
    }%>
<script>
    function validate()
    {
        var login = document.form.login.value;
        var password = document.form.password.value;
        if (login == null || login == "")
        {
            alert("Login can't be blank");
            return false;
        }

        else if(password == null || password == "")
        {
            alert("Please enter your password!");
            return false;
        }
    }
</script>
</head>
<h2><%=(request.getAttribute("error") == null) ? ""
        : request.getAttribute("error")%></h2>
<form method="post" name="form" action="login" onsubmit="return validate()">
    Login : <input type="text" name="login"><br>
    Password : <input type="password" name="password"><br>
    <a href="register.jsp">Register</a>
    <input type="submit" value="Login">
</form>
</body>
</html>
