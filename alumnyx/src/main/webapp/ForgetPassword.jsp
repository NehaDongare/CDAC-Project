<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>alumnyx | Forgot Password</title>
<link rel="shortcut icon" href="image.jpg" type="image/x-icon">
    <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/sign-in/">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

    <!-- Bootstrap core CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">

       <style type="text/css">
       
         @import url("https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap");
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: "Poppins", sans-serif;
}
body {
  height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;
  padding: 10px;
  background: linear-gradient(135deg, #71b7e6, #9b59b6, #f70505);
}
.container {
  max-width: 350px;
  width: 100%;
  background-color: #fff;
  padding: 25px 30px;
  border-radius: 5px;
  box-shadow: 0 5px 10px rgba(0, 0, 0, 0.15);
}
.container .title {
  font-size: 25px;
  font-weight: 500;
  position: relative;
}
.container .title::before {
  content: "";
  position: absolute;
  left: 0;
  bottom: 0;
  height: 3px;
  width: 30px;
  border-radius: 5px;
  background: linear-gradient(135deg, #71b7e6, #9b59b6, #f70505);
}
.content form .user-details {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
  margin: 20px 0 12px 0;
}
form .user-details .input-box {
  margin-bottom: 15px;
  width: calc(100% / 2 - 20px);
}
form .input-box span.details {
  display: block;
  font-weight: 500;
  margin-bottom: 5px;
}
.user-details .input-box input {
  height: 45px;
  width: 100%;
  outline: none;
  font-size: 16px;
  border-radius: 5px;
  padding-left: 15px;
  border: 1px solid #ccc;
  border-bottom-width: 2px;
  transition: all 0.3s ease;
}
form .gender-details .gender-title {
  font-size: 20px;
  font-weight: 500;
}
form .category {
  display: flex;
  width: 80%;
  margin: 14px 0;
  justify-content: space-between;
}
form .category label {
  display: flex;
  align-items: center;
  cursor: pointer;
}
form .category label .dot {
  height: 18px;
  width: 18px;
  border-radius: 50%;
  margin-right: 10px;
  background: #d9d9d9;
  border: 5px solid transparent;
  transition: all 0.3s ease;
}
#dot-1:checked ~ .category label .one,
#dot-2:checked ~ .category label .two,
#dot-3:checked ~ .category label .three {
  background: #9b59b6;
  border-color: #d9d9d9;
}
form input[type="radio"] {
  display: none;
}
form .button {
  height: 45px;
  margin: 35px 0;
}
form .button input {
  height: 100%;
  width: 100%;
  border-radius: 5px;
  border: none;
  color: #fff;
  font-size: 18px;
  font-weight: 500;
  letter-spacing: 1px;
  cursor: pointer;
  transition: all 0.3s ease;
  background: linear-gradient(135deg, #71b7e6, #9b59b6, #f70505);
}
form .button input:hover {
  /* transform: scale(0.99); */
  background: linear-gradient(-135deg, #71b7e6, #9b59b6, #f70505);
}

@media (max-width: 584px) {
  .container {
    max-width: 100%;
  }
  form .user-details .input-box {
    margin-bottom: 15px;
    width: 100%;
  }
  form .category {
    width: 100%;
  }
  .content form .user-details {
    max-height: 300px;
    overflow-y: scroll;
  }
  .user-details::-webkit-scrollbar {
    width: 5px;
  }
}
@media (max-width: 459px) {
  .container .content .category {
    flex-direction: column;
  }
}
 </style>
 
  <script type="text/javascript">
    $(document).ready(function () {
      // set initially button state hidden
      $("#btn").attr("disabled", true);
      // use keyup event on email field
      $("#Email").keyup(function () {
        if (validateEmail()) {
          // if the email is validated
          // set input email border green
          $("#Email").css("border", "2px solid green");
          // and set label
        } else {
          // if the email is not validated
          // set border red
          $("#Email").css("border", "2px solid red");
        }
        buttonState();
      });
      // use keyup event on password
      $("#pass").keyup(function () {
        // check
        if (validatePassword()) {
          // set input password border green
          $("#pass").css("border", "5px solid green");
          //set passMsg
        } else {
          // set input password border red
          $("#pass").css("border", "5px solid red");
          //set passMsg
        }
        buttonState();
      });
    });

    function buttonState() {
      if (validateEmail() && validatePassword()) {
        // if the both email and password are validate
        // then button should show visible
        $("#btn").removeAttr("disabled");

      } 
      else {
        // if both email and pasword are not validated
        // button state should hidden
        $("#btn").attr("disabled", true);
      }
    }
    function validateEmail() {
      // get value of input email
      var email = $("#Email").val();
      // use reular expression
      var reg = /^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
      if (reg.test(email)) {
        return true;
      } else {
        return false;
      }
    }
    function validatePassword() {
      //get input password value
      var pass = $("#pass").val();
      // check it s length
      if (pass.length > 4) {
        return true;
      } else {
        return false;
      }
    }
  </script>
</head>
<body class="text-center">
			
   <div class="container"> 
   <!-- <img class="mb-4" src="image.jpg" alt="" width="72" height="70"> -->
   <h1 class="h3 mb-3 fw-normal"> alumnyx</h1>
    <div class="title">Reset Password</div>
	<form action="ForgetPassword" action="get">
	     <div class="input-box">
         <label for="role"><b></b></label>
         <select class="form-control" id="role" name="role" aria-describedby="roleHelp" required>
		<option selected>Select User Type</option>
		<option value="Student">Student</option>
		<option value="Alumini">Alumini</option>
		</select>
		</div>
		<br>
		<div class="input-box">
        <!-- <span class="details">Email</span> -->
		<input type="text" placeholder="Enter your Email" id="Email" name="email" style="font-size: 10pt; height: 35px; width:290px;"/> 
		</div>
		<br>
		<div class="input-box ">
        <!-- <span class="details">Password</span> -->
		<input type="text" placeholder="Enter New Password" id="pass" name="password" style="font-size: 10pt; height: 35px; width:290px;"/> 
		</div>
		<br>
		 <div class="input-box">
		<input class="w-70 btn btn-lg btn-primary" id="btn" type="submit" value="Reset Password" />
		</div>
	</form>
	 </div>
</body>
</html>