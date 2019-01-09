<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KH & GYM _ Review</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('form').on('submit', function(){
			$('[name=content]').val($('[name=content]').val().replace(/\n/gi, '<br/>'));
		 });
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
            <td width="80%"><input type="text" name="user_id" /></td> <!-- 자바로 세션 아이디를 받아오자 -->
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