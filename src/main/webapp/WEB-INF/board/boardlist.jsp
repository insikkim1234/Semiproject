<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div>
	<div class="mlist_head fs_20">
		총 ${totalCount}개의 글이 있습니다
		
		
			<button type="button" class="btn btn-sm btn_product"
			onclick="location.href='./form'" style="margin-left:300px;">글쓰기</button>
	</div>
	
	<table class="table table-striped" style="margin-top: 30px;width:600px;">
		<thead>
			<tr>
				<th width="50">번호</th>
				<th width="300">제목</th>
				<th width="80">작성자</th>
				<th width="100">작성일</th>
				<th width="50">조회</th>				
			</tr>
		</thead>
		<tbody>
		<c:forEach var="dto" items="${data}" varStatus="n">
			<tr>
				<td>${dto.comBoardSeq}</td>
				<td>${dto.comBoardSubject}</td>
				<td>${dto.userName}</td>
				<td>${dto.writeDay}</td>
				<td>${dto.comBoardviewCount}</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</div>