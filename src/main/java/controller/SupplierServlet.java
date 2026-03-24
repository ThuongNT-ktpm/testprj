/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dao.SupplierDAO;
import model.Supplier;

import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author LEGION
 */
@WebServlet(name="SupplierServlet", urlPatterns={"/supplier"})
public class SupplierServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String action = request.getParameter("action");
        SupplierDAO dao = new SupplierDAO();
        if (action == null) {
            action = "all";
        }
        
        try {
            if (action.equals("all")) {
                List<Supplier> list = dao.getAllSuppliers();
                request.setAttribute("listSup", list);
                request.getRequestDispatcher("view/supplier/supplier-list.jsp").forward(request, response);
            } else if (action.equals("add")) {
                request.getRequestDispatcher("view/supplier/supplier-add.jsp").forward(request, response);
            } else if (action.equals("update")) {
                int id = Integer.parseInt(request.getParameter("id"));
                Supplier s = dao.getSupplierById(id);
                request.setAttribute("listUpdate", s);
                request.getRequestDispatcher("view/supplier/supplier-update.jsp").forward(request, response);
            } else if (action.equals("delete")) {
                int id = Integer.parseInt(request.getParameter("id"));
                dao.delete(id);
                response.sendRedirect(request.getContextPath() + "/supplier");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String action = request.getParameter("action");
        SupplierDAO dao = new SupplierDAO();
        
        try {
            if (action == null || action.equals("add")) {
                String name = request.getParameter("supName");
                String phone = request.getParameter("supPhone");
                String address = request.getParameter("supAddress");
                String email = request.getParameter("supEmail");
                dao.insert(name, phone, address, email);
                response.sendRedirect(request.getContextPath() + "/supplier");
            } else if (action.equals("update")) {
                String name = request.getParameter("supName");
                String phone = request.getParameter("supPhone");
                String address = request.getParameter("supAddress");
                String email = request.getParameter("supEmail");
                int id = Integer.parseInt(request.getParameter("supId"));
                dao.update(name, phone, address, email, id);
                response.sendRedirect(request.getContextPath() + "/supplier");
            }
        } catch (Exception e) {
          
        }
    }

    @Override
    public String getServletInfo() {
        return "Supplier Servlet";
    }

}
