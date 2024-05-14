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


<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
    <div class="carousel-indicators">
        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="3" aria-label="Slide 4"></button>
    </div>
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img src="images/hospital1.jpg" class="d-block w-100" alt="..." height="500px">
        </div>
        <div class="carousel-item">
            <img src="images/hopital2.jpg" class="d-block w-100" alt="..." height="500px">
        </div>
        <div class="carousel-item">
            <img src="images/hospital4.jpg" class="d-block w-100" alt="..." height="500px">
        </div>
        <div class="carousel-item">
            <img src="images/hospital3.jpg" class="d-block w-100" alt="..." height="500px">
        </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
    </button>
</div>

<div class="container p-3">
    <p class="text-center fs-2 "> Key Features Of Our Hospital</p>

    <div class="row">
        <div class="col-md-8 p-5">
            <div class="row">
                <div class="col-md-6">
                    <div class="card point-card">
                        <div class="card-body">
                            <p class="fs-5">100% Safety</p>
                            <p>add text later</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card point-card">
                        <div class="card-body">
                            <p class="fs-5">Clean Environment</p>
                            <p>add text later</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card point-card">
                        <div class="card-body">
                            <p class="fs-5">Friendly Doctors</p>
                            <p>add text later</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card point-card">
                        <div class="card-body">
                            <p class="fs-5">Medical Research</p>
                            <p>add text later</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-2 ">
            <img alt="" src="images/doctors.jpg "  height="200px" width="200px">
            <br>
            <br>
            <p class="fw-bold fs-5 text-center">Doctor name</p>
            <p class="text-center">(Designation)</p>
        </div>
        <div class="col-md-2 g-4" height="30px" >
            <p class="text-left">Dear Friends</p>
            <p class="text-left"> It is my pleasure and a great honour in being able to serve the society from this position.
                This Institute and the hospital has treated, healed and postively impacted millions of
                lives over the past decades and we will endeavour to sustain and enhance the patient
                care and healthcare delivery to many more.</p>
        </div>
    </div>
</div>
<hr>
<div class="container p-2">
    <p class="text-center fs-2">Our Team</p>
    <div class="row">
        <div class="col-md-3">
            <div class="card paint-card">
                <div class="card-body text-center">
                    <img src="images/" width="250px"height="300px">
                    <p class="fw-bold fs-5">Doctor Name</p>
                    <p class="fs-7">(Designation)</p>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card paint-card">
                <div class="card-body text-center">
                    <img src="images/" width="250px"height="300px">
                    <p class="fw-bold fs-5">Doctor Name</p>
                    <p class="fs-7">(Designation)</p>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card paint-card">
                <div class="card-body text-center">
                    <img src="images/" width="250px"height="300px">
                    <p class="fw-bold fs-5">Doctor Name</p>
                    <p class="fs-7">(Designation)</p>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card paint-card">
                <div class="card-body text-center">
                    <img src="images/" width="200px"height="300px">
                    <p class="fw-bold fs-5">Doctor Name</p>
                    <p class="fs-7">(Designation)</p>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file = "../DirectivesTag/Footer.jsp"%>
</body>
</html>