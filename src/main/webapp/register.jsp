<%@ page import="Classes.User" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 17.10.2020
  Time: 17:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register Page</title>
    <%  User user = (User) session.getAttribute("user");
        if (user.getLogin() != null) {
            response.sendRedirect("home.jsp");
        }%>
    <script>
        function validate()
        {
            var login = document.form.login.value;
            var email = document.form.email.value;
            var password = document.form.password.value;
            var conpassword= document.form.password2.value;
            if (login==null || login=="")
            {
                alert("Login can't be blank");
                return false;
            }
            else if (email==null || email=="")
            {
                alert("Email can't be blank");
                return false;
            }

            else if(password.length < 6)
            {
                alert("Password must be at least 6 characters long.");
                return false;
            }
            else if (password != conpassword)
            {
                alert("Confirm Password should match with the Password");
                return false;
            }
        }
    </script>
</head>
<form method="post" name="form" action="register" onsubmit="return validate()">
    Login : <input type="text" name="login"><br>
    Email : <input type="email" name="email"><br>
    Password : <input type="password" name="password"><br>
    Confirm Password : <input type="password" name="password2"><br>
    <a href="login.jsp">Login</a>
    <input type="submit" value="Login">
</form>
</body>
</html>
