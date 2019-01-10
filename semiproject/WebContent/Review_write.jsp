<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KH & GYM _ Review</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
	<form name="frm" method="post" enctype="multipart/form-data" action="write.do">
	<table>
         <tr>
            <td align="right" colspan="2"><a href="list.do">리스트</a></td>
         </tr>

         <tr>
            <td width="20%" align="center">작성자</td>
            <td width="80%"><input type="text" name="user_id" readonly="readonly"
            value="${sessionScope.sessionID}"/></td> <!-- 자바로 세션 아이디를 받아오자 -->
         </tr>

         <tr>
            <td width="20%" align="center">제목</td>
            <td width="80%">
				<input type="text" name="review_title"  />                
            </td>
         </tr>

         <tr>
            <td width="20%" align="center">내용</td>
            <td width="80%"><textarea name="review_contents" rows="13" cols="40"></textarea></td>
         </tr>

         <tr>
            <td width="20%" align="center">파일첨부</td>
            <td width="80%" id="fileDiv"><input type="file" name="review_upload" /></td>
         </tr>

         <tr>
            <td colspan="2" align="center">
            <input type="submit" value="글쓰기" />&nbsp;&nbsp;&nbsp;
            <input type="reset" value="취소" /></td>
         </tr>
      </table>
	</form>
</body>
</html>