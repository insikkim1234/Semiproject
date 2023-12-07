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
	<h6 class="alert alert-success" role="alert">
		총 ${totalCount}개의 글이 있습니다
		
		
			<button type="button" class="btn btn-outline-danger btn-sm"
			onclick="location.href='./form'" style="margin-left:300px;">글쓰기</button>
		
	</h6>
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
		<tbody>
		<c:forEach var="dto" items="${list}">
		   <tr>
		   		<td>
		   			${no}
		   			<c:set var="no" value="${no-1}"/>
		   		</td>
		   		<td>
		   			<!-- 제목 -->
		   			<!-- 답글 레벨 1당 두칸 띄우기 -->
		   			<c:forEach begin="1" end="${dto.relevel}">
		   					&nbsp;&nbsp;
		   			</c:forEach>
		   			<!-- relevel 이 0 이상인경우 답글 아이콘 -->
		   			<c:if test="${dto.relevel>0}">
		   				<img src="../res/photo/re.png">
		   			</c:if>
		   			<!-- 제목 표시 -->
		   			<a href="./content?num=${dto.num}&currentPage=${currentPage}">
		   				${dto.subject}
		   				<c:if test="${dto.photocount==1}">
		   					<i class="bi bi-image" style="color:gray;"></i>
		   				</c:if>
		   				<c:if test="${dto.photocount>1}">
		   					<i class="bi bi-images" style="color:gray;"></i>
		   				</c:if>
		   			</a>
		   			
		   			<!-- 댓글 갯수 표시 -->
		   			<c:if test="${dto.acount>0}">
		   				<a href="./content?num=${dto.num}&currentPage=${currentPage}#answerend">
		   					<span style="color: red;">(${dto.acount})</span>
		   				</a>
		   			</c:if>
		   		</td>
		   		<td>${dto.writer}</td>
		   		<td>
		   			<fmt:formatDate value="${dto.writeday}" pattern="yyyy.MM.dd."/>
		   		</td>
		   		<td>${dto.readcount}</td>
		   </tr>		
		</c:forEach>
		</tbody>
	</table>
	<div style="text-align: center;">
		<!-- 이전 -->
		<c:if test="${startPage>1}">
			<a href="./list?currentPage=${startPage-1}">이전</a>
		</c:if>
		&nbsp;
		<c:forEach var="pno" begin="${startPage}" end="${endPage}">
		  	<a href="./list?currentPage=${pno}" style="cursor: pointer;">
				<c:if test="${pno==currentPage}">
					<span style="color: red;">${pno}</span>
				</c:if>
				<c:if test="${pno!=currentPage}">
					<span style="color: black;">${pno}</span>
				</c:if>				
			</a>
			&nbsp;
		</c:forEach>
		<!-- 다음 -->
		<c:if test="${endPage<totalPage}">
			<a href="./list?currentPage=${endPage+1}">다음</a>
		</c:if>
	</div>
</div>
</body>
</html>