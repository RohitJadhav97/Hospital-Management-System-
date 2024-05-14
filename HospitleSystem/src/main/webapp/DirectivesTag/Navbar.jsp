<%@ page import = 'jakarta.servlet.http.HttpServlet'%>
<%@ page import = 'jakarta.servlet.http.HttpServletRequest'%>
<%@ page import = 'jakarta.servlet.http.HttpServletResponse'%>
<%@ page import = 'jakarta.servlet.http.HttpServletResponse'%>
<%@ page import = 'jakarta.servlet.http.HttpSession' %>
<%@ page import = 'com.hospital.dashbord.models.Users' %>
<%! HttpSession session; %>
 <%  session =request.getSession();
    if(session.getAttribute("user")!= null){
    Users user1 =  (Users) session.getAttribute("user");
            String name = user1.getName();
%>
    <nav class="navbar navbar-expand-lg navbar-dark bg-success">
          <div class="container-fluid">
              <a class="navbar-brand" href="index.jsp"> <i class="fa-solid fa-hospital"></i> MEDI CARE</a>
              <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                  <span class="navbar-toggler-icon"></span>
              </button>
              <div class="collapse navbar-collapse" id="navbarSupportedContent">
                  <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                      <li class="nav-item">
                          <a class="nav-link active" aria-current="page" href="../appointment.jsp">Appointment</a>
                      </li>
                      <li class="nav-item">
                          <a class="nav-link active" aria-current="page" href="../viewAppointments.jsp">View Appointment</a>
                      </li>
                  </ul>
                  <form class="d-flex">
                      <div class="dropdown ">
                          <button class="btn btn-light dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                              <%=name%>
                          </button>
                          <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                              <li><a class="dropdown-item" href="/changePassword.jsp">Change Password</a></li>
                              <li><a class="dropdown-item" href="/logoutServlet">Logout</a></li>
                          </ul>
                      </div>
                  </form>
              </div>

          </div>
      </nav>
 <%}
    else{
 %>
<nav class="navbar navbar-expand-lg navbar-light bg-success">
    <div class="container-fluid">
        <a class="navbar-brand" href="index.jsp"> <i class="fa-solid fa-hospital"></i> MEDI CARE</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="admin_login.jsp"> <i class="fa-solid fa-right-to-bracket"></i> ADMIN</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="doctor_login.jsp">DOCTOR</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="../appointment.jsp">APPOINTMENT</a>
                </li><li class="nav-item">
                <a class="nav-link active" aria-current="page" href="user_login.jsp">USER</a>
            </li>
            </ul>

        </div>
    </div>
</nav>
<%}%>