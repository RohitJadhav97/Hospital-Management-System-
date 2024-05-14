package com.hospital.dashbord.controller;

import com.hospital.dashbord.dao.Database;
import com.hospital.dashbord.models.Doctors;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
@WebServlet("/updateDoctor")
public class update_Delete_Doctor extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String fullName = req.getParameter("fullname");
        String dob = req.getParameter("dob");
        String qualification = req.getParameter("qualification");
        String specilalist = req.getParameter("specialist");
        String email = req.getParameter("email");
        String mobno = req.getParameter("mobile");
        String password = req.getParameter("password");
        Doctors doctor = new Doctors(fullName, dob, qualification, specilalist, email, mobno, password);
        doctor.setId(Integer.parseInt(req.getParameter("id")));
        Database database = new Database();
        HttpSession session = req.getSession(false);


        if (req.getParameter("action").equals("del")) {
            if(database.deleteDoctor(doctor)){
                session.setAttribute("message", "Doctor Deleted Successfully");
            } else {
                session.setAttribute("message", "Doctor Deleted Unsuccessfully/Please Tyr Again");
            }
            resp.sendRedirect("../admin/viewDoctor.jsp");

        } else {
            if (database.updateDoctor(doctor)) {
                session.setAttribute("message", "Doctor Updated Successfully");
            } else {
                session.setAttribute("message", "Doctor Updated Unsuccessfully/Please Tyr Again");
            }
            resp.sendRedirect("../admin/viewDoctor.jsp");
        }
    }
}
