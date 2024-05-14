package com.hospital.dashbord.controller;

import com.hospital.dashbord.dao.Database;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
@WebServlet("/adminLogin")
public class AdminLoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        HttpSession session = req.getSession();
//        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/admin/index.jsp");
//        RequestDispatcher requestDispatcher1 = req.getRequestDispatcher("admin_login.jsp");

        if(username.equals("Admin@gmail.com") && password.equals("Admin") && session.getAttribute("username")== null){
            session.setAttribute("username","Admin");
//            requestDispatcher.forward(req,resp);
            resp.sendRedirect("/admin/index.jsp");

        }else {
            session.setAttribute("message","Invalid Email/password");
//            requestDispatcher1.forward(req,resp);
            resp.sendRedirect("admin_login.jsp");
        }

    }
}
