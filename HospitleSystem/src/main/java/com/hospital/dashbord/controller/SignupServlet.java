package com.hospital.dashbord.controller;

import com.hospital.dashbord.dao.Database;
import com.hospital.dashbord.models.Doctors;
import com.hospital.dashbord.models.Users;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/signup")
public class SignupServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        Database database = new Database();
        if(req.getParameter("specialist") == null) {
            String fullName =  req.getParameter("fullName");
            String username = req.getParameter("username");
            String password = req.getParameter("password");
            Users users = new Users(fullName,username,password);
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("signup.jsp");
            HttpSession session = req.getSession();

            //PrintWriter out = resp.getWriter();
            resp.setContentType("text/html");
            if (database.userRegister (users)) {
                // out.write("<p class=\"fs-2 text-center\">User Register Successfully </p>");
                session.setAttribute("massage", "User Register Successfully");
                requestDispatcher.forward(req, resp);
            } else {
                // out.write("<p class=\"fs-2 text-center\">User Register Unsuccessfully </p>");
                session.setAttribute("massage", "User Register Unsuccessfully");
                requestDispatcher.forward(req, resp);
            }
        }else {
            String fullName = req.getParameter("fullname");
            String dob = req.getParameter("dob");
            String qualification = req.getParameter("qualification");
            String specilalist = req.getParameter("specialist");
            String email = req.getParameter("email");
            String mobno = req.getParameter("mobile");
            String password = req.getParameter("password");
            Doctors doctor = new Doctors(fullName,dob,qualification,specilalist,email,mobno,password);
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("admin/addDoctor.jsp");
            HttpSession session = req.getSession(false);

            //PrintWriter out = resp.getWriter();
            resp.setContentType("text/html");
            if (database.doctorRegister(doctor)) {
                // out.write("<p class=\"fs-2 text-center\">User Register Successfully </p>");
                session.setAttribute("massage", "Doctor Added Successfully");
                requestDispatcher.forward(req, resp);
            } else {
                // out.write("<p class=\"fs-2 text-center\">User Register Unsuccessfully </p>");
                session.setAttribute("massage", "Doctor Added Unsuccessfully");
                requestDispatcher.forward(req, resp);
            }
        }

    }
}
