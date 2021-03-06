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
    <!--Checking the cookie-->
    <title>Register Page</title>
    <%  String login = "";
        Cookie[] ck = request.getCookies();
        for(Cookie i : ck) {
            if (i.getName().compareTo("login") == 0) {
                login = i.getValue();
            }
        }
        if (login != "") {
            response.sendRedirect("home.jsp");
        }%>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
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
<!--Register form-->
<form class="m-3" method="post" name="form" action="login" onsubmit="return validate()">
    <div class="form-group">
        <label for="exampleInputLogin">Login</label>
        <input type="text" class="form-control" name="login" id="exampleInputLogin" aria-describedby="loginHelp" placeholder="Enter login">
    </div>
    <div class="form-group">
        <label for="exampleInputEmail1">Email</label>
        <input type="email" class="form-control" name="email" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
    </div>
    <div class="form-group">
        <label for="exampleInputPassword1">Password</label>
        <input type="password" name="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
    </div>
    <div class="form-group">
        <label for="exampleInputPassword2">Confirm Password</label>
        <input type="password" name="password2" class="form-control" id="exampleInputPassword2" placeholder="Password">
    </div>
    <a href="login.jsp">Login</a>
    <input type="submit" class="btn btn-primary" value="Register">
</form>
</body>
</html>
