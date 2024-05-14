<%@ page import = 'jakarta.servlet.http.HttpServlet'%>
<%@ page import = 'jakarta.servlet.http.HttpServletRequest'%>
<%@ page import = 'jakarta.servlet.http.HttpServletResponse'%>
<%@ page import = 'jakarta.servlet.http.HttpServletResponse'%>
<%@ page import = 'jakarta.servlet.http.HttpSession' %>
<%@ page import = 'com.hospital.dashbord.dao.Database' %>
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

<div class="container p-5">
    <p class="text-center fs-3">Admin Dashboard</p>
     <% session =  request.getSession(false);
                            String message = (String)session.getAttribute("message");
                            Database database = new Database();
                            if(message!= null){
                         %>
                         <p class="fs-6 text-center text-primary "> <%= message%> </p>
                         <%
                          }
                         %>
                         <br>
    <div class="row">
        <div class="col-md-4 mt-2">
            <div class="card paint-card">
                <div class="card-body text-center text-success">
                    <i class="fas fa-user-md fa-4x"></i><br>
                    <p class=" fs-4 text-center">Doctors<br><%=database.doctorCount()%></p>
                </div>
            </div>
        </div>
        <div class="col-md-4 mt-2">
            <div class="card paint-card">
                <div class="card-body text-center text-success">
                    <i class="fas fa-user-circle fa-4x"></i><br>
                    <p class=" fs-4 text-center">Users<br><%=database.userCount()%></p>
                </div>
            </div>
        </div>
        <div class="col-md-4 mt-2">
            <div class="card paint-card">
                <div class="card-body text-center text-success">
                    <i class="far fa-calendar-check fa-4x"></i><br>
                    <p class=" fs-4 text-center">Appointment<br><%=database.appointmentCount()%></p>
                </div>
            </div>
        </div>
        <div class="col-md-4 mt-2">
            <div class="card paint-card" data-bs-toggle="modal" data-bs-target="#exampleModal">
                <div class="card-body text-center text-success">
                    <i class="fas fa-user-md fa-4x"></i><br>
                    <p class="fs-4 text-center">Specialist<br><%=database.specialistCount()%></p>
                </div>
            </div>
        </div>
    </div>
</div>



<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      <form action="..//specialistservlet" method = "post">
       <div class = "from-group">
       <label>Enter Specialiation </label>
       <input required type="text" name ="specialization" class="form-control">
       </div>
       <div class="text-center mt-2">
       <button class="btn btn-primary">Add</button>
      </div>
      <div class="modal-footer ">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>


</body>
</html>