<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
 table{  
  width:80%
 }
 
 table, th, td{
  border:1px solid black;
  border-collapse: collapse;
 } 
</style>
</head>
<body>

<form name="frm" action="updatePro.do" method="post" enctype="multipart/form-data">
       <input type="hidden" name="pageNum" value="${param.pageNum}" />
       <input type="hidden" name="num" value="${dto.num}" />
       
      <table>
         <tr>

            <td width="20%">글쓴이</td>
            <td colspan="3"><input type="text" name="writer"
               value="${dto.writer}" readonly="readonly" /></td>

         </tr>

         <tr>
            <td>제목</td>
            <td colspan="3"><input type="text" name="subject"
               value="${dto.subject}" /></td>
         </tr>

         <tr>
            <td>메일</td>
            <td colspan="3"><input type="text" name="email"
               value="${dto.email}" /></td>
         </tr>

         <tr>
            <td>내용</td>
            <td colspan="3">            
                 
                  <textarea rows="15"
                  cols="25" name="content"><c:out value="${dto.content}" /></textarea></td>
         </tr>

         <tr>
            <td>파일</td>
            <td colspan="3"><input type="file" name="upload" /><span>${dto.upload}</span>
            </td>
         </tr>

         <tr><td colspan="2">
            <input type="submit" value="수정" />&nbsp;&nbsp;
            <input type="reset" value="취소" /></td>
         </tr>
      </table>

   </form>
</body>
</html>