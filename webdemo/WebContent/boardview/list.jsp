<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var param = window.location.search.substring(1);
	    var num = param.substring(8);
	    $("span>a[href='list.do?pageNum=" + num + "']").css('color','red');
	});
</script>

<style type="text/css">

</style>
</head>
<body>
	<div class="wrap">
	<p>
		<a href="writeForm.do">글쓰기</a>
	</p>
		<table>
			<thead>
				<tr>
					<th>num</th>
					<th>subject</th>
					<th>writer</th>
					<th>readcount</th>
					<th>file</th>
				</tr>
			</thead>
			<tbody>			
				<c:forEach items="${requestScope.aList}" var="dto">
					<tr>
						<td>${dto.num}</td>
						<!-- num이 구분자이므로 값을 받아서 구분할 것임, view.do는 상세보기 -->
						<td>
						<c:if test="${dto.re_level != 0}">
							<img src="../boardview/images/level.gif" width="${10*dto.re_level}">
							<img src="../boardview/images/re.gif" />
						</c:if>
						<a href="view.do?num=${dto.num}">${dto.subject}</a></td>
						<td>${dto.writer}</td>
						<td>${dto.readcount}</td>
						<td>
						<c:if test="${dto.upload != null}">
							<img src="../boardview/images/save.gif" />
						</c:if></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<!-- 이전 -->
		<c:if test="${requestScope.pdto.startPage > 1}">
		<a href="list.do?pageNum=${pdto.startPage-pdto.blockPage}">이전</a>
		</c:if>
		
		<!-- 페이지 -->
		<c:forEach begin="${requestScope.pdto.startPage}" end="${requestScope.pdto.endPage}" var="i">
			<span><a href="list.do?pageNum=${i}">${i}</a></span>		
		</c:forEach>
		
		<!-- 다음 -->
		<c:if test="${requestScope.pdto.endPage < requestScope.pdto.totalPage}">
		<a href="list.do?pageNum=${pdto.startPage+pdto.blockPage}">다음</a>
		</c:if>
		
	</div>
</body>
</html>