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
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

/**
 *
 * @author LEGION
 */
@WebServlet(name = "LoginServlet", urlPatterns = { "/login" })
public class LoginServlet extends HttpServlet {

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
            out.println("<title>Servlet LoginServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginServlet at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("view/auth/login.jsp").forward(request, response);
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
        String username = request.getParameter("user");
        String password = request.getParameter("pass");
        UserDAO dao = new UserDAO();
        User u = dao.login(username, password);
        if (u == null) {
            request.setAttribute("error", "Sai tài khoản hoặc mật khẩu");
            request.getRequestDispatcher("view/auth/login.jsp").forward(request, response);
        } else {
            Cookie cookieId = new Cookie("userId", u.getUserId()+"");
            String safeUserName = u.getUserName() != null ? u.getUserName().replace(" ", "_").replaceAll("[^a-zA-Z0-9_]", "") : "Unknown";
            Cookie cookieUsername = new Cookie("userName", safeUserName);
            String safeRole = u.getUserRole() != null ? u.getUserRole().replace(" ", "_").replaceAll("[^a-zA-Z0-9_]", "") : "User";
            Cookie cookieRole = new Cookie("userRole", safeRole);
           // Cookie cookiePassword = new Cookie("userPassword", u.getUserPassword());
            // Cookie cookieFullname = new Cookie("userFullName",
            // u.getUserFullName().replace(" ", "_"));

             cookieId.setMaxAge(60 * 60 * 24); //24h
            cookieUsername.setMaxAge(60 * 60); // 1h
            cookieRole.setMaxAge(60 * 60);
          //  cookiePassword.setMaxAge(60 * 30); // 30p
            // cookieFullname.setMaxAge(60 * 30); //30p

            cookieUsername.setPath("/");
            cookieId.setPath("/");
            cookieRole.setPath("/");
          //  cookiePassword.setPath("/");

             response.addCookie(cookieId);
            response.addCookie(cookieUsername);
            response.addCookie(cookieRole);
          //  response.addCookie(cookiePassword);
            // response.addCookie(cookieFullname);

            response.sendRedirect("dashboard");
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
