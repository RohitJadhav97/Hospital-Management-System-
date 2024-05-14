package com.hospital.dashbord.controller;

import com.hospital.dashbord.dao.Database;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
@WebServlet("/patientComment")
public class PatientCommentServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
       String comment = req.getParameter("comment");
       int id = Integer.parseInt(req.getParameter("id"));
//        System.out.println("servlet called id "+id+"comment "+comment);
        Database database = new Database();
        if(database.updateStatus(id,comment)){
            session.setAttribute("message","Comment Successfully");
            resp.sendRedirect("/doctors/showPatients.jsp");
        }
        else {
            session.setAttribute("message","Comment Unsuccessfully");
            resp.sendRedirect("/doctors/comment.jsp?id="+id);
        }
    }
}
