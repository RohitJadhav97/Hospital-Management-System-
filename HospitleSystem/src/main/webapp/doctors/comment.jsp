<%@ page import = 'jakarta.servlet.http.HttpServlet'%>
<%@ page import = 'jakarta.servlet.http.HttpServletRequest'%>
<%@ page import = 'jakarta.servlet.http.HttpServletResponse'%>
<%@ page import = 'jakarta.servlet.http.HttpServletResponse'%>
<%@ page import = 'jakarta.servlet.http.HttpSession' %>
<%@ page import = 'com.hospital.dashbord.models.Appointment' %>
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
                .backImage{
                 background-image:url("images/background_image.jpg");
                 background-size: cover;
                 background-repeat : no-repeat;

                }
        </style>
</head>
<body>
<% session =  request.getSession(false);
     if(session.getAttribute("doctor")==null){
       response.sendRedirect("../doctor_login.jsp");
     }
  %>
 <% HttpSession  session1 =  request.getSession(false);
     if(session.getAttribute("doctor")==null){
       response.sendRedirect("../doctor_login.jsp");
     }
  %>
  <%@include file = "navbar.jsp"%>
                        <%
                        String message = (String)session.getAttribute("message");
                         if(message!= null){
                        %>
                        <p class="fs-6 text-center text-danger "> <%= message%> </p>
                        <%
                        session.setAttribute("message",null);
                        }
                        %>

  <div >
        <div class="row">
            <div  class="col-md-6 offset-md-3">
                <div class="card paint-card">
                    <div class="card-body">
                        <p class="fs-4 text-center">Patient Comment</p>
                        <%
                        int id = Integer.parseInt(request.getParameter("id"));
                        Database database = new Database();
                        Appointment ap = database.getAppointmentById(id);
                        %>

                        <form class="row g-3" action="/patientComment" method="post">
                            <div class="col-md-6">

                                <label class="form-label">Full Name</label><input readonly
                                  name="fullName" type="text" value="<%=ap.getFullName()%>" class="form-control">
                            </div>

                            <div class="col-md-6">
                                <label class="form-label">Age</label><input readonly
                                    name="age" type="number" value="<%=ap.getAge()%>" class="form-control">
                            </div>

                            <div class="col-md-6">
                                <label class="form-label">Phone Number</label><input readonly
                                     name="phoneNumber" value="<%=ap.getPhoneNo()%>" type="number" class="form-control">
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Diseases</label><input readonly
                                 name="diseases" value="<%=ap.getDisease()%>" type="text" class="form-control">
                            </div>

                            <div class="col-md-12">
                                <label class="form-label">Comment</label><textarea required
                                   name="comment" rows="3" type="text" class="form-control"></textarea>
                            </div>
                            <input type="hidden" name="id" value="<%=ap.getId()%>">


                            <button type="submit" class="btn bg-primary col-md-6 offset-md-3">Comment</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>


</body>
</html>