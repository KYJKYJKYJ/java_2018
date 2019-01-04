<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>KH & GYM</title>
<!-- 기본 CSS -->
<link rel="stylesheet" href="css/main.css" />
<link rel="stylesheet" href="css/main_layout.css" />

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- bxslider js -->
<script type="text/javascript" src="js/main_bxslider.js"></script>

<!-- location 맵 js -->
<script src="//maps.googleapis.com/maps/api/js?key=AIzaSyA1ZvigA9nlrvCEkKzxjOWmZTYFKjyWcYo" async="" defer="defer" type="text/javascript"></script>
<script type="text/javascript" src="js/main_location.js"></script>

<!-- 부트스트랩 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- bxslider -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.15/jquery.bxslider.min.css"
	rel="stylesheet" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.15/jquery.bxslider.min.js"></script>

<script type="text/javascript" src="js/main_greeting.js"></script>
</head>
<body>
	<!-- 전체 레이아웃 잡기 (wrap) -->
	<div id="wrap">
		<!-- header 레이아웃 (헤더)-->
		<div id="nav" class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
			<!-- 화면 980px로 제한 두기 위해 fluid 두지 않음 -->
			<div class="navbar-header">
				<a class="navbar-brand" href="http://localhost:8090/semiprojcet/KH_GYM" id="barlogo">KH & GYM</a>
			</div>
			<ul class="nav navbar-nav">
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">About Center <span
						class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="javascript:void(0)" id="greeting">Greeting</a>
						<li><a href="instructor.jsp" id="nav_instructor">Instructor</a>
						<li><a href="#" id="nav_centerview">Center View</a>
						<li><a href="location.jsp" id="nav_location">Location</a>
					</ul></li>
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">Program <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="aboutProgram.jsp">About Program</a>
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

		<div id="section">
			<!-- container1 (회전목마, ID, Password) -->
			<div id="container1">
				<!-- 회전목마 효과 (부트스트랩) -->
				<div id="photoCarousel" class="carousel silde" data-ride="carousel"
					data-pause="hover">
					<ol class="carousel-indicators">
						<li data-target="#photoCarousel" data-slide-to="0" class="active"></li>
						<li data-target="#photoCarousel" data-slide-to="1"></li>
						<li data-target="#photoCarousel" data-slide-to="2"></li>
						<li data-target="#photoCarousel" data-slide-to="3"></li>
					</ol>

					<!-- 이미지 등록 -->
					<div class="carousel-inner">
						<div class="item active">
							<img class="img-responsive center-block" src="images\main1.jpg"
								alt="PT" style='height: 100%; width: 70%; object-fit: container' />
							<div class="carousel-caption">
								<h3>PT</h3>
								<p>PT</p>
							</div>
						</div>

						<div class="item">
							<img class="img-responsive center-block" src="images\main2.jpg"
								alt="Spinning"
								style='height: 100%; width: 70%; object-fit: container' />
							<div class="carousel-caption">
								<h3>Spinning</h3>
								<p>Spinning</p>
							</div>
						</div>

						<div class="item">
							<img class="img-responsive center-block" src="images\main3.jpg"
								alt="Yoga"
								style='height: 100%; width: 70%; object-fit: container' />
							<div class="carousel-caption">
								<h3>Yoga</h3>
								<p>Yoga</p>
							</div>
						</div>

						<div class="item">
							<img class="img-responsive center-block" src="images\main4.jpg"
								alt="main_image3"
								style='height: 100%; width: 70%; object-fit: container' />
							<div class="carousel-caption">
								<h3>Pilates</h3>
								<p>Pilates</p>
							</div>
						</div>
					</div>

					<!-- 왼쪽, 오른쪽 버튼 -->
					<div>
						<a class="left carousel-control" href="#photoCarousel"
							data-slide="prev"> <span
							class="glyphicon glyphicon-chevron-left"></span> <span
							class="sr-only">Prev</span>
						</a> <a class="right carousel-control" href="#photoCarousel"
							data-slide="next"> <span
							class="glyphicon glyphicon-chevron-right"></span> <span
							class="sr-only">Next</span>
						</a>
					</div>
				</div>

				<!-- 로그인 -->
				<div id="main_login">로그인</div>

				<!-- 강사들 프리뷰 -->
				<div id="main_instructor">
					<ul class="bxslider">
						<li><img src="images/gosu.PNG" /></li>
						<li><img src="images/gongyou.PNG" /></li>
						<li><img src="images/bear.PNG" /></li>
						<li><img src="images/han.PNG" /></li>
					</ul>
				</div>
			</div>
			<!-- container1 end -->

			<div id="container2">
				<div id="program">프로그램</div>
				<div id="location">
					<div id="map_view" style="width:100%; height:298px;"></div>
				</div>
			</div>
			<!-- container2 end -->
		</div>
		<!-- section end -->

		<div id="footer">
			<img src="images/logo.png">
			<p>KH_GYM copyleftⓒ</p>
			<p>서울특별시 강남구 역삼동 강남구 테헤란로14길</p>
			<p>사업자 : 한윤희 Tel 02) 0123-4567</p>
		</div>
		<!-- footer end -->
	</div>
	<!-- wrap end -->
</body>
</html>