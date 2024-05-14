<%@ page import = 'jakarta.servlet.http.HttpServlet'%>
<%@ page import = 'jakarta.servlet.http.HttpServletRequest'%>
<%@ page import = 'jakarta.servlet.http.HttpServletResponse'%>
<%@ page import = 'jakarta.servlet.http.HttpServletResponse'%>
<%@ page import = 'jakarta.servlet.http.HttpSession' %>
<%@ page import = 'com.hospital.dashbord.dao.Database' %>
<%@ page import = 'java.util.List' %>
<%@ page import = 'com.hospital.dashbord.models.Doctors' %>
<%@ page import = 'com.hospital.dashbord.models.Appointment' %>
<% session =  request.getSession(false);
     if(session.getAttribute("doctor")==null){
       response.sendRedirect("../doctor_login.jsp");
     }
  %>

<%@include file = "index.jsp"%>
                     <% HttpSession session2 = request.getSession(false);
                      String message = (String)session2.getAttribute("message");
                       if(message!= null){
                      %>
                      <p class="fs-6 text-center text-danger "> <%= message%> </p>
                      <%
                      session.setAttribute("message",null);
                      }
                      %>
<div class="container-fluid p-3">
      <div class="row">
       <div class="col-md-12">
        <div class="card paint-card">
        <div class="card-body">
      <br>
      <table class="table">
       <thead>
      <tr>
         <th scope="col">Patient Name</th>
        <th scope="col">Age</th>
        <th scope="col">Gender</th>
        <th scope="col">Appointment Date</th>
        <th scope="col">Disease</th>
        <th scope="col">Contact No.</th>
        <th scope="col">Status</th>
        <th scope="col">Comment</th>
     </tr>
  </thead>
   <tbody>
              <%
              HttpSession session1 = request.getSession(false);
              Doctors doctor = (Doctors) session1.getAttribute("doctor");
              Database database1 = new Database();
               List<Appointment> list1 = database1.getAllPatients(doctor.getId());
               if(!(list1.isEmpty())){
               for(Appointment patient : list1){
               %>
               <tr>
                 <td><%= patient.getFullName() %></td>
                 <td><%= patient.getAge() %></td>
                 <td><%= patient.getGender()%></td>
                 <td><%= patient.getAppointmentDate()%></td>
                 <td><%= patient.getDisease()%></td>
                 <td><%= patient.getPhoneNo()%></td>
                 <td><%= patient.getStatus()%></td>
               <td>
               <%
                   if(patient.getStatus().equals("pending")){
               %>
               <a href="comment.jsp?id=<%=patient.getId()%>" class="btn btn-sm btn-primary">Comment</a>
               <%
                    }else{
               %>
               <a href="#" class="btn btn-sm btn-primary disabled">Commented</a>
               <%
                   }
               %>
                </td>
             </tr>
             <%
             }
              }
             %>
               </tbody>

     </table>
   </div>
   </div>
   </div>
   </div>
   </div>