<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>KH & GYM</title>
<link rel="stylesheet" href="css\main.css" />
<link rel="stylesheet" href="css\main_layout.css" />
<link rel="stylesheet" href="css\navbar_font.css" />
<link href="css/accordionImageMenu.css" rel="stylesheet" type="text/css" />

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#instructor_accordion').AccordionImageMenu({
			  'border' : 2, // 선의 생성을 설정
			  'openItem': 0, // 마우스를 올리지 않았을 때 기본 열려있는 배너
			  'duration': 400, // 전환되는 속도를 설정
			  'openDim': 600, // 열려있는 배너의 너비를 설정
			  'closeDim': 251.64, // 닫혀있는 배너의 너비를 설정
			  'effect': 'easeOutQuint', // 전환될 때의 가속도를 설정
			  'fadeInTitle': false, // true시 현재 보이는 메뉴만 보여줌 (그냥 false로)
			  'height': 200  // 배너의 높이를 설정
			});	
	});
</script>

<!-- 부트스트랩 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript" src="js/jquery.accordionImageMenu.min.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.10.3.custom.min.js"></script>


</head>
<body>
	<!-- 전체 레이아웃 잡기 (wrap) -->
	<div id="wrap">
		<!-- header 레이아웃 (헤더)-->
		<div id="header">
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

				<div id="login">로그인</div>
				
				<!-- 강사들 프리뷰 아코디언 -->
				<div id="accordion">
					<ul id="instructor_accordion">
						<li><a href="#"><img src="images/main3.jpg"></a>
						<li><a href="#"><img src="images/main3.jpg"></a>
						<li><a href="#"><img src="images/main3.jpg"></a>
						<li><a href="#"><img src="images/main3.jpg"></a>
					</ul>
				</div>
			</div>
			<!-- container1 end -->

			<div id="container2">
				<div id="program">프로그램</div>
				<div id="location">위치</div>
			</div>
			<!-- container2 end -->
		</div>
		<!-- section end -->

		<div id="footer">
			<div>KH_GYM copyleft</div>
		</div>
		<!-- footer end -->
	</div>
	<!-- wrap end -->
</body>
</html>