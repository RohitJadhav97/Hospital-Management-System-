<%@ page import = 'jakarta.servlet.http.HttpServlet'%>
<%@ page import = 'jakarta.servlet.http.HttpServletRequest'%>
<%@ page import = 'jakarta.servlet.http.HttpServletResponse'%>
<%@ page import = 'jakarta.servlet.http.HttpServletResponse'%>
<%@ page import = 'jakarta.servlet.http.HttpSession' %>
<%@ page import = 'com.hospital.dashbord.models.Users' %>
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
    </style>
</head>
<body>
  <%@include file = "DirectivesTag/Navbar.jsp"%>
  <%  session =request.getSession(false);
      Users user1 =  (Users) session.getAttribute("user");
  %>
  <%
   String message = (String)session.getAttribute("message");
       if(message!= null){
   %>
       <p class="fs-4 text-center text-primary "> <%= message%> </p>
   <%
        session.setAttribute("message",null);
     }
   %>
  <div class="row">
              <div  class="col-md-6 offset-md-3 p-3">
                  <div class="card paint-card">
                      <div class="card-body">
                          <p class="fs-4 text-center">Change Password</p>
                          <form class="row g-3" action="/ChangePassword" method="post">

                              <div class="col-md-12">
                                    <label class="form-label">OLd Password</label><input
                                     name="oldPassword" type="text" value="" class="form-control">
                              </div>
                               <div class="col-md-12">
                                    <label class="form-label">New Password</label><input
                                    name="newPassword" type="password" value="" class="form-control">
                               </div>
                               <input type="hidden" name="id" value="<%=user1.getId()%>">
                               <input type="hidden" name="user" value="user">

                           <button type="submit" class="btn bg-primary col-md-6 offset-md-3">Update Password</button>
                          </form>

                          </div>
                      </div>
                  </div>
              </div>
</body>
</html>