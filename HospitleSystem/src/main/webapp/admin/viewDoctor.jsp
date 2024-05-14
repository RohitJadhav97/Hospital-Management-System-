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
          <div class="col-md-12">
                      <div class="card paint-card">
                          <div class="card-body">
                              <p class="fs-3 text-center ">Doctors Details</p>
                               <% HttpSession session1 =  request.getSession(false);
                                  String message = (String)session.getAttribute("message");
                                  if(message!= null){
                               %>
                               <p class="fs-6 text-center text-primary "> <%= message%> </p>
                               <%
                                 session.setAttribute("message", null);
                                }
                               %>
                               <br>
                              <table class="table">
                                  <thead>
                                  <tr>
                                      <th scope="col">Full Name</th>
                                      <th scope="col">DOB</th>
                                      <th scope="col">Qualification</th>
                                      <th scope="col">Specialist</th>
                                      <th scope="col">Email</th>
                                      <th scope="col">Contact No.</th>
                                      <th scope="col">Action</th>
                                  </tr>
                                  </thead>
                                  <tbody>
                                 <% Database database1 = new Database();
                                    List<Doctors> list1 = database1.getAllDoctors();
                                    for(Doctors doc : list1){
                                 %>
                                 <tr>
                                      <td><%= doc.getFullName() %></td>
                                      <td><%= doc.getDob() %></td>
                                      <td><%= doc.getQualification()%></td>
                                      <td><%= doc.getSpecilalist()%></td>
                                      <td><%= doc.getEmail()%></td>
                                      <td><%= doc.getMobno()%></td>
                                      <td>
                                            <a href="editDoctor.jsp?id=<%=doc.getId()%>" class="btn btn-sm btn-primary">Edit</a>
                                            <a href="../updateDoctor?id=<%=doc.getId()%>&&action=del" class="btn btn-sm btn-danger">Delete</a>
                                      </td>
                                 </tr>
                                 <%
                                   }
                                 %>

                                  </tbody>
                              </table>
                          </div>
                      </div>
                  </div>

      </div>

  </div>




</body>
</html>