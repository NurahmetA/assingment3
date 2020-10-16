<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 13.10.2020
  Time: 15:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login Page</title>
</head>
<body>
<%if (session.getAttribute("login") != null) {
    response.sendRedirect("home.jsp");
}%>
<script>
    function validate()
    {
        var login = document.form.login.value;
        var password = document.form.password.value;

        if (login==null || login=="")
        {
            alert("Please enter your login");
            return false;
        }
        else if (password == null || password == "" || password != "admin123")
        {
            alert("Password is incorrect!");
            return false;
        }
    }
</script>
<form name="form" action="Servlets.LoginServlet" method="post" onsubmit="return validate()">
    Login :<input type="text" name="login"><br>
    Password :<input type="password" name="password"><br>
    <input type="submit" value="Login">
</form>
</body>
</html>
