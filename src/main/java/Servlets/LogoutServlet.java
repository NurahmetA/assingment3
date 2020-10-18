package Servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet(name = "LogoutServlet")
public class LogoutServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Cookie[] ck = request.getCookies();
        for(Cookie i : ck) {
            if (i.getName().compareTo("login") == 0) {
                i.setValue(null);
                i.setMaxAge(0);
                response.addCookie(i);
            }
        }
        response.sendRedirect("login.jsp");
    }
}
