<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
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
   <a href="disList">토론 리스트 목록</a>

   <table border="1" width="80%">
      <tr>
         <th width="20%">제목</th>
         <td>${requestScope.dto.title }</td>
      </tr>

      <tr>
         <th>내용</th>
         <td>${requestScope.dto.content }</td>
      </tr>
   </table>
   
   <!-- 댓글목록출력 -->
   <p>댓글내용</p>
   <div id="commentList">
   	<script type="text/javascript">
   		listView("${requestScope.dto.num}");
   	</script>
   </div>
</body>
</html>