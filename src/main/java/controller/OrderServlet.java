/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Customer;
import model.Order;

/**
 *
 * @author LEGION
 */
@WebServlet(name = "OrderServlet", urlPatterns = {"/order"})
public class OrderServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet OrderServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OrderServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        dao.OrderDAO orderDAO = new dao.OrderDAO();
        dao.CustomerDAO customerDAO = new dao.CustomerDAO();

        if (action == null) {
            action = "list";
        }
        if (action.equals("list")) {
            List<Order> list = orderDAO.getAll();
            request.setAttribute("listOrder", list);
            request.getRequestDispatcher("view/order/order-list.jsp")
                    .forward(request, response);
        } else if (action.equals("add")) {
            request.setAttribute("customers", customerDAO.getAllCustomer());
            request.getRequestDispatcher("view/order/order-add.jsp")
                    .forward(request, response);
        } else if (action.equals("edit")) {
            int id = Integer.parseInt(request.getParameter("id"));
            Order order = orderDAO.getById(id);

            request.setAttribute("order", order);
            request.setAttribute("customers", customerDAO.getAllCustomer());

            request.getRequestDispatcher("view/order/order-update.jsp")
                    .forward(request, response);
        } else if (action.equals("delete")) {
            int id = Integer.parseInt(request.getParameter("id"));
            orderDAO.delete(id);
            response.sendRedirect("order?action=list");
        } else {
            response.sendRedirect("order?action=list");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        dao.OrderDAO orderDAO = new dao.OrderDAO();
        if (action == null) {
            action = "add";
        }
        if (action.equals("add")) {
            String date = request.getParameter("date");
            double total = Double.parseDouble(request.getParameter("total"));
            String status = request.getParameter("status");
            int cusId = Integer.parseInt(request.getParameter("cusId"));
            Order o = new Order();
            o.setOrderDate(date);
            o.setOrderTotal_price(total);
            o.setOrderStatus(status);
            Customer c = new Customer();
            c.setCusId(cusId);
            o.setCusId(c);
            orderDAO.insert(o);
            response.sendRedirect("order?action=list");
        } else if (action.equals("edit")) {
            int id = Integer.parseInt(request.getParameter("id"));
            String date = request.getParameter("date");
            double total = Double.parseDouble(request.getParameter("total"));
            String status = request.getParameter("status");
            int cusId = Integer.parseInt(request.getParameter("cusId"));
            Order o = new Order();
            o.setOrderID(id);
            o.setOrderDate(date);
            o.setOrderTotal_price(total);
            o.setOrderStatus(status);
            Customer c = new Customer();
            c.setCusId(cusId);
            o.setCusId(c);
            orderDAO.update(o);
            response.sendRedirect("order?action=list");
        } else {
            response.sendRedirect("order?action=list");
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
