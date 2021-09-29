<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<%@ page import="model.AlumniDao"%>
<%@ page import="model.AlumniDaoImpl"%>
<%@ page import="entities.AlumniData"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>alumnyx | Update Alumni</title>
<link rel="shortcut icon" href="image.jpg" type="image/x-icon">
<link rel="canonical"
	href="https://getbootstrap.com/docs/5.1/examples/sign-in/">
<!-- Bootstrap core CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We"
	crossorigin="anonymous">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src=updateAlumni.js></script>

<link href="main.css" rel="stylesheet">

<script>
	$(document)
			.ready(
					function() {

						// Validate Username
						$('#usercheck').hide();
						let usernameError = true;
						$('#usernames').keyup(function() {
							validateUsername();
						});

						function validateUsername() {
							let usernameValue = $('#usernames').val();
							if (usernameValue.length == '') {
								$('#usercheck').show();
								usernameError = false;
								return false;
							} else if ((usernameValue.length < 3)
									|| (usernameValue.length > 10)) {
								$('#usercheck').show();
								$('#usercheck')
										.html(
												"**length of username must be between 3 and 10");
								usernameError = false;
								return false;
							} else {
								$('#usercheck').hide();
							}
						}

						// Submitt button
						$('#submitbtn').click(
								function() {
									validateUsername();
									validatePassword();
									validateConfirmPasswrd();
									validateEmail();
									if ((usernameError == true)
											&& (passwordError == true)
											&& (confirmPasswordError == true)
											&& (emailError == true)) {
										return true;
									} else {
										return false;
									}
								});

						window.onload = function() {
							//Reference the DropDownList.
							var ddlYears = document.getElementById("ddlYears");

							//Determine the Current Year.
							var currentYear = (new Date()).getFullYear();

							//Loop and add the Year values to DropDownList.
							for (var i = 1990; i <= currentYear; i++) {
								var option = document.createElement("OPTION");
								option.innerHTML = i;
								option.value = i;
								ddlYears.appendChild(option);
							}
						};
					});
</script>
<script type="text/javascript">
	function Validate() {
		var Name = document.getElementById("fullname");
		var MobileNo = document.getElementById("mob");
		var Year = document.getElementById("year");
		var PRNno = document.getElementById("prn");
		var reg = /^[1-9]{1}[0-9]{9}$/;
		var rega = /^[0-9]{4}$/;
		var regb = /^[0-9]{12}$/;

		if (Name.value.trim() == "" || MobileNo.value.trim() == ""
				|| Year.value.trim() == "" || PRNno.value.trim() == "") {
			alert("Cannot leave any field Empty");
			return false;
		} else if (Name.value.length<5 || Name.value.length>50) {
			alert("The Value must be between 5 to 50 characters");
			return false;
		} else if (reg.test(MobileNo.value) == false) {
			alert("Enter 10 digit mobile number");
			MobileNo.focus();
			return false;
		} else if (rega.test(Year.value) == false) {
			alert("Enter 4 digit valid Passout year");
			Year.focus();
			return false;
		} else if (regb.test(PRNno.value) == false) {
			alert("Enter 12 digit valid PRN No number");
			PRNno.focus();
			return false;
		} else {

			true;
		}

	}

	/*window.onload = function () {
	 //Reference the DropDownList.
	 var ddlYears = document.getElementById("ddlYears");
	
	 //Determine the Current Year.
	 var currentYear = (new Date()).getFullYear();
	
	 //Loop and add the Year values to DropDownList.
	 for (var i = 1950; i <= currentYear; i++) {
	 var option = document.createElement("OPTION");
	 option.innerHTML = i;
	 option.value = i;
	 ddlYears.appendChild(option);
	 }
	 };*/
</script>
</head>
<body>
	<c:if test="${empty userObj}">
		<c:redirect url="login.jsp" />
	</c:if>
	<%
	response.setHeader("Cache-Control", "no-cache,no-store,must-validate");
	response.setHeader("Pragma", "no-cache");
	%>
	<%
	String email = (request.getParameter("email"));
	AlumniDao dao = new AlumniDaoImpl();
	AlumniData data = new AlumniData(email);
	AlumniData md = dao.getAlumnibyEmail(data);
	%>

	<div class="container">
		<h1 class="h3 mb-3 fw-normal">
			<a href="ShowAlumniData" style="text-decoration: none; color: black;">alumnyx</a>
		</h1>
		<div class="title">Update Data</div>
		<div class="content">
			<form action="UpdateServlet" method="get"
				onsubmit="return Validate()">
				<div class="user-details">
					<div class="input-box">
						<span class="details">Full Name</span> <input type="text"
							placeholder="Enter Name" id="fullname" name="name"
							value="<%=md.getName()%>" required />
					</div>
					<div class="input-box">
						<span class="details">Username</span> <input type="text"
							placeholder="Enter Username" id="usernames" name="uName"
							value="<%=md.getuName()%>" required />
						<h5 id="usercheck" style="color: red;">**Username is missing
						</h5>
					</div>
					<div>
						<input type="hidden" placeholder="Enter Email" name="email"
							value="<%=md.getEmail()%>" required />
					</div>
					<div class="input-box">
						<span class="details">Phone Number</span> <input type="number"
							placeholder="Enter Phone No" name="phoneno" id="mob"
							value="<%=md.getPhoneno()%>" required />
					</div>
					<div class="input-box">
						<span class="details">Passout Year</span>
						<%-- <input type="number" placeholder="Enter Graduation Year" name="graduationYear" id="year" value="<%=md.getGraduationYear()%>" required / --%>
						><select id="ddlYears" name="graduationYear"
								value="<%=md.getGraduationYear()%>" required><option selected><%=md.getGraduationYear()%></option>
							</select>
					</div>
					<div class="input-box">
						<label for="branch"><b>Branch</b></label> <select
							class="form-control" id="branch" name="category"
							aria-describedby="branchHelp" value="<%=md.getCategory()%>"
							required>
							<option selected><%=md.getCategory()%></option>
							<option value="Information Technology">Information
								Technology</option>
							<option value="Software Technology">Software Technology</option>
							<option value="Mechanical Engineering">Mechanical
								Engineering</option>
							<option value="Civil Engineering">Civil Engineering</option>
							<option value="Electronics Engineering">Electronics
								Engineering</option>
						</select>
					</div>
					<div class="input-box">
						<span class="details">PRN No</span> <input type="number"
							placeholder="Enter PRN No" name="prn_no" id="prn"
							value="<%=md.getPrn_no()%>" required />
					</div>
					<div>
						<input type="hidden" placeholder="Password" name="password"
							value="<%=md.getPassword()%>" required />
					</div>
				</div>
				<div class="button">
					<input type="submit" value="Update" id="submitbtn" />
				</div>
			</form>
		</div>
	</div>
</body>
</html>