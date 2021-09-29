<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>alumnyx | Add Event</title>
<link rel="shortcut icon" href="image.jpg" type="image/x-icon">

    <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/sign-in/">
    <!-- Bootstrap core CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
    <link href="main.css" rel="stylesheet"> 
    
</head>
<body>
<c:if test="${empty userObj}">
	<c:redirect url="login.jsp" />
</c:if>
<%
response.setHeader("Cache-Control","no-cache,no-store,must-validate");
response.setHeader("Pragma","no-cache");
%>
<div class="container">
<h1 class="h3 mb-3 fw-normal"><a href="ShowAlumniEvents" style="text-decoration: none; color: black;">alumnyx</a></h1>
    <div class="title">Add Events</div>
    <div class="content">
	<form action="AddEvent" method="post" onsubmit="return Validate()">
	<div class="user-details">
	    <div>
		<input type="hidden" placeholder="Enter Id" name="id" required />
		</div>
		<div class="input-box ">
        <span class="details">Event Title</span>
		<input type="text" placeholder="Enter Event Title" id="title" maxlength="50" name="event_title" required />
		</div>
		<div class="input-box">
		 <span class="details">Event Date</span>
		<input type="date" name="event_date" required />
		</div>
		<div class="input-box" id="writing" style="padding-left: 15px;">
        <span class="details">Event Details</span>
		<textarea name="event_details" id="TextBox" maxlength="1000" placeholder="Writing Entries:1000 characters max" rows="10" cols="50" required ></textarea>
		</div>
		</div>
		<div class="button">
		<input type="submit" value="Add" /> 
		</div>
	</form>
	</div>
	</div>
</body>
</html>