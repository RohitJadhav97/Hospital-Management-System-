<%@ page import = 'com.hospital.dashbord.dao.Database' %>
<%@ page import = 'java.util.List' %>
<%@ page import = 'com.hospital.dashbord.models.Specialist' %>
<%@ page import = 'com.hospital.dashbord.models.Doctors' %>
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

  <div class="container-fluid p-3 ">
      <div class="row">
          <div class="col-md-4 offset-md-4">
              <div class="card paint-card">
                  <div class="card-body">
                      <p class="fs-3 text-center"> Edit Doctor Details </p>
                      <% int id = Integer.parseInt(request.getParameter("id"));
                         Database database1 = new Database();
                         Doctors doc = database1.getDoctor(id);
                      %>

                      <form action="../updateDoctor?action=up" method="post">
                          <div class="mb-3">
                              <label class="form-label">Full Name</label><input type="text"
                                required name="fullname"  value ="<%=doc.getFullName()%>" class="form-control">
                          </div>
                          <div class="mb-3">
                              <label class="form-label">DOB</label><input type="date"
                                required name="dob" value ="<%=doc.getDob()%>"  class="form-control">
                          </div>
                          <div class="mb-3">
                              <label class="form-label">Qualification</label><input type="text"
                                 required name="qualification" value ="<%=doc.getQualification()%>"  class="form-control">
                          </div>
                          <div class="mb-3">
                              <label class="form-label">Specialist</label><select name="specialist"
                                required  value ="<%=doc.getSpecilalist()%>" class="form-control">
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
                                required name="email" value ="<%=doc.getEmail()%>"  class="form-control">
                          </div>
                          <div class="mb-3">
                              <label class="form-label">Mobile no.</label><input type="text"
                                required name="mobile" value ="<%=doc.getMobno()%>"  class="form-control">
                          </div>
                          <div class="mb-3">
                              <label class="form-label">Password</label><input type="text"
                                required name="password" value ="<%=doc.getPassword()%>"  class="form-control">
                          </div>
                          <input type="hidden" name ="id" value = "<%=doc.getId()%>">
                          <button type="submit" class="btn btn-primary col-md-12">Update</button>
                      </form>

                  </div>
              </div>
          </div>


      </div>

  </div>




</body>
</html>