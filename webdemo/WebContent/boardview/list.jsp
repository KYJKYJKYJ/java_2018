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
		<div id="paging">
					<!-- 이전 처리 -->
					<!-- 이전으로 이동할 것이 있을 경우에만 이전이 뜨도록 -->
					<!-- 이전 4 5 6 / 이전을 누르면 1 2 3이 보이도록, 누르면 가장 첫번째 것이 선택이 되도록 -->
					<!-- 이전의 조건 : 현재페이지의 값이 1보다 클때 , 현재페이지-한블럭에보여줄페이지 (4-3=1페이지가 선택되어서 나옴) -->
					<c:if test="${requestScope.pdto.startPage > 1 }">
						<span><a class="aPage"
							href="list.do?pageNum=${pdto.startPage-pdto.blockPage }">이전</a></span>
					</c:if>

					<!-- 페이지 이동하는 부분 -->
					<c:forEach begin="${requestScope.pdto.startPage }"
						end="${requestScope.pdto.endPage }" var="i">
						<span><a class="aPage" href="list.do?pageNum=${i}">${i}</a></span>
					</c:forEach>

					<!-- 다음 처리 -->
					<!-- 다음으로 이동할 것이 있을 경우에만 다음이 뜨도록 -->
					<!-- 1 2 3 다음 / 다음을 누르면 4 5 6이 보이도록, 누르면 가장 첫번째 것이 선택이 되도록 -->
					<!-- 다음의 조건 : 현재 마지막 페이지보다 토탈페이지가 더 클때, 현재페이지+한블럭에보여줄페이지 (1+3=4페이지가 선택되어서 나옴) -->
					<!-- 리퀘스트 영역에 있는 값들은 '이름.값'으로 가지고 와도 됨(생략해서 많이 사용, 생략하지 않고 다 쓰는것이 정석이기는 함)  -->
					<c:if
						test="${requestScope.pdto.endPage < requestScope.pdto.totalPage }">
						<span><a class="aPage"
							href="list.do?pageNum=${pdto.startPage+pdto.blockPage }">다음</a></span>
					</c:if>
				</div>
		
	</div>
</body>
</html>