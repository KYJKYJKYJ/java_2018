<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KH_GYM</title>
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

<link rel="stylesheet" href="css\main.css" />
<link rel="stylesheet" href="css\main_layout.css" />
</head>
<body>
	<!-- 전체 레이아웃 잡기 (wrap) -->
	<div id="wrap">
		<!-- header 레이아웃 (헤더)-->
		<div id="header">
			<h1>
				<em>KH_GYM</em>
			</h1>
		</div>

		<!-- container 레이아웃 (내용) -->
		<div id="container">
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
					data-slide="prev"> <span class="glyphicon glyphicon-chevron-left"></span>
					<span class="sr-only">Prev</span>
				</a> <a class="right carousel-control" href="#photoCarousel"
					data-slide="next"> <span class="glyphicon glyphicon-chevron-right"></span>
					<span class="sr-only">Next</span>
				</a>
				</div>
			</div>
			
			<div id="login">로그인</div>
			<div id="accordian">아코디언</div>

		</div>
		<!-- container end -->
		<div id="footer">
			<span>KH_GYM copyleft</span>>
		</div>
		<!-- footer end -->
	</div>
	<!-- wrap end -->
</body>
</html>