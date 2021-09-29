<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>alumnyx | Welcome Page</title>
<link rel="shortcut icon" href="image.jpg" type="image/x-icon">
<style type="text/css">
* {
  margin: 0;
  padding: 0;
}

#banner {
  background: url(bg7.jpeg) no-repeat center center fixed;
   background-size: 50% 50vh;
   -webkit-background-size: cover;
-moz-background-size: cover;
-o-background-size: cover;
position:fixed;
}
.logo {
  width: 140px;
  position: absolute;
  top: 4%;
  left: 10%;
}
.banner-text {
  text-align: center;
  color: #fff;
  padding-top: 180px;
  margin-left:520px;
}
.banner-text h1 {
  font-size: 130px;
}
.banner-text p {
  font-size: 40px;
  font-style: italic;
}
.banner-btn {
  margin: 70px auto 0;
}
.banner-btn a {
  width: 150px;
  text-decoration: none;
  display: inline-block;
  margin: 0 10px;
  padding: 12px 0;
  color: #fff;
  border: 0.5px solid #fff;
  position: relative;
  z-index: 1;
  transition: color 0.5s;
}
.banner-btn a span {
  width: 0%;
  height: 100%;
  position: absolute;
  top: 0;
  left: 0;
  background: #fff;
  z-index: -1;
  transition: 0.5s;
}
.banner-btn a:hover span {
  width: 100%;
}
.banner-btn a:hover {
  color: #000;
}

</style>
</head>
<body id="banner">
<%
response.setHeader("Cache-Control","no-cache,no-store,must-validate");
response.setHeader("Pragma","no-cache");
%>

     <section >
        <img src="Alumnyx_Logo.png" class="logo">
    <div class="banner-text">
        <h1>alumnyx</h1>
        <p>The Dreamers and the Doers</p>
        <div class="banner-btn">
            <a href="login.jsp"><span></span><b>Sign In</b></a>
            <a href="Register.jsp"><span></span><b>Register</b></a>
      </div>
    </div>
    </section>
</body>
</html>
