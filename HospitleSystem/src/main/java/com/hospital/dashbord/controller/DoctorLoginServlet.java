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

@WebServlet("/doctorLogin")
public class DoctorLoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String username = req.getParameter("username");
        String password = req.getParameter("password");
        HttpSession session = req.getSession();
        Database database = new Database();
        Doctors doctor = database.getDoctor(username);
        if(doctor!=null && doctor.getPassword().equals(password)){
            session.setAttribute("doctor",doctor);
            resp.sendRedirect("doctors/index.jsp");
        }else {
            session.setAttribute("message","Invalid username/password");
            resp.sendRedirect("/doctor_login.jsp");
        }

    }
}
