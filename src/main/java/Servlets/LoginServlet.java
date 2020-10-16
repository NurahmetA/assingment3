package Servlets;

import Classes.Items;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "Servlets.LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String login = request.getParameter("login");
        String password = request.getParameter("password");
        HttpSession session = request.getSession();
        session.setAttribute("login", login);
        addItems(request,response);
        request.getRequestDispatcher("home.jsp").forward(request,response);
    }
    private void addItems(HttpServletRequest request, HttpServletResponse response) {
        ArrayList<Items> phones = new ArrayList<>();
        ArrayList<Items> headPhones = new ArrayList<>();
        Items iPhone = new Items("IPhone" , "399 990 KZT");
        Items SamsungS10 = new Items("SAMSUNG S10", "199 990 KZT");
        Items Redmi = new Items("Xiaomi Redmi Note 8", "73 990 KZT");
        phones.add(iPhone);
        phones.add(SamsungS10);
        phones.add(Redmi);
        request.setAttribute("phones", phones);
        request.setAttribute("headPhones", headPhones);
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
