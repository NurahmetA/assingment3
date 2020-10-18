package Servlets;

import Classes.User;
import Dao.UserDao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = addUser(response, request);
        UserDao userDao = new UserDao();
        try {
            User testUser = userDao.getById(user.getLogin());
            if (testUser.getLogin().equals(user.getLogin()) && testUser.getPassword().equals(user.getPassword())) {
                HttpSession session = request.getSession();
                session.setAttribute("user", user);
                request.getRequestDispatcher("home.jsp").forward(request,response);
            } else {
                String error = "Incorrect Password";
                request.setAttribute("error", error);
                request.getRequestDispatcher("login.jsp").forward(request,response);
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    private User addUser(HttpServletResponse response,HttpServletRequest request) {
        User user = new User();
        user.setLogin(request.getParameter("login"));
        user.setPassword(request.getParameter("password"));
        return user;
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
