<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>KH & GYM _ Greeting</title>
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

<link rel="stylesheet" href="css\greeting.css" />
<link rel="stylesheet" href="css\navbar_font.css" />
</head>
<body>
	<!-- 부트스트랩 navbar 사용 -->
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
						<li><a href="greeting.jsp" id="greeting">Greeting</a>
						<li><a href="#" id="instructor">Instructor</a>
						<li><a href="#" id="centerview">Center View</a>
						<li><a href="#" id="location">Location</a>
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

	<section>
		<img src="images\greeting.png" width="100%" height="700px"> <img
			id="content" src="images\intro_disc1.png" width="35%" height="7%">
		<img src="images\content_img1.gif" width="70%" height="35%"> <img
			id="content1" src="images\intro_content1.png" width="70%"
			height="35%">
	</section>

	<div id="footer">
		<div>KH_GYM copyleft</div>
	</div>
	<!-- footer end -->
</body>
</html>