/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.CustomerDAO;
import dao.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import model.Category;
import model.Customer;

/**
 *
 * @author LEGION
 */
@WebServlet(name = "CustomerServlet", urlPatterns = {"/customer"})
public class CustomerServlet extends HttpServlet {

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
            out.println("<title>Servlet CustomerServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CustomerServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the
    // + sign on the left to edit the code.">
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
        CustomerDAO dao = new CustomerDAO();
        if (action == null) {
            action = "all";
        }
        if (action.equals("all")) {
            List<Customer> list = dao.getAllCustomer();
            request.setAttribute("listCus", list);
            request.getRequestDispatcher("view/customer/customer-list.jsp").forward(request, response);
        } else if (action.equals("add")) {
            List<Customer> list = dao.getAllCustomer();
            request.setAttribute("listCus", list);
            request.getRequestDispatcher("view/customer/customer-add.jsp").forward(request, response);

        } else if (action.equals("update")) {
            int id = Integer.parseInt(request.getParameter("id"));
            Customer c = dao.getCustomerById(id);
            request.setAttribute("listCus", c);
            request.getRequestDispatcher("view/customer/customer-update.jsp").forward(request, response);
        } else if (action.equals("delete")) {
            int id = Integer.parseInt(request.getParameter("id"));
            dao.delete(id);
            response.sendRedirect(request.getContextPath() + "/customer");
        }

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        CustomerDAO dao = new CustomerDAO();
        if (action == null) {
            action = "all";
        } else if (action.equals("add")) {
            String cusName = request.getParameter("cusName");
            String cusPhone = request.getParameter("cusPhone");
            String cusAddress = request.getParameter("cusAddress");
            String cusEmail = request.getParameter("cusEmail");
            dao.insert(cusName, cusPhone, cusAddress, cusEmail);
            response.sendRedirect(request.getContextPath() + "/customer");
        } else if (action.equals("update")) {
            String cusName = request.getParameter("cusName");
            String cusPhone = request.getParameter("cusPhone");
            String cusAddress = request.getParameter("cusAddress");
            String cusEmail = request.getParameter("cusEmail");
            int cusId =Integer.parseInt(request.getParameter("cusId")) ;
            dao.update(cusName, cusPhone, cusAddress, cusEmail, cusId);
            response.sendRedirect(request.getContextPath() + "/customer");
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
