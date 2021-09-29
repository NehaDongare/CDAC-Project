<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@ page import="entities.StudentData"%>
<%@ page import="model.StudentDao"%>
<%@ page import="model.StudentDaoImpl"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>alumnyx | Home</title>
<link rel="shortcut icon" href="image.jpg" type="image/x-icon">


<!-- Bootstrap core CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We"
	crossorigin="anonymous">

<!-- Favicons -->
<link rel="apple-touch-icon"
	href="/docs/5.1/assets/img/favicons/apple-touch-icon.png"
	sizes="180x180">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-32x32.png"
	sizes="32x32" type="image/png">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-16x16.png"
	sizes="16x16" type="image/png">
<link rel="manifest" href="/docs/5.1/assets/img/favicons/manifest.json">
<link rel="mask-icon"
	href="/docs/5.1/assets/img/favicons/safari-pinned-tab.svg"
	color="#7952b3">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon.ico">
<meta name="theme-color" content="#7952b3">

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
</style>

<!-- Custom styles for this template -->
<link href="carousel.css" rel="stylesheet">
</head>
<body>

	<c:if test="${empty userObj}">
		<c:redirect url="login.jsp" />
	</c:if>
	<%
	response.setHeader("Cache-Control", "no-cache,no-store,must-validate");
	response.setHeader("Pragma", "no-cache");
	%>
	<!-- Navbar Start -->

	<header>
		<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
			<div class="container-fluid">
				<a class="navbar-brand" href="StudentHome.jsp"><img
					width="130px" height="40px" src="Alumnyx_Logo.png" alt="" /></a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarNav"
					aria-controls="navbarNav" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarNav">
					<ul class="navbar-nav me-auto mb-2 mb-lg-0">
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="StudentHome.jsp">Home</a></li>
						<li class="nav-item"><a class="nav-link " aria-current="page"
							href="StudentProfile.jsp">Profile</a></li>
						<li class="nav-item"><a class="nav-link " href="ShowEvents">Upcoming
								Events</a></li>
					</ul>
					<span class="navbar-text"> <a href="LogOutServlet"
						class="btn btn-danger">Sign out</a>
					</span>
				</div>
			</div>
		</nav>
	</header>
	<!-- Navbar End -->

	<main>

		<div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
			<!-- <div class="carousel-indicators">
                <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="active"
                    aria-current="true" aria-label="Slide 1"></button>
                <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
                <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
            </div> -->
			<div class="carousel-inner">
				<div class="carousel-item active">
					<!-- <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg"
                        aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"> -->
					<img width="1150px" height="500px"
						src="https://source.unsplash.com/1150x500/?alumni, graduate, college, institude"
						class="d-block w-100" alt="..." />
					<rect width="100%" height="100%" fill="#777" />
					</svg>

					<div class="container">
						<div class="carousel-caption text-start">
							<!-- <h1>Example headline.</h1> -->
							<!-- <p>Some representative placeholder content for the first slide of the carousel.</p>
                            <p><a class="btn btn-lg btn-primary" href="#">Sign up today</a></p> -->
						</div>
					</div>
				</div>
				<div class="carousel-item">
					<!-- <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg"
                        aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"> -->
					<img width="1150px" height="500px"
						src="https://source.unsplash.com/1150x500/?alumni, institude"
						class="d-block w-100" alt="..." />
					<rect width="100%" height="100%" fill="#777" />
					</svg>

					<div class="container">
						<div class="carousel-caption">
							<!-- <h1>Another example headline.</h1> -->
							<!-- <p>Some representative placeholder content for the second slide of the carousel.</p>
                            <p><a class="btn btn-lg btn-primary" href="#">Learn more</a></p> -->
						</div>
					</div>
				</div>
				<div class="carousel-item">
					<!-- <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg"
                        aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"> -->
					<img width="1150px" height="500px"
						src="https://source.unsplash.com/1150x500/?graduate, alumni, student, institude"
						class="d-block w-100" alt="..." />
					<rect width="100%" height="100%" fill="#777" />
					</svg>

					<div class="container">
						<div class="carousel-caption text-end">
							<!-- <h1>One more for good measure.</h1> -->
							<!-- <p>Some representative placeholder content for the third slide of this carousel.</p>
                            <p><a class="btn btn-lg btn-primary" href="#">Browse gallery</a></p> -->
						</div>
					</div>
				</div>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#myCarousel" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#myCarousel" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>


		<!-- Marketing messaging and featurettes
  ================================================== -->
		<!-- Wrap the rest of the page in another container to center all the content. -->

		<div class="container marketing">

			<!-- Three columns of text below the carousel -->
			<div class="row">
				<div class="col-lg-4">
					<!-- <svg class="bd-placeholder-img rounded-circle" width="140" height="140"
                        xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 140x140"
                        preserveAspectRatio="xMidYMid slice" focusable="false"> -->
					<img width="140" height="140"
						src="https://source.unsplash.com/140x140/?teachers"
						class="bd-placeholder-img rounded-circle" alt="..." />
					<title>Placeholder</title>
					<!-- <rect width="100%" height="100%" fill="#777" /><text x="50%" y="50%" fill="#777"
                        dy=".3em">140x140</text> -->
					</svg>

					<h2>Principal's Message</h2>
					<p>"Many of life's failures are people who did not realize how
						close they were to success when they gave up."- Thomas A. Edison</p>
					<p>
						<a class="btn btn-primary" href="#">Read More &raquo;</a>
					</p>
				</div>
				<!-- /.col-lg-4 -->
				<div class="col-lg-4">
					<!-- <svg class="bd-placeholder-img rounded-circle" width="140"
						height="140" xmlns="http://www.w3.org/2000/svg" role="img"
						aria-label="Placeholder: 140x140"
						preserveAspectRatio="xMidYMid slice" focusable="false"> -->
					<img width="140" height="140"
						src="https://source.unsplash.com/140x140/?library"
						class="bd-placeholder-img rounded-circle" alt="..." />
					<title>Placeholder</title>
					<!--  <rect width="100%" height="100%" fill="#777" />
						<text x="50%" y="50%" fill="#777" dy=".3em">140x140</text>
                    </svg> -->

					<h2>Admission Notice</h2>
					<p>Start of PG-Diploma Courses across India: September 21,
						2021.</p>
					<p>
						<a class="btn btn-primary" href="#">View details &raquo;</a>
					</p>
				</div>
				<!-- /.col-lg-4 -->
				<div class="col-lg-4">
					<!-- <svg class="bd-placeholder-img rounded-circle" width="140"
						height="140" xmlns="http://www.w3.org/2000/svg" role="img"
						aria-label="Placeholder: 140x140"
						preserveAspectRatio="xMidYMid slice" focusable="false"> -->
					<img width="140" height="140"
						src="https://source.unsplash.com/140x140/?magazine"
						class="bd-placeholder-img rounded-circle" alt="..." />
					<title>Placeholder</title>
					<!-- <rect width="100%" height="100%" fill="#777" />
						<text x="50%" y="50%" fill="#777" dy=".3em">140x140</text>
                    </svg> -->

					<h2>College Magazine</h2>
					<p>The Press Releases of C-DAC serve as a ready reckoner on the
						current developments and achievements of C-DAC and its members.</p>
					<p>
						<a class="btn btn-primary" href="#">Downloads &raquo;</a>
					</p>
				</div>
				<!-- /.col-lg-4 -->
			</div>
			<!-- /.row -->


			<!-- START THE FEATURETTES -->

			<hr class="featurette-divider">

			<div class="row featurette">
				<div class="col-md-7">
					<h2 class="featurette-heading">
						Success Mantra <span class="text-muted"></span>
					</h2>
					<p class="lead">"All our dreams can come true, if we have the
						courage to pursue them." - Walt Disney</p>
				</div>
				<div class="col-md-5">
					<!-- <svg class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500"
                        height="500" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 500x500"
                        preserveAspectRatio="xMidYMid slice" focusable="false"> -->
					<img width="500" height="500"
						src="https://source.unsplash.com/500x500/?graduate, alumni, student, institude"
						class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto"
						alt="..." />
					<title>Placeholder</title>
					<!-- <rect width="100%" height="100%" fill="#eee" /><text x="50%" y="50%" fill="#aaa"
                        dy=".3em">500x500</text>
                    </svg> -->

				</div>
			</div>

			<hr class="featurette-divider">

			<div class="row featurette">
				<div class="col-md-7 order-md-2">
					<h2 class="featurette-heading">
						Surround Yourself With Motivated People <span class="text-muted"></span>
					</h2>
					<p class="lead">"Don't limit yourself. Many people limit
						themselves to what they think they can do. You can go as far as
						your mind lets you. What you believe, remember, you can achieve."
						- Mary Kay Ash.</p>
				</div>
				<div class="col-md-5 order-md-1">
					<!-- <svg
						class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto"
						width="500" height="500" xmlns="http://www.w3.org/2000/svg"
						role="img" aria-label="Placeholder: 500x500"
						preserveAspectRatio="xMidYMid slice" focusable="false"> -->
					<img width="500" height="500"
						src="https://source.unsplash.com/500x500/?graduate, alumni, student, institude"
						class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto"
						alt="..." />
					<title>Placeholder</title>
					<!-- <rect width="100%" height="100%" fill="#eee" />
						<text x="50%" y="50%" fill="#aaa" dy=".3em">500x500</text>
                    </svg> -->

				</div>
			</div>

			<hr class="featurette-divider">

			<div class="row featurette">
				<div class="col-md-7">
					<h2 class="featurette-heading">
						Celebrate Your Small Wins <span class="text-muted"></span>
					</h2>
					<p class="lead">"Happiness is not something ready made. It
						comes from your own actions." - Dalai Lama XIV</p>
				</div>
				<div class="col-md-5">
					<!-- 	<svg
						class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto"
						width="500" height="500" xmlns="http://www.w3.org/2000/svg"
						role="img" aria-label="Placeholder: 500x500"
						preserveAspectRatio="xMidYMid slice" focusable="false"> -->
					<img width="500" height="500"
						src="https://source.unsplash.com/500x500/?graduate student"
						class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto"
						alt="..." />
					<title>Placeholder</title>
					<!-- <rect width="100%" height="100%" fill="#eee" />
						<text x="50%" y="50%" fill="#aaa" dy=".3em">500x500</text>
                    </svg> -->

				</div>
			</div>

			<hr class="featurette-divider">

			<!-- /END THE FEATURETTES -->

		</div>
		<!-- /.container -->

		<!-- FOOTER -->
		<footer class="container">
			<p class="float-end">
				<a href="#">Back to top</a>
			</p>
			<p>
				&copy; 2021 &middot; <a href="#">Privacy</a> &middot; <a href="#">Terms</a>
			</p>
		</footer>
	</main>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj"
		crossorigin="anonymous"></script>
</body>
</html>