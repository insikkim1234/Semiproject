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
   
  
</style>
</head>
<body>
<div>
	<form action="./addboard" method="post" enctype="multipart/form-data">
		<!-- hidden -->
		<input type="hidden" name="currentPage" value="${currentPage}">
		<input type="hidden" name="num" value="${num}">	
		
		<table class="productTable">
			<caption align="top">
				<b>새글쓰기</b>
			</caption>
			<tr>
				<th width="100">제목</th>
				<td>
					<input type="text" name="subject" class="form-control"
					required autofocus value="${subject}">
				</td>
			</tr>
			<tr>
				<th width="100">물품사진</th>
				<td>
					<input type="file" name="upload" multiple class="form-control">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<textarea name="content" class="form-control" required
					style="width: 100%;height: 100px;"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit" class="btn btn-outline-success">물품등록</button>
					
					<button type="button" class="btn btn-outline-success"
					onclick="history.back()">목록으로</button>
				</td>
			</tr>
		</table>
		
		<div class="borderOrange container-fluid d-flex">
			<div class="col-1 ">
				제목
			</div>
			<div class="col">
				<input type="text" name="subject" class="form-control"
					required autofocus value="${subject}">
			</div>
		</div>
		<div class="borderOrange container-fluid d-flex">
			<div class="col">
				<div class="row">물품사진</div>
				<div class="row"><input type="file" name="upload" multiple class="form-control"></div>
			</div>
			<div class="col">
				<div class="d-flex">
					<div class="w10">판매자</div>
					<input type="text" name="name" class=""
					required autofocus value="${name}">
				</div>
				
				<div class="d-flex">
					<div class="w10">희망가격</div>
					<input type="text" name="price" class=""
					required autofocus value="${price}">
				</div>
				<div class="d-flex">
					<div class="w10">희망장소</div>
					<input type="text" name="place" class=""
					required autofocus value="${place}">
				</div>
			</div>
		</div>
	</form>
</div>

</body>
</html>

