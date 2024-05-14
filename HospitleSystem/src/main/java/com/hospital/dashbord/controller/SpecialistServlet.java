package com.hospital.dashbord.controller;

import com.hospital.dashbord.dao.Database;
import com.hospital.dashbord.models.Specialist;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;


@WebServlet("/specialistservlet")
public class SpecialistServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String specialization = req.getParameter("specialization");
        Specialist specialist = new Specialist(specialization);
        HttpSession session = req.getSession(false);
        Database database = new Database();
        if(database.addSpecialist(specialist)){
            session.setAttribute("message","Specialist Added Successfully");
        }else {
            session.setAttribute("message","Specialist already Available Or Something Went wrong");
        }
        resp.sendRedirect("/admin/index.jsp");

    }
}
