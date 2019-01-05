<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KH & GYM</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- 부트스트랩 -->
<script src="js/bootstrap.min.js"></script>

<link rel="stylesheet" href="css/bootstrap-theme.css">
<link rel="stylesheet" href="css/bootstrap-theme.min.css">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/bootstrap.min.css">

<!-- css 적용 -->
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/nav_accordian.css">

<!-- js 적용 -->
<script type="text/javascript" src="js/main_navaccordian.js"></script>
<script type="text/javascript" src="js/main_greeting.js"></script>

<!-- location 맵 js -->
<script
	src="//maps.googleapis.com/maps/api/js?key=AIzaSyA1ZvigA9nlrvCEkKzxjOWmZTYFKjyWcYo"
	async="" defer="defer" type="text/javascript"></script>
<script type="text/javascript" src="js/main_location.js"></script>

<!-- bxslider -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.15/jquery.bxslider.min.css"
	rel="stylesheet" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.15/jquery.bxslider.min.js"></script>

<!-- bxslider js -->
<script type="text/javascript" src="js/main_bxslider.js"></script>

</head>
<body>
	<div id="wrap">
		<div id="header">
			<h1>
				<a href="#"><img src="images/KHGYM_logo.png" id="mainlogo" alt="KH & GYM"></a>
			</h1>
			<div style="position: relative;">
				<div class="nav_accordian" id="center_accordian">
					<ul id="navmenu">
						<li>
							<h3>
								<span class="aboutcenter"></span>About Center
							</h3>
							<ul id="aboutcenter_sub">
								<li><a href="javascript:void(0)" id="greeting">Greeting</a></li>
								<li><a href="#">Instructor</a></li>
								<li><a href="#">Center View</a></li>
								<li><a href="#">Location</a></li>
							</ul>
					</ul>
				</div>
				<div class="nav_accordian" id="program_accordian">
					<ul id="navmenu">
						<li>
							<h3>
								<span class="program"></span>Program
							</h3>
							<ul id="program_sub">
								<li><a href="#">About Program</a></li>
								<li><a href="#">Registration</a></li>
							</ul>
						</li>
					</ul>
				</div>
				<div class="nav_accordian" id="community_accordian">
					<ul id="navmenu">
						<li>
							<h3>
								<span class="community"></span>Community
							</h3>
							<ul id="community_sub">
								<li><a href="#">Notice</a></li>
								<li><a href="#">Q & A</a></li>
								<li><a href="#">Review</a></li>
								<li><a href="#">Learn</a></li>
							</ul>
						<li>
					</ul>
				</div>
				<div class="nav_accordian" id="account_accordian">
					<ul id="navmenu">
						<li>
							<h3>
								<span class="account"></span>Account
							</h3>
							<ul id="account_sub">
								<li><a href="#">Login</a></li>
								<li><a href="#">Join</a></li>
							</ul>
						<li>
					</ul>
				</div>
			</div>
		</div>
		<!-- header end -->
		<div id="section">
			<!-- 회전목마 효과 (부트스트랩) -->
			<div id="programCarousel" class="carousel silde" data-ride="carousel"
				data-pause="hover">
				<h1 id="carousel_title">Program.</h1>
				<ol class="carousel-indicators">
					<li data-target="#programCarousel" data-slide-to="0" class="active"></li>
					<li data-target="#programCarousel" data-slide-to="1"></li>
					<li data-target="#programCarousel" data-slide-to="2"></li>
					<li data-target="#programCarousel" data-slide-to="3"></li>
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
							alt="Pilates"
							style='height: 100%; width: 70%; object-fit: container' />
						<div class="carousel-caption">
							<h3>Pilates</h3>
							<p>Pilates</p>
						</div>
					</div>
				</div>
			</div>

			<!-- 왼쪽, 오른쪽 버튼 -->
			<div>
				<a class="left carousel-control" href="#programCarousel"
					data-slide="prev"> <span
					class="glyphicon glyphicon-chevron-left"></span> <span
					class="sr-only">Prev</span>
				</a> <a class="right carousel-control" href="#programCarousel"
					data-slide="next"> <span
					class="glyphicon glyphicon-chevron-right"></span> <span
					class="sr-only">Next</span>
				</a>
			</div>

			<!-- 강사들 프리뷰 -->
			<!-- 회전목마 효과 (부트스트랩) -->
			<div id="instructorCarousel" class="carousel silde"
				data-ride="carousel" data-pause="hover">
				<h1 id="carousel_title">Instructor.</h1>
				<ol class="carousel-indicators">
					<li data-target="#instructorCarousel" data-slide-to="0"
						class="active"></li>
					<li data-target="#instructorCarousel" data-slide-to="1"></li>
					<li data-target="#instructorCarousel" data-slide-to="2"></li>
					<li data-target="#instructorCarousel" data-slide-to="3"></li>
				</ol>

				<!-- 이미지 등록 -->
				<div class="carousel-inner">
					<div class="item active">
						<img class="img-responsive center-block" src="images\gosu.jpg"
							alt="gosu"
							style='height: 100%; width: 70%; object-fit: container' />
					</div>

					<div class="item">
						<img class="img-responsive center-block" src="images\gongyou.jpg"
							alt="gongyou"
							style='height: 100%; width: 70%; object-fit: container' />
					</div>

					<div class="item">
						<img class="img-responsive center-block" src="images\bear.jpg"
							alt="bear"
							style='height: 100%; width: 70%; object-fit: container' />
					</div>

					<div class="item">
						<img class="img-responsive center-block" src="images\han.jpg"
							alt="han" style='height: 100%; width: 70%; object-fit: container' />
					</div>
				</div>
			</div>

			<!-- 왼쪽, 오른쪽 버튼 -->
			<div>
				<a class="left carousel-control" href="#instructorCarousel"
					data-slide="prev"> <span
					class="glyphicon glyphicon-chevron-left"></span> <span
					class="sr-only">Prev</span>
				</a> <a class="right carousel-control" href="#instructorCarousel"
					data-slide="next"> <span
					class="glyphicon glyphicon-chevron-right"></span> <span
					class="sr-only">Next</span>
				</a>
			</div>
			<div id="location">
				<h1>Location.</h1>
				<div id="map_view" style="width: 70%; height: 298px;"></div>
			</div>
		</div>

		<!-- section end -->
		<div id="footer">
			<img src="images/KHGYM_logo.png" id="footerlogo">
			<div style="position: relative">
				<p id="footer_copyright">KH & GYM corp. copyleftⓒ</p>
				<p id="footer_company">상표명 : KH & GYM</p>
				<p id="footer_location">주소 : 서울특별시 강남구 역삼동 강남구 테헤란로14길</p>
				<p id="footer_manager">사업자 : 한윤희</p>
				<p id="footer_tel">TEL : 02) 0123-4567</p>
			</div>
		</div>
		<!-- footer end -->
	</div>
	<!-- end wrap -->
</body>
</html>