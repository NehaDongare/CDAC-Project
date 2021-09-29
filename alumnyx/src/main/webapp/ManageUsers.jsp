<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@ page import="entities.AlumniData"%>
<%@ page import="entities.StudentData"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>alumnyx | Manage Alumni</title>
<link rel="shortcut icon" href="image.jpg" type="image/x-icon">
<!-- <link rel="stylesheet" href="UserManagement.css"> -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We"
	crossorigin="anonymous">

<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}

.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}

nav {
	background: linear-gradient(-135deg, #71b7e6, #9b59b6, #f70505);
}

.slide {
	margin: 40px 140px 40px 140px;
}

.carousel-inner img {
	border-radius: 20px;
}

 #background{
background: linear-gradient(135deg, #71b7e6, #9b59b6, #f70505);}
</style>


</head>
<body>
<c:if test="${empty userObj}">
	<c:redirect url="login.jsp" />
</c:if>
<%
response.setHeader("Cache-Control","no-cache,no-store,must-validate");
response.setHeader("Pragma","no-cache");
%>
	<div>
		<!-- <header>
		<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
			<div class="container-fluid">
				<a class="navbar-brand" href="AdminHome.html"><img width="130px" height="40px" src="Alumnyx_Logo.png"
                    alt="" /></a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarNav"
					aria-controls="navbarNav" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarNav">
					<ul class="navbar-nav">
						<li class="nav-item"><a class="nav-link "
							aria-current="page" href="AdminHome.jsp">Home</a></li>
						<li class="nav-item active"><a class="nav-link"
							href="ShowAlumniData">Manage Alumni Data</a></li>
						<li class="nav-item"><a class="nav-link"
							href="ShowStudentData">Manage Student Data</a></li>
						<li class="nav-item"><a class="nav-link"
							href="ShowAlumniEvents">Manage Events</a></li>
					</ul>
				</div>
				<a href="LogOutServlet" class="btn btn-primary">Log out</a>
			</div>
		</nav>
	</header> -->
		<!--Admin Navbar Start -->
		<nav class="navbar navbar-expand-lg navbar-dark bg-light">
			<div class="container-fluid">
				<a class="navbar-brand" href="AdminHome.jsp"><img width="130px"
					height="40px" src="Alumnyx_Logo.png" alt="" /></a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarText"
					aria-controls="navbarText" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarText">
					<ul class="navbar-nav me-auto mb-2 mb-lg-0">
						<li class="nav-item"><a class="nav-link " aria-current="page"
							href="AdminHome.jsp">Home</a></li>
						<li class="nav-item"><a class="nav-link active"
							href="ShowAlumniData">Manage Alumni Data</a></li>
						<li class="nav-item"><a class="nav-link"
							href="ShowStudentData">Manage Student Data</a></li>
						<li class="nav-item"><a class="nav-link"
							href="ShowAlumniEvents">Manage Events</a></li>
					</ul>
					<span class="navbar-text"> <a href="LogOutServlet" class="btn btn-danger">Sign out</a></span>
				</div>
			</div>
		</nav>
		<!--Admin Navbar End -->
	</div>

	<div class="container">
	<div class="row">
    <div class="col"></div>
     <div class="col-12"><div class="m-4">
		<table id="background" class="table table-border text-white">
			<thead>
				<tr>
					<th scope="col">PRN</th>
					<th scope="col">Name</th>
					<th scope="col">Email</th>
					<th scope="col">Phone No</th>
					<th scope="col">Graduation Year</th>
					<th scope="col">Branch</th>
					<th scope="col">Edit Section</th>
					<th scope="col">Delete Section</th>
				</tr>
			</thead>
			<tbody>
				<%
				ArrayList<AlumniData> list = (ArrayList<AlumniData>) request.getAttribute("listalumni");
				for (AlumniData s : list) {
				%>
				<tr>
					<td>
						<%
						out.print(s.getPrn_no());
						%>
					</td>
					<td>
						<%
						out.print(s.getName());
						%>
					</td>
					<td>
						<%
						out.print(s.getEmail());
						%>
					</td>
					<td>
						<%
						out.print(s.getPhoneno());
						%>
					</td>
					<td>
						<%
						out.print(s.getGraduationYear());
						%>
					</td>
					<td>
						<%
						out.print(s.getCategory());
						%>
					</td>
					<td><a
						href="UpdateAlumni.jsp?email=<%out.print(s.getEmail());%>"
						class="btn btn-success">Edit</a></td>
					<td><a href="delete?email=<%out.print(s.getEmail());%>"
						class="btn btn-danger">Delete </a></td>
				</tr>

				<%
				}
				%>
			</tbody>
		</table>
			</div>
    <div class="col"></div>
  </div>
	</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj"
		crossorigin="anonymous"></script>
</body>
</html>