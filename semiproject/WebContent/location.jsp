<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<meta charset="UTF-8">
<title>KH & GYM _ Location</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

	});
</script>

<script src="//maps.googleapis.com/maps/api/js?key=AIzaSyA1ZvigA9nlrvCEkKzxjOWmZTYFKjyWcYo" async="" defer="defer" type="text/javascript"></script>
 <script>
 function initialize() {

 var Y_point = 37.499001; // Y 좌표
 var X_point = 127.032906; // X 좌표
 var zoomLevel = 17; // 첫 로딩시 보일 지도의 확대 레벨
 var markerTitle = "KH & GYM"; // 현재 위치 마커에 마우스를 올렸을때 나타나는 이름
 var markerMaxWidth = 300; // 마커를 클릭했을때 나타나는 말풍선의 최대 크기

 // 말풍선 내용
 var contentString = '<div id="content">' +
 '<div id="siteNotice">' +
 '</div>' +
 '<h3 id="firstHeading" class="firstHeading">KH&GYM</h3>' +
 '<div id="bodyContent">' +
 '<p>서울특별시 강남구 역삼동 강남구 테헤란로14길<br />' +
 'Tel. Tel 02) 0123-4567</p>' +
 '</div>' +
 '</div>';

 var myLatlng = new google.maps.LatLng(Y_point, X_point);
 var mapOptions = {
 zoom: zoomLevel,
 center: myLatlng,
 mapTypeId: google.maps.MapTypeId.ROADMAP
 }
 var map = new google.maps.Map(document.getElementById('map_view'), mapOptions);

 var marker = new google.maps.Marker({
 position: myLatlng,
 map: map,
 title: markerTitle
 });

 var infowindow = new google.maps.InfoWindow(
 {
 content: contentString,
 maxWidth: markerMaxWidth
 }
 );

 google.maps.event.addListener(marker, 'click', function() {
 infowindow.open(map, marker);
 });
 }
 </script>



<style type="text/css">
div#wrap {
	width: 100%;
	text-align: left;
	padding: 0%;
	leftmargin: 0;
}

header {
	background-color: black;
	height: 40%;
	color: lightgray;
	leftmargin: 0;
}

body {
	leftmargin: 0;
	rightmargin: 0;
	margin: 0;
	padding: 0;
}

#intro {
	text-align: center;
}
#intro2 {
	text-align: center;
}

#intro2 img{

	width: 800px;
	height: 450px;
}
#map_view{
margin: auto;
}
</style>
</head>
<body onload="initialize()">
	<div id="wrap">
	
	</div>
	<div id="intro">
		<img src="images/location_img.png">
	</div>
	
	<div id="intro2">
		<img src="images/location.png">
	<hr>
		<img src="images/locationInfo.png">
	</div>
	
	 <div id="map_view" style="width:800px; height:480px;">
	
	 </div>
	
	
	
</body>
</html>