<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@ page import="entities.EventData"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>alumnyx | Manage Events</title>
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

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }

        nav {
            background: linear-gradient(-135deg, #71b7e6, #9b59b6, #f70505);
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

<!--Admin Navbar Start -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-light">
        <div class="container-fluid">
            <a class="navbar-brand" href="AdminHome.jsp"><img width="130px" height="40px" src="Alumnyx_Logo.png"
                    alt="" /></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText"
                aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarText">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item"><a class="nav-link " aria-current="page" href="AdminHome.jsp">Home</a>
                    </li>
                    <li class="nav-item"><a class="nav-link " href="ShowAlumniData">Manage Alumni Data</a></li>
                    <li class="nav-item"><a class="nav-link " href="ShowStudentData">Manage Student Data</a></li>
                    <li class="nav-item"><a class="nav-link active" href="ShowAlumniEvents">Manage Events</a></li>
                </ul>
                <span class="navbar-text"> <a href="LogOutServlet" class="btn btn-danger">Sign out</a></span>
            </div>
        </div>
    </nav>
    <!--Admin Navbar End -->

		<div class="m-3">
			<a href="AddEvent.jsp" class="btn btn-info text-white" >Add Event</a>
		</div>
		
		<div class="container">
  <div class="row">
    <div class="col"></div>
     <div class="col-12"><div class="">
			<table id="background" class="table table-Primary text-white">
				<thead>
					<tr>
						<th scope="col">Id</th>
						<th scope="col">Event Title</th>
						<th scope="col">Event Details</th>
						<th scope="col">Event Date</th>
						<th scope="col">Edit Section</th>
						<th scope="col">Delete Section</th>
					</tr>
				</thead>
				<tbody>
					<%
					ArrayList<EventData> list1 = (ArrayList<EventData>) request.getAttribute("listevents");
					for (EventData s : list1) {
					%>
					<tr>
						<td>
							<%
							out.print(s.getId());
							%>
						</td>
						<td>
							<%
							out.print(s.getEvent_title());
							%>
						</td>
						<td>
							<%
							out.print(s.getEvent_details());
							%>
						</td>
						<td>
							<%
							out.print(s.getEvent_date());
							%>
						</td>
						<td><a href="UpdateEvent.jsp?id=<%out.print(s.getId());%>"
							class="btn btn-success">Edit</a></td>
						<td>
							<a href="deleteevent?id=<%out.print(s.getId());%>" class="btn btn-danger">Delete</a>
						</td>
					</tr>

					<%
					}
					%>
				</tbody>
			</table>
			</div></div>
    <div class="col"></div>
  </div>
</div>
		
		
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj"
		crossorigin="anonymous"></script>
</body>
</html>