package com.hospital.dashbord.controller;

import com.hospital.dashbord.dao.Database;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
@WebServlet("/ChangePassword")
public class ChangePasswordServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session =null;
        //Change password For User ...
        if(req.getParameter("user").equals("user")){
            session = req.getSession(false);
            int id = Integer.parseInt(req.getParameter("id"));
            String oldPass = req.getParameter("oldPassword");
            String newPass = req.getParameter("newPassword");
            Database database = new Database();
           if(database.changeUserPassword(id,oldPass,newPass)){
               session.setAttribute("message","Password Change Successfully");
           }else {
               session.setAttribute("message","Please Enter Correct Old Password");
           }
            resp.sendRedirect("/changePassword.jsp");
        }
        //Change password For Doctor ...
        else{
            session = req.getSession(false);
            int id = Integer.parseInt(req.getParameter("id"));
            String oldPass = req.getParameter("oldPassword");
            String newPass = req.getParameter("newPassword");
            Database database = new Database();
            if(database.changeDoctorPassword(id,oldPass,newPass)){
                session.setAttribute("message","Password Change Successfully");
            }else {
                session.setAttribute("message","Please Enter Correct Old Password");
            }
            resp.sendRedirect("../doctors/changePassword.jsp");
        }
    }
}
