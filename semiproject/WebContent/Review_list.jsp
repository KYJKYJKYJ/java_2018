<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KH & GYM _ Review</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	
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
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>파일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${requestScope.aList}" var="dto">
					<tr>
						<td>${dto.review_num}</td>
						<td><a href="view.do?num=${dto.review_num}">${dto.review_title}</a></td>
						<td>${dto.user_id}</td>
						<td><c:if test="${dto.review_upload != null}">
								<img src="../images/save.gif" />
							</c:if></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div id="paging">
			<!-- 이전 -->
			<c:if test="${requestScope.pdto.startPage > 1}">
				<a href="list.do?pageNum=${pdto.startPage-pdto.blockPage}">이전</a>
			</c:if>

			<!-- 페이지 -->
			<c:forEach begin="${requestScope.pdto.startPage}"
				end="${requestScope.pdto.endPage}" var="i">
				<span><a href="list.do?pageNum=${i}">${i}</a></span>
			</c:forEach>

			<!-- 다음 -->
			<c:if
				test="${requestScope.pdto.endPage < requestScope.pdto.totalPage}">
				<a href="list.do?pageNum=${pdto.startPage+pdto.blockPage}">다음</a>
			</c:if>
		</div>
	</div>
</body>
</html>