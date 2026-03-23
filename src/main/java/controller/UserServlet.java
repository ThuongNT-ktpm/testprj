/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Cookie;
import java.util.ArrayList;
import java.util.List;
import model.User;

/**
 *
 * @author LEGION
 */
@WebServlet(name = "UserServlet", urlPatterns = { "/user" })
public class UserServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UserServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UserServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the
    // + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        UserDAO dao = new UserDAO();

        if (action == null) {
            action = "all";
        }
        if (action.equals("all")) {
            List<User> list = dao.getAllUser();
            request.setAttribute("listUser", list);
            request.getRequestDispatcher("view/user/user-list.jsp").forward(request, response);
        } else if (action.equals("add")) {
            List<User> list = dao.getAllUser();
            request.setAttribute("listUser", list);
            request.getRequestDispatcher("view/user/user-add.jsp").forward(request, response);

        } else if (action.equals("update")) {
            int id = Integer.parseInt(request.getParameter("id"));
            User u = dao.getUserById(id);

            request.setAttribute("listUpdate", u);
            request.getRequestDispatcher("view/user/user-update.jsp").forward(request, response);
        } else if (action.equals("detail")) {
            // Chỉ admin mới được xem detail
            String role = null;
            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                for (Cookie c : cookies) {
                    if (c.getName().equalsIgnoreCase("userRole")) {
                        role = c.getValue();
                        break;
                    }
                }
            }
            if (!"admin".equalsIgnoreCase(role)) {
                List<User> list = dao.getAllUser();
                request.setAttribute("listUser", list);
                request.getRequestDispatcher("view/user/user-list.jsp").forward(request, response);
                return;
            }
            int id = Integer.parseInt(request.getParameter("id"));
            User u = dao.getUserById(id);
            request.setAttribute("userDetail", u);
            request.getRequestDispatcher("view/user/user-detail.jsp").forward(request, response);
        } else if (action.equals("delete")) {
            int id = Integer.parseInt(request.getParameter("id"));
            dao.delete(id);
            response.sendRedirect(request.getContextPath() + "/user");

        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        UserDAO dao = new UserDAO();
        if (action == null) {
            action = "all";
        }
        if (action.equals("add")) {
            // int userID = Integer.parseInt(request.getParameter("userId"));
            String userName = request.getParameter("userName");
            String email = request.getParameter("userEmail");
            String pass = request.getParameter("userPass");
            String role = request.getParameter("userRole");
            dao.insert(userName, pass, email, role);
            response.sendRedirect(request.getContextPath() + "/user");

        } else if (action.equals("update")) {
            String userName = request.getParameter("userName");
            String email = request.getParameter("userEmail");
            String pass = request.getParameter("userPass");
            String role = request.getParameter("userRole");
            int id = Integer.parseInt(request.getParameter("userId"));
            dao.updateUser(userName, pass, email, role, id);
            response.sendRedirect(request.getContextPath() + "/user");
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
