package Servlets;

import Classes.User;
import Dao.UserDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "RegisterServlet")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserDao userDao = new UserDao();
        User user = addUser(response,request);
        try {
            userDao.add(user);
            response.sendRedirect("login.jsp");
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
    private User addUser(HttpServletResponse response,HttpServletRequest request) {
        User user = new User();
        user.setLogin(request.getParameter("login"));
        user.setEmail(request.getParameter("email"));
        user.setPassword(request.getParameter("password"));
        return user;
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
