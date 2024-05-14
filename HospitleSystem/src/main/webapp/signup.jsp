<%@ page import = 'jakarta.servlet.http.HttpServlet'%>
<%@ page import = 'jakarta.servlet.http.HttpServletRequest'%>
<%@ page import = 'jakarta.servlet.http.HttpServletResponse'%>
<%@ page import = 'jakarta.servlet.http.HttpServletResponse'%>
<%@ page import = 'jakarta.servlet.http.HttpSession' %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Doctor Login page</title>
    <%@include file = "DirectivesTag/AllCSS.jsp"%>
    <style type="text/css">
        .paint-card{
            box-shadow: 0 0 10px 0 rgba(0 ,0, 0, 0.3);
        }
    </style>
</head>
<body>
<%@include file = "DirectivesTag/Navbar.jsp"%>

<div class="container p-5">
    <div class="row">
        <div  class="col-md-4 offset-md-4">
            <div class="card paint-card">
                <div class="card-body">
                    <p class="fs-4 text-center">User Register </p>
                    <% session =  request.getSession(false);
                     String massage = (String)session.getAttribute("massage");
                     if(massage!= null){
                     %>
                    <p class="fs-6 text-center"> <%= massage%> </p>
                     <%
                     }
                     %>
                    <form action="/signup" method="post">
                        <div class="mb-3">
                            <label class="form-label">Full Name</label><input required
                              name="fullName" type="text" class="form-control">
                        </div>
                         <div class="mb-3">
                             <label class="form-label">Email Address</label><input required
                              name="username" type="email" class="form-control">
                         </div>

                        <div class="mb-3">
                            <label class="form-label">Password</label><input required
                                 name="password" type="password" class="form-control">
                        </div>
                        <button type="submit" class="btn bg-success text-white col-md-12">Register</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>



</body>
</html>