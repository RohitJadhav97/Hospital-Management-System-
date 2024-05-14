package com.hospital.dashbord.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
@WebServlet("/logoutServlet")
public class AdminLogut  extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if(session.getAttribute("username")!=null && session.getAttribute("username").equals("Admin")){
            session.setAttribute("username","-1");
            session.setAttribute("message","Admin Logout Successfully");
            resp.sendRedirect("../admin_login.jsp");
        }
        if(session.getAttribute("user")!=null){
           session.setAttribute("user",null);
            session.setAttribute("message","User Logout Successfully");
            resp.sendRedirect("../user_login.jsp");
        }

    }
}
