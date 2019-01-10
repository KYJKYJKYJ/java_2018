<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KH & GYM _ Review</title>
<style type="text/css">
table {
	width: 80%
}

table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}
</style>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
			$('form').on('submit', function() {
			var title = $('input[name=review_title]').val();
			if (title == "") {
				alert("제목을 입력하세요!");
				return false;
			}

			var contents = $('textarea[name=review_contents]').val();
			if (contents == "") {
				alert("내용을 입력하세요!");
				return false;
			}
		});
			
			$('[name=review_upload]').change(function() {
				var fileext = $('[name=review_upload]').val();
				if(fileext != "") {
					var checkext = fileext.split(".").pop().toLowerCase();
					//배열 내의 값을 찾아서 인덱스를 반환합니다.(요소가 없을 경우 -1을 반환).
					if($.inArray(checkext, ["gif","jpg","jpeg","png"]) == -1) {
						alert("gif, jpg, jpeg, png 파일만 업로드 가능합니다.");
						$('[name=review_upload]').val("");
						return false;
				}
			}
			
			var filesize = $('[name=review_upload]').size;
				if(filesize > 1024*1024*1024) {
					alert("파일 크기가 10MB를 초과하였습니다.");
					$('[name=review_upload]').val("");
					return false;
				}				
			});
			
			$('[name=review_contents]').val($('[name=review_contents]').val().replace(/\n/gi, '<br/>'));
	});
</script>
</head>
<body>
	<jsp:scriptlet>
	//치환변수 선언
	pageContext.setAttribute("cr", "/r"); // Space
	pageContext.setAttribute("cn", "\n"); // Enter
	pageContext.setAttribute("crcn", "\r\n"); // Space, Enter
	</jsp:scriptlet>
	<!--//pageContext.setAttribute("br", "<br/>"); //br 태그 -->
	
	<form name="frm" action="updatePro.do" method="post"
		enctype="multipart/form-data">
		<input type="hidden" name="pageNum" value="${param.pageNum}" />
		<input type="hidden" name="num" value="${dto.review_num}" />

		<table>
			<tr>
				<td width="20%">작성자</td>
				<td colspan="3"><input type="text" name="user_id"
					value="${dto.user_id}" readonly="readonly" /></td>

			</tr>

			<tr>
				<td>제목</td>
				<td colspan="3"><input type="text" name="review_title"
					value="${dto.review_title}" /></td>
			</tr>

			<tr>
				<td>날짜</td>
				<td colspan="3"><input type="text" name="review_date"
					value="${dto.review_date}" /></td>
			</tr>

			<tr>
				<td>내용</td>
				<td colspan="3">
				<textarea rows="15" cols="25" name="review_contents"><c:out value="${fn:replace(dto.review_contents,'<br/>',cn)}" /></textarea></td>
			</tr>

			<tr>
				<td>파일</td>
				<td colspan="3"><input type="file" name="review_upload" /><span>${dto.review_upload}</span>
				</td>
			</tr>

			<tr>
				<td colspan="2"><input type="submit" value="수정" />&nbsp;&nbsp;
					<input type="reset" value="취소" /></td>
			</tr>
		</table>

	</form>
</body>
</html>