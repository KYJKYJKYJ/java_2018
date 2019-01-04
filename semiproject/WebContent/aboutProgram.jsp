<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KH & GYM _ About Program</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {

	});
</script>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="css\aboutProgram.css" />
<link rel="stylesheet" href="css\navbar_font.css" />

</head>
<body>
	<div id="nav" class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
			<!-- 화면 980px로 제한 두기 위해 fluid 두지 않음 -->
			<div class="navbar-header">
				<a class="navbar-brand" href="index.jsp">KH & GYM</a>
			</div>
			<ul class="nav navbar-nav">
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">About Center <span
						class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="greeting.jsp" id="nav_greeting">Greeting</a>
						<li><a href="#" id="nav_instructor">Instructor</a>
						<li><a href="#" id="nav_centerview">Center View</a>
						<li><a href="#" id="nav_location">Location</a>
					</ul></li>
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">Program <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="#">About Program</a>
						<li><a href="#">Registration</a>
					</ul></li>
				<li><a href="#">Learn</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="#">Join</a></li>
				<li><a href="#">Login</a></li>
			</ul>
		</div>
	</div>
	
	<img src="images/program_top.png" alt="program_top" width="100%" />
	
	<div id="program_guide">
		<section>
			<img src="images/content_pt.png" width="100%">
			<hr>
			<img src="images/content_spinning.png" width="100%">
			<hr>
			<img src="images/content_yoga.png" width="100%">
			<hr>
			<img src="images/content_pilates.png" width="100%">
		</section>
	</div>

	<div id="footer">
		<div>KH_GYM copyleft</div>
	</div>
	<!-- footer end -->
</body>
</html>