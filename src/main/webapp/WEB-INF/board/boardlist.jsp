<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Jua&family=Lobster&family=Nanum+Pen+Script&family=Permanent+Marker&family=Single+Day&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<style>
   body * {
       font-family: 'Jua';
   }
   
   
  
</style>
</head>
<body>

	<div class="mlist_head fs_20">
		총 ${totalCount}개의 글이 있습니다
		
		
			<button type="button" class="btn btn-sm btn_product"
			onclick="location.href='./form'" style="margin-left:300px;">글쓰기</button>
		
	<table class="table table-bordered">
		<thead>
			<tr>
				<th width="50">번호</th>
				<th width="350">제목</th>
				<th width="80">작성자</th>
				<th width="100">작성일</th>
				<th width="60">조회</th>				
			</tr>
		</thead>
		
		</table>
		   			
		   			
		   			
		   			
		   		
		
	
		
		
		
		
		</div>




</body>


</html>