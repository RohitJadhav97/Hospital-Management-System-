<%@ page import = 'com.hospital.dashbord.dao.Database' %>
<%@ page import = 'java.util.List' %>
<%@ page import = 'com.hospital.dashbord.models.Specialist' %>
<%@ page import = 'com.hospital.dashbord.models.Doctors' %>
<%@ page import = 'jakarta.servlet.http.HttpServlet'%>
<%@ page import = 'jakarta.servlet.http.HttpServletRequest'%>
<%@ page import = 'jakarta.servlet.http.HttpServletResponse'%>
<%@ page import = 'jakarta.servlet.http.HttpServletResponse'%>
<%@ page import = 'jakarta.servlet.http.HttpSession' %>
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
          <div class="col-md-4 offset-md-4">
              <div class="card paint-card">
                  <div class="card-body">
                      <p class="fs-3 text-center"> Add Doctor</p>
                      <% session =  request.getSession(false);
                       String message = (String)session.getAttribute("message");
                         if(message!= null){
                      %>
                      <p class="fs-6 text-center text-primary "> <%= message%> </p>
                      <%
                       }
                      %>
                     <br>
                      <form action="../signup" method="post">
                          <div class="mb-3">
                              <label class="form-label">Full Name</label><input type="text"
                                required name="fullname" class="form-control">
                          </div>
                          <div class="mb-3">
                              <label class="form-label">DOB</label><input type="date"
                                required name="dob" class="form-control">
                          </div>
                          <div class="mb-3">
                              <label class="form-label">Qualification</label><input type="text"
                                 required name="qualification" class="form-control">
                          </div>
                          <div class="mb-3">
                              <label class="form-label">Specialist</label><select name="specialist"
                                required class="form-control">
                                <% Database database = new Database();
                                   List<String> list = database.getSpecialist();
                                   for(String specialist: list){
                                %>
                                       <option><%=specialist%></option>
                                <%
                                }
                                %>
                          </select>

                          </div>
                          <div class="mb-3">
                              <label class="form-label">Email</label><input type="email"
                                required name="email" class="form-control">
                          </div>
                          <div class="mb-3">
                              <label class="form-label">Mobile no.</label><input type="text"
                                required name="mobile" class="form-control">
                          </div>
                          <div class="mb-3">
                              <label class="form-label">Password</label><input type="password"
                                required name="password" class="form-control">
                          </div>
                          <button type="submit" class="btn btn-primary">Submit</button>
                      </form>

                  </div>
              </div>
          </div>


      </div>

  </div>




</body>
</html>