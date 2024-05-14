<%@ page import = 'jakarta.servlet.http.HttpServlet'%>
<%@ page import = 'jakarta.servlet.http.HttpServletRequest'%>
<%@ page import = 'jakarta.servlet.http.HttpServletResponse'%>
<%@ page import = 'jakarta.servlet.http.HttpServletResponse'%>
<%@ page import = 'jakarta.servlet.http.HttpSession' %>
<%@ page import = 'com.hospital.dashbord.dao.Database' %>
<%@ page import = 'java.util.List' %>
<%@ page import = 'com.hospital.dashbord.models.Doctors' %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>index Page</title>
    <%@include file = "DirectivesTag/AllCSS.jsp"%>
    <style type="text/css">
            .paint-card{
                box-shadow: 0 0 10px 0 rgba(0 ,0, 0, 0.3);
            }
            .backImage{
             background-image:url("images/background_image.jpg");
             background-size: cover;
             background-repeat : no-repeat;

            }
    </style>
</head>
<body>
  <%@include file = "DirectivesTag/Navbar.jsp"%>
  <div class="container p-3 backImage">
      <div class="row">
          <div  class="col-md-6 ">
              <div class="card paint-card">
                  <div class="card-body">
                      <p class="fs-4 text-center">User Appointment</p>
                      <% HttpSession session1 = request.getSession(false);
                         Users user1 = (Users) session1.getAttribute("user");
                      String message = (String)session.getAttribute("message");
                       if(message!= null){
                      %>
                      <p class="fs-6 text-center text-danger "> <%= message%> </p>
                      <%
                      session.setAttribute("message",null);
                      }
                      %>
                      <form class="row g-3" action="/appointmentServlet" method="post">
                          <div class="col-md-6">

                              <label class="form-label">Full Name</label><input required
                                name="fullName" type="text" class="form-control">
                          </div>
                          <div class=" col-md-6">
                              <label class="form-label">Gender</label><input required
                                name="gender" type="text" class="form-control">
                          </div>
                          <div class="col-md-6">
                              <label class="form-label">Age</label><input required
                                  name="age" type="number" class="form-control">
                          </div>
                          <div class="col-md-6">
                              <label class="form-label">Appointment Date</label><input required
                                 name="appointmentDate" type="date" class="form-control">
                          </div>
                          <div class="col-md-6">
                              <label class="form-label">Email</label><input required
                                 name="email" type="email" class="form-control">
                          </div>
                          <div class="col-md-6">
                              <label class="form-label">Phone Number</label><input required
                                   name="phoneNumber" type="number" class="form-control">
                          </div>
                          <div class="col-md-6">
                              <label class="form-label">Diseases</label><input required
                               name="diseases" type="text" class="form-control">
                          </div>
                          <div class="col-md-6">
                              <label class="form-label">Doctor</label><select required
                               name="doctorId"  class="form-control">
                               <option value="">--Select--</option>
                               <% Database database = new Database();
                               List<Doctors> list = database.getAllDoctors();
                               for(Doctors doctor: list){
                              %>
                             <option value="<%=doctor.getId()%>">Dr.<%=doctor.getFullName()%> (<%=doctor.getSpecilalist()%>)</option>
                               <%
                               }
                               %>

                          </select>
                          </div>
                          <div class="col-md-12">
                              <label class="form-label">Full Address</label><textarea required
                                 name="address" rows="3" type="text" class="form-control"></textarea>
                          </div>

                          <button type="submit" class="btn bg-primary col-md-6 offset-md-3">Submit</button>
                      </form>
                  </div>
              </div>
          </div>
      </div>
  </div>
<%@include file = "../DirectivesTag/Footer.jsp"%>
</body>
</html>