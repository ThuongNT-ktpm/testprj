/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Category;
import model.Product;

/**
 *
 * @author LEGION
 */
@WebServlet(name = "ProductServlet", urlPatterns = {"/product"})
public class ProductServlet extends HttpServlet {

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
            out.println("<title>Servlet ProductServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProductServlet at " + request.getContextPath() + "</h1>");
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
        ProductDAO dao = new ProductDAO();

        if (action == null) {
            action = "all";
        }
        if (action.equals("all")) {
            List<Product> list = dao.getAllProduct();
            request.setAttribute("listPro", list);
            request.getRequestDispatcher("view/product/product-list.jsp").forward(request, response);
        } else if (action.equals("add")) {
            dao.CategoryDAO cateDao = new dao.CategoryDAO();
            List<Category> listCate = cateDao.getAllCate();

            request.setAttribute("listCate", listCate);
            request.getRequestDispatcher("view/product/product-add.jsp").forward(request, response);

        } else if (action.equals("update")) {
            int id = Integer.parseInt(request.getParameter("id"));
            Product u = dao.getProById(id);
            request.setAttribute("listUpdate", u);
            dao.CategoryDAO cateDao = new dao.CategoryDAO();
            List<Category> listCate = cateDao.getAllCate();
            request.setAttribute("listCate", listCate);
            request.getRequestDispatcher("view/product/product-update.jsp").forward(request, response);

        } else if (action.equals("delete")) {
            int id = Integer.parseInt(request.getParameter("id"));
            dao.delete(id);
            response.sendRedirect(request.getContextPath() + "/product");
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
        ProductDAO dao = new ProductDAO();
        if (action == null) {
            action = "all";
        }
        if (action.equals("add")) {
            String proName = request.getParameter("name");
            double proPrice = Double.parseDouble(request.getParameter("price"));
            Integer proQuantity = Integer.parseInt(request.getParameter("quantity"));
            String cateName = request.getParameter("categoryName");
            dao.insert(proName, proPrice, proQuantity, cateName);
            response.sendRedirect(request.getContextPath() + "/product");

        } else if (action.equals("update")) {
            String proName = request.getParameter("proName");
            double proPrice = Double.parseDouble(request.getParameter("proPrice"));
            int proQuantity = Integer.parseInt(request.getParameter("proQuantity"));
            String cateName = request.getParameter("cateName");
            int proID = Integer.parseInt(request.getParameter("proId"));
            dao.update(proName, proPrice, proQuantity, cateName, proID);
            response.sendRedirect(request.getContextPath() + "/product");
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
