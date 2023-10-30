<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title></title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<style>
  	nav .navbar-nav li a:link{color: white;}
  	nav .navbar-nav li a:hover{color: #0099a4;}
  	nav .navbar-nav li a:active{color: grey;}
	#up:hover{position:relative; right:3px;bottom:2px;background-color: #053951;}	  
 	</style>
 	<script>
	function confOut() {
	    return confirm("로그아웃하시겠습니까?");
	}
</script>
</head>
<body>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
	<nav class="navbar navbar-expand-lg navbar-dark fixed top bg-dark" aria-label="Eighth navbar example">
	<div class="container">
		<a class="navbar-brand" href="/main" target="main"><img src="./img/logo.png" width="180" height="60" border="0" id="up"></a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample07" aria-controls="navbarsExample07" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
			<div class="collapse navbar-collapse" id="navbarsExample07">
				<ul class="navbar-nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
					<li class="nav-item mx-2">
						<a class="nav-link" href="intro.html" target="main">Resort</a>
					</li>
					<li class="nav-item mx-2">
						<a class="nav-link" href="a_01.html" target="main">Rooms</a>
					</li>
					<li class="nav-item mx-2">
						<a class="nav-link" href="b_01.html" target="main">Location</a>
					</li>
					<li class="nav-item mx-2">
						<a class="nav-link" href="c_01.html" target="main">Places</a>
					</li>
					<li class="nav-item mx-2">
						<a class="nav-link" href="resvList" target="main">Reservation</a>
					</li>
				</ul>
			</div>
			<div class="text-end">
				<% if ((String)session.getAttribute("login_stat") == null) { %>
					<a class="btn btn-outline-light me-2" href="login" role="button" target="main">Login</a>
					<a class="btn btn-outline-light me-2" href="accCreate" role="button" target="main">Sign-up</a>
				<% } else if ((Long)session.getAttribute("admin_auth") == 0 && "in".equals((String)session.getAttribute("login_stat"))) { %>
					<a class="btn btn-outline-light me-2" href="logOut" role="button" target="main" onclick="return confOut();">LogOut</a>
					<a class="btn btn-outline-light me-2" href="accInfo" role="button" target="main">Profile</a>
				<% } else if ((Long)session.getAttribute("admin_auth") == 1 && "in".equals((String)session.getAttribute("login_stat"))) { %>
					<a class="btn btn-outline-light me-2" href="logOut" role="button" target="main" onclick="return confOut();">LogOut</a>
					<a class="btn btn-outline-light me-2" href="adminPage" role="button" target="main">Admin</a>
				<% }%>
			</div>
	</div>
 	</nav>
</body>
</html>