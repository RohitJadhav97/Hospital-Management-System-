<%@ page import = 'jakarta.servlet.http.HttpServlet'%>
<%@ page import = 'jakarta.servlet.http.HttpServletRequest'%>
<%@ page import = 'jakarta.servlet.http.HttpServletResponse'%>
<%@ page import = 'jakarta.servlet.http.HttpServletResponse'%>
<%@ page import = 'jakarta.servlet.http.HttpSession' %>
<%@ page import = 'com.hospital.dashbord.dao.Database' %>
<%@ page import = 'java.util.List' %>
<%@ page import = 'com.hospital.dashbord.models.Doctors' %>
<%@ page import = 'com.hospital.dashbord.models.Appointment' %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>index Page</title>
    <%@include file = "../DirectivesTag/AllCSS.jsp"%>
    <style type="text/css">
            .paint-card{
                box-shadow: 0 0 10px 0 rgba(0 ,0, 0, 0.3);
            }
    </style>
</head>
<body>
 <%@include file = "navbar.jsp"%>
 <div class="container-fluid p-3">
       <div class="row">
        <div class="col-md-12">
         <div class="card paint-card">
         <div class="card-body">
       <br>
       <table class="table">
        <thead>
       <tr>
          <th scope="col">Full Name</th>
         <th scope="col">Age</th>
         <th scope="col">Gender</th>
         <th scope="col">Appointment Date</th>
         <th scope="col">Contact No.</th>
         <th scope="col">Disease</th>
         <th scope="col">Address</th>
         <th scope="col">Doctor Name</th>
         <th scope="col">Status</th>
       </tr>
   </thead>
    <tbody>
                <%
                 HttpSession session1 = request.getSession(false);
                 Database database1 = new Database();
                  List<Appointment> appointmentList = database1.getAllPatients();
                  if(!(appointmentList.isEmpty())){
                  for(Appointment patient : appointmentList){
                    Doctors doctor = patient.getDoctor();
                  %>
            <tr>
               <td><%= patient.getFullName()%></td>
               <td><%= patient.getAge()%></td>
               <td><%= patient.getGender()%></td>
               <td><%= patient.getAppointmentDate()%></td>
               <td><%= patient.getPhoneNo()%></td>
               <td><%= patient.getDisease()%></td>
               <td><%= patient.getAddress()%></td>
               <td><%= doctor.getFullName()%></td>
               <td><%= patient.getStatus()%></td>
            </tr>
         <%
                }
              }
         %>


    <tbody>
    </table>
   </div>
   </div>
   </div>
   </div>
   </div>