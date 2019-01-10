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
   $(document).ready(function(){
      $('.list').on('click', function() {
    	  $('form').attr('action', 'list.do');
    	  $('form').submit();
      });
      
      $('.reply').on('click', function() {
    	 $('form').attr('action', 'writeForm.do');
    	 $('form').submit();
      });
      
      $('.update').on('click', function() {
    	  $('form').attr('action', 'updateForm.do');
    	  $('form').submit();
      });
      
      $('.del').on('click', function() {
    	  $('form').attr('action', 'delete.do');
    	  $('form').submit();
      });
   });
 </script>
 
</head>
<body>
 <table>
      <tr>
         <td width="20%">글쓴이</td>
         <td>${dto.user_id}</td>
      </tr>

      <tr>
         <td>제목</td>
         <td colspan="3">${dto.review_title}</td>
      </tr>

      <tr>
         <td>날짜</td>
         <td colspan="3">${dto.review_date}</td>
      </tr>

      <tr>
         <td>내용</td>
         
         <td colspan="3">
         ${dto.review_contents}
         </td>
      </tr>

      <tr>
         <td>파일</td>
         <td colspan="3"><a href="download.do?num=${dto.review_num}">${dto.review_upload}</a>
         </td>
      </tr>
   </table>
   
   <!-- 입력된 내용을 처리하는 서버 프로그램의 URI를 지정하는 역할 -->
   <form name="frm" method="post">
    <input type="hidden" name="num" value="${dto.review_num}" />
    <input type="hidden" name="ref" value="${dto.review_ref}"  />
    <!-- ref : 제목 + 답변글 그룹 --> 
    <%-- <input type="hidden" name="re_step" value="${dto.re_step}" /> --%>
    <!-- re_step : 출력순서, 제목: 최근 입력 먼저 출력, 답변: 최근 입력 먼저 출력 -->
    <%-- <input type="hidden" name="re_level" value="${dto.re_level}" /> --%>
    <!-- re_level : 들여쓰는 것, 답변 되는거 들여쓰는 순서 말함 -->
    <!-- 제목 :~~~~~
    		답변1: ~~~~~
    			답변2: ~~~~ 처럼 -->
    <input type="hidden" name="pageNum" value="${param.pageNum}" />
    
   <input type="button" value="목록" class="list" /> 
   <!-- <input type="button" value="답변" class="reply" /> --> 
   <input type="button" value="수정" class="update" />
   <input type="button" value="삭제" class="del" />
   </form>

	<!-- 댓글목록출력 -->
	<p>댓글내용</p>
	<div id="commentList">
		<script type="text/javascript">
			listView("${requestScope.dto.re_col}");
		</script>
	</div>

	<!-- 댓글수정 -->
	<div id="divUpdate">
		<input type="hidden" id="textCol" />
		<textarea id="textUpdate" rows="10" cols="20"></textarea>
		<input type="button" id="btnUpdate" value="수정" />
	</div>

	<!-- 댓글입력 -->
	<div id="commentAdd">
		<textarea id="textInput"></textarea>
		<input type="button" id="btnInput" value="댓글 입력" />
	</div>
   
</body>
</html>