<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!doctype html>

<html lang="en" dir="ltr">
<head>
<meta charset="UTF-8">
<!---<title> Responsive Registration Form | CodingLab </title>--->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.87.0">
<title>alumnyx | Sign-in</title>
<link rel="shortcut icon" href="image.jpg" type="image/x-icon">
<link rel="canonical"
	href="https://getbootstrap.com/docs/5.1/examples/sign-in/">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src=Regiter.js></script>

<!-- Bootstrap core CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We"
	crossorigin="anonymous">

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

						// Validate Email
						$(".email")
								.change(
										function() {
											var inputvalues = $(this).val();
											var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
											if (!regex.test(inputvalues)) {
												alert("email should be in name@example.com format");
												return regex.test(inputvalues);
											}
										});

						// Validate Password
						$('#passcheck').hide();
						let passwordError = true;
						$('#password').keyup(function() {
							validatePassword();
						});
						function validatePassword() {
							let passwrdValue = $('#password').val();
							if (passwrdValue.length == '') {
								$('#passcheck').show();
								passwordError = false;
								return false;
							}
							if ((passwrdValue.length < 3)
									|| (passwrdValue.length > 10)) {
								$('#passcheck').show();
								$('#passcheck')
										.html(
												"**length of your password must be between 3 and 10");
								$('#passcheck').css("color", "red");
								passwordError = false;
								return false;
							} else {
								$('#passcheck').hide();
							}
						}

						// Validate Confirm Password
						$('#conpasscheck').hide();
						let confirmPasswordError = true;
						$('#conpassword').keyup(function() {
							validateConfirmPasswrd();
						});
						function validateConfirmPasswrd() {
							let confirmPasswordValue = $('#conpassword').val();
							let passwrdValue = $('#password').val();
							if (passwrdValue != confirmPasswordValue) {
								$('#conpasscheck').show();
								$('#conpasscheck').html(
										"**Password didn't Match");
								$('#conpasscheck').css("color", "red");
								confirmPasswordError = false;
								return false;
							} else {
								$('#conpasscheck').hide();
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
		var PRNno = document.getElementById("prn");
		var reg = /^[1-9]{1}[0-9]{9}$/;
		var rega = /^[0-9]{4}$/;
		var regb = /^[0-9]{12}$/;

		if (Name.value.trim() == "" || MobileNo.value.trim() == ""
				|| PRNno.value.trim() == "") {
			alert("Cannot leave any field Empty");
			return false;
		} else if (Name.value.length<5 || Name.value.length>50) {
			alert("The Value must be between 5 to 50 characters");
			return false;
		} else if (reg.test(MobileNo.value) == false) {
			alert("Enter 10 digit mobile number");
			MobileNo.focus();
			return false;
		} else if (regb.test(PRNno.value) == false) {
			alert("Enter 12 digit valid PRN No number");
			PRNno.focus();
			return false;
		} else {

			true;
		}
	}
</script>
</head>
<body>
<%
response.setHeader("Cache-Control","no-cache,no-store,must-validate");
response.setHeader("Pragma","no-cache");
%>
	<div class="container">
		<div class="title">Registration</div>
		<div class="content">
			<form action="RegisterServlet" method="post"
				onsubmit="return Validate()">
				<div class="user-details">
					<div class="input-box">
						<span class="details">Full Name</span> <input type="text"
							placeholder="Enter your name" id="fullname" name="name">
					</div>
					<div class="input-box">
						<span class="details">Username</span> <input type="text"
							placeholder="Enter your username" id="usernames" name="uName"
							required>
						<h5 id="usercheck" style="color: red;">**Username is missing
						</h5>
					</div>
					<div class="input-box">
						<span class="details">Email</span> <input type="text"
							placeholder="Enter your email" id="email" class="email"
							name="email" required> <small id="emailvalid"
							class="form-text
                text-muted invalid-feedback">
							Your email must be a valid email </small>
					</div>
					<div class="input-box">
						<span class="details">Phone Number</span> <input type="number"
							placeholder="Enter your number" id="mob" name="phoneno" required>
					</div>
					<div class="input-box">
						<span class="details">Passout Year</span> <select id="ddlYears"
							name="graduation_yr"></select>
					</div>
					<div class="input-box">
						<label for="role">User Type</label> <select class="form-control"
							id="role" name="role" aria-describedby="roleHelp" required>
							<option selected>Select</option>
							<option value="Student">Student</option>
							<option value="Alumini">Alumini</option>
						</select>
					</div>
					<div class="input-box">
						<label for="branch">Branch</label> <select class="form-control"
							id="branch" name="branch" aria-describedby="branchHelp" required>
							<option selected>Select</option>
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
							placeholder="Enter PRN No" id="prn" name="prn_no" required />
					</div>
					<div class="input-box">
						<span class="details">Password</span> <input type="password"
							placeholder="Enter your password" id="password" name="password"
							required>
						<h5 id="passcheck" style="color: red;">**Please Fill the
							password</h5>
					</div>
					<div class="input-box">
						<span class="details">Confirm Password</span> <input
							type="password" placeholder="Enter your password"
							id="conpassword" name="conpassword" required>
						<h5 id="conpasscheck" style="color: red;">**Password didn't
							match</h5>
					</div>
				</div>
				<div class="button">
					<input type="submit" value="Register" id="submitbtn">
				</div>
			</form>
		</div>
	</div>

</body>
</html>