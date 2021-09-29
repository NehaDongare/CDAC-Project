<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@page isELIgnored="false"%>
     <%@ page import="entities.AlumniData"%>
     <%@ page import="model.AlumniDao"%>
	<%@ page import="model.AlumniDaoImpl"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>alumnyx | Profile Page</title>
    <link rel="shortcut icon" href="image.jpg" type="image/x-icon">
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
    <style>
        form .button input:hover {
  background: linear-gradient(-135deg, #71b7e6, #9b59b6, #f70505);
}
  nav {
  background: linear-gradient(135deg, #71b7e6, #9b59b6, #C43367);
}
    </style>
</head>
<body style="background: linear-gradient(135deg, #71b7e6, #9b59b6, #f70505)">
<c:if test="${empty userObj}">
	<c:redirect url="login.jsp" />
</c:if>
<%
response.setHeader("Cache-Control","no-cache,no-store,must-validate");
response.setHeader("Pragma","no-cache");
%>
<header>
        <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark" >
            <div class="container-fluid">
                <a class="navbar-brand" href="AlumniHome.jsp"><img width="130px" height="40px" src="Alumnyx_Logo.png"
                    alt="" /></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                    aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link " aria-current="page" href="AlumniHome.jsp">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="AlumniProfile.jsp">Profile</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="ShowUserEvents">Upcoming Events</a>
                        </li>
                    </ul>
                   
                </div>
                  <span class="navbar-text"> <a href="LogOutServlet" class="btn btn-danger">Sign out</a></span>
            </div>
        </nav>
    </header>

    <form action="AlumniProfileUpdateServlet" method="get">
    <div class="container bg-white mt-5 mb-5">
        <div class="row">
            <div class="col-md-3 border-right">
                <div class="d-flex flex-column align-items-center text-center p-3 py-5"><img class="rounded-circle mt-5 w-50 h-50" src="image1.png"></div>
            </div>
            <div class="col-md-5 border-right">
                <div class="p-3 py-5">
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <h4 class="text-right">Profile Settings</h4>
                    </div>
                    <div class="row mt-2">
                        <div class="col-md-12"><label class="labels">Full Name</label><input type="text" class="form-control" name="AlumniData.name" placeholder="Full Name" value="${userObj.name }" disabled></div><p></p>
                        <div class="col-md-12"><label class="labels">User Name</label><input type="text" class="form-control" name="AlumniData.uName" placeholder="User Name" value="${userObj.uName }" disabled></div>
                    </div>
                    <div class="row mt-3">
                        <div class="col-md-12"><label class="labels">PhoneNumber</label><input type="text" class="form-control" name="AlumniData.phoneno" placeholder="Phone Number" value="${userObj.phoneno }" disabled></div><p></p>
                        <div class="col-md-12"><label class="labels">Branch</label><input type="text" class="form-control" placeholder="Branch" name="AlumniData.category" value="${userObj.category }" disabled></div><p></p>
                        <div class="col-md-12"><label class="labels">Email ID</label><input type="text" class="form-control" placeholder="enter email" name="AlumniData.email" value="${userObj.email }" disabled></div><p></p>
                         <div class="col-md-6"><label class="labels">Passing Out Year</label><input type="text" class="form-control" name ="AlumniData.graduationYear" placeholder="Passing Out Year" value="${userObj.graduationYear }" disabled></div>
                        <div class="col-md-6"><label class="labels">PRN</label><input type="text" class="form-control"  placeholder="Permanent Registration Number" name="AlumniData.prn_no" value="${userObj.prn_no }"  disabled></div><p></p>
                        <!-- <div class="col-md-6"><label class="labels">Password</label> --><input type="hidden" class="form-control" name ="AlumniData.password" placeholder="Password" value="${userObj.password }" disabled/></div><p></p>
                    <!-- <div class="row mt-3">
                        <div class="col-md-6"><label class="labels"></label><input type="hidden" class="form-control" placeholder="country" value="" required></div>
                        <div class="col-md-6"><label class="labels"></label><input type="hidden" class="form-control" value="" placeholder="state" required></div>
                    </div> -->
                    <!-- <div class="mt-5 text-center"><button class="btn btn-primary profile-button btn-outline-light" 
                        type="button" style="background: linear-gradient(-135deg, #71b7e6, #9b59b6, #f70505)">Update Profile</button></div>
                </div> -->
            </div>
            </div>
        </div>
    </div>
    </div>
    </div>
    </form>
</body>
</html>