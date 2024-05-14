<%@ page import = 'jakarta.servlet.http.HttpServlet'%>
<%@ page import = 'jakarta.servlet.http.HttpServletRequest'%>
<%@ page import = 'jakarta.servlet.http.HttpServletResponse'%>
<%@ page import = 'jakarta.servlet.http.HttpServletResponse'%>
<%@ page import = 'jakarta.servlet.http.HttpSession' %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Login page</title>
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
                    <p class="fs-4 text-center">Admin Login</p>
                     <% session =  request.getSession(false);
                        String message = (String)session.getAttribute("message");
                        if(message!= null){
                     %>
                     <p class="fs-6 text-center text-danger "> <%= message%> </p>
                     <%
                     session.setAttribute("message",null);
                     session.setMaxInactiveInterval(0);
                      session.invalidate();
                      }
                     %>
                    <form action="/adminLogin" method="post">
                        <div class="mb-3">
                            <label class="form-label">Email address</label><input required
                              name="username" type="email" class="form-control">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Password</label><input required
                                 name="password" type="password" class="form-control">
                        </div>
                        <button type="submit" class="btn bg-success text-white col-md-12">Login</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>