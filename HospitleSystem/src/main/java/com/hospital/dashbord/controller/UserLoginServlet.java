package com.hospital.dashbord.controller;

import com.hospital.dashbord.dao.Database;
import com.hospital.dashbord.models.Users;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/userLogin")
public class UserLoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        HttpSession session = req.getSession();
        Database database = new Database();
        Users user = database.getUser(username);
        if(user != null && user.getPassword().equals(password)){
            session.setAttribute("user",user);
            resp.sendRedirect("/index.jsp");
        }else {
            session.setAttribute("message","Invalid username/password");
            resp.sendRedirect("/user_login.jsp");
        }


    }
}
