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
	
	});
</script>
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
						<td><a href="view.do?num=${dto.num}">${dto.subject}</a></td>
						<td>${dto.writer}</td>
						<td>${dto.readcount}</td>
						<td>${dto.upload}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>