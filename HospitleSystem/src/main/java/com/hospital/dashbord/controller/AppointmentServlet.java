package com.hospital.dashbord.controller;

import com.hospital.dashbord.dao.Database;
import com.hospital.dashbord.models.Appointment;
import com.hospital.dashbord.models.Doctors;
import com.hospital.dashbord.models.Users;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/appointmentServlet")
public class AppointmentServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        Users user = (Users) session.getAttribute("user");
        System.out.println("users: "+user);
        String fullName = req.getParameter("fullName");
        String gender = req.getParameter("gender");
        int age = Integer.parseInt(req.getParameter("age"));
        String appointmentDate = req.getParameter("appointmentDate");
        String email = req.getParameter("email");
        String phoneNo = req.getParameter("phoneNumber");
        String diseases = req.getParameter("diseases");
        int doctorId = Integer.parseInt(req.getParameter("doctorId"));
        System.out.println("DoctorID: " +doctorId);
        String address = req.getParameter("address");
        Database database = new Database();
        Doctors doctor =  database.getDoctor(doctorId);
        Appointment appointment = new Appointment(fullName,gender,age,appointmentDate,email,phoneNo,diseases,address,"Pending");
        if(database.bookAppointment(appointment,user,doctor)){
            session.setAttribute("message","Appointment Booked Successfully");

        }else {
            session.setAttribute("message","Something Went Wrong On server");
        }
        resp.sendRedirect("/appointment.jsp");
    }
}
