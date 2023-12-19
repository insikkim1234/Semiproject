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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<style>
   
</style>
<body>
<div style="margin: 30px;width:500px;">
	<div class="fw_500 cBlack mt-5">
		<a href="${pageContext.request.contextPath}">HOME</a><span class="fs_18 mx-1">></span>
		<a href="${pageContext.request.contextPath}/board/list">자취생 커뮤니티</a><span class="fs_18 mx-1">></span>
		<a href="${pageContext.request.contextPath}/board/content">상세 페이지</a>
	</div>
<h3><b>${dto.comBoardSubject}</b></h3>
<div style="width:500px;">
<span>${dto.userName}</span>
<span class="day">
조회 ${dto.comBoardviewCount}&nbsp;&nbsp;&nbsp;
			<fmt:formatDate value="${dto.writeDay}" pattern="yyyy-MM-dd HH:mm"/>
</span>
<hr>
<pre>${dto.comBoardContent}</pre>
<div style="margin: 20px;">
<i class="bi bi-chat-dots"></i> &nbsp;${acount}<br><br>


</div>
<div style="margin-bottom: 10px;">
 					<form action="./addanswer" method="post">
 						<input type="hidden" name="num" value="${dto.comBoardSeq}">
 						<div class="input-group" style="width:500px;"> 						
 							<input type="text" name="nickname" class="form-control"
 							style="margin-left:5px;width:100px;" placeholder="닉네임">
 							<input type="text" name="content" class="form-control"
 							style="margin-left:5px;width:300px;" placeholder="댓글">
 							
 							<button type="submit" class="btn btn-sm btn-outline-success">저장</button>
 						</div>
 					</form>
 		</div> 	
		


<button type="button" class="btn btn-outline-info btn-sm"
		style="width:80px" onclick="location.href='./boardform'">글쓰기</button>
		
		<button type="button" class="btn btn-outline-info btn-sm"
		style="width:80px" onclick="location.href='./list'">목록</button>
		
		<button type="button" class="btn btn-outline-info btn-sm"
		style="width:80px" onclick="location.href='./updateform?comBoardSeq=${dto.comBoardSeq}'">수정</button>
		
		<button type="button" class="btn btn-outline-info btn-sm"
		style="width:80px" onclick="location.href='./delete?comBoardSeq=${dto.comBoardSeq}'">삭제</button>

</div>
</div>
</body>