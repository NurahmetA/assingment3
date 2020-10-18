package Servlets;

import Classes.Cart;
import Classes.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "AddToCartServlet")
public class AddToCartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String name = request.getParameter("productName");
        int price = Integer.parseInt(request.getParameter("productPrice"));
        Cart myCart;
        Product product = new Product(name, price);
        if (session.getAttribute("myCart") == null) {
            myCart = new Cart();
            myCart.addProduct(product);
        } else {
            myCart = (Cart) session.getAttribute("myCart");
            myCart.addProduct(product);
        }
        session.setAttribute("myCart", myCart);
        session.setMaxInactiveInterval(60);
        response.sendRedirect("home.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
