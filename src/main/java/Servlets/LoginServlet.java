package Servlets;

import Classes.User;
import Dao.UserDao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@WebServlet(name = "LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = addUser(response, request);
        UserDao userDao = new UserDao();
        try {
            User testUser = userDao.getById(user.getLogin());
            // Validation of Login
            if (testUser.getLogin().equals(user.getLogin()) && testUser.getPassword().equals(user.getPassword())) {
                Cookie cookie = new Cookie("login",user.getLogin());
                cookie.setMaxAge(300);
                response.addCookie(cookie);
                File f = new File(getServletContext().getInitParameter("root") + "\\usersCheck.txt");
                RandomAccessFile file = new RandomAccessFile(f, "rw");
                DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd-MM-yyyy, HH-mm");
                LocalDateTime time = LocalDateTime.now();
                int lines = LinesForSkip(file);
                for (int i = 0; i < lines; i++) {
                    file.readLine();
                }
                file.writeBytes("User : " + user.getLogin() + "\t");
                file.writeBytes("Time :" + time + "\n");
                file.close();
                response.sendRedirect("home.jsp");
            } else {
                String error = "Incorrect Password";
                request.setAttribute("error", error);
                response.sendRedirect("login.jsp");
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
    private int LinesForSkip(RandomAccessFile f) {
        try {
            int length = 1;
            for (int i = 0; f.readLine() != null; i++) {
                length++;
            }
            return length;
        } catch (IOException e) {
            e.printStackTrace();
        }
        return 0;
    }
    // Encapsulation
    private User addUser(HttpServletResponse response,HttpServletRequest request) {
        User user = new User();
        user.setLogin(request.getParameter("login"));
        user.setPassword(request.getParameter("password"));
        return user;
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
