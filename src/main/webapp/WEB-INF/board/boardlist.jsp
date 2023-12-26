<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="mw_1000">
	<div class="fw_500 cBlack mt-5">
		<a href="${pageContext.request.contextPath}">HOME</a><span class="fs_18 mx-1">></span>
		<a href="${pageContext.request.contextPath}/board/list">자취생 커뮤니티</a>
	</div>
	<!-- <div class="fs_40 fw_600 cGreen text_left mt-3">자취러 커뮤니티</div> -->
	
	<div class="fs_40 fw_600 cGreen text_left mt-3 board_title">
	  <span>자</span>
	  <span>취</span>
	  <span>러</span>
	  <span></span>
	  <span>커</span>
	  <span>뮤</span>
	  <span>니</span>
	  <span>티</span>
	</div>
	
	<form action="./list" class="d-flex m-0 justify-content-end mt-3">
		<input type="hidden" name = "pageNum" value="${pageDto.curPage}"/>
		<input class="form-control me-2" type="text" placeholder="검색어 입력" name="searchWord" style="width: 200px; border:2px solid #c63702;">
		<button class="btn-3d red fw_600 ml-2" type="submit">검색</button>
	</form>
	<div class="fs_18 bg_green row mt-3 mw_1000 br_10">
		<c:if test="${isSearch}">
			<%-- <div class="col py-3 fw_700">총 ${pageDto.totalCnt}개의 잡담 검색됨</div> --%>
			<div class="animation py-3 col">
			    <span class="one_text">총 <span style="color: #000; font-size: 18px;">${pageDto.totalCnt}</span>개의 </span>
			    <span class="two_text">잡담 검색됨...</span>
			</div>
		</c:if>
		<c:if test="${!isSearch}">
			<%-- <div class="col py-3 fw_700">총 ${pageDto.totalCnt}개의 잡담 형성중..</div> --%>
			<div class="animation py-3 col">
			    <span class="one_text">총 <span style="color: #000; font-size: 18px;">${pageDto.totalCnt}</span>개의 </span>
			    <span class="two_text">잡담 형성중...</span>
			</div>
		</c:if>
		<div class="col text-end">
			<button type="button" class="btn custom-btn btn-12 fw_600"
				onclick="location.href='./form'">
				<span>Click!</span><span>잡담하기</span>
			</button>
		</div>
	</div>

	<div class="blist">
		<table class="table">
			<thead>
				<tr class="text-center">
					<th width="50">번호</th>
					<th width="200">제목</th>
					<th width="80">작성자</th>
					<th width="100">작성일</th>
					<th width="50">조회</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="dto" items="${data}" varStatus="n">
					<tr class="text-center">
						<td>${dto.comBoardSeq}</td>
						<td>
							<a href="./content?comBoardSeq=${dto.comBoardSeq}" style="color: black;text-decoration: none;">
							${dto.comBoardSubject}
							</a>
						</td>
						<td>${dto.userNickName}</td>
						<td><fmt:formatDate value="${dto.writeDay}" pattern="yyyy-MM-dd"/></td>
						<td>${dto.comBoardviewCount}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>

<div class="container-fluid  mx-auto">
<div class="text-center fw_500 fs_18 row justify-content-center">
	<div class="col-2">
	<c:choose>
		<c:when test="${pageDto.curPage > 1}">
			<a href="${pageContext.request.contextPath}/board/list?pageNum=1" class="btn-3d red mx-1 fs_18">처음</a>
			<a href="${pageContext.request.contextPath}/board/list?pageNum=${pageDto.curPage - 1}" class="btn-3d red fs_18">이전</a>
		</c:when>
	</c:choose>
	</div>
	<div class="col-2">
	<c:forEach begin="${pageDto.startPage}" end="${pageDto.endPage}" var="pageNumber">
		<c:choose>
			<c:when test="${pageNumber >= 1 and pageNumber <= pageDto.totalPage}">
				<c:choose>
					<c:when test="${pageNumber == pageDto.curPage}">
						<span class="cGreen mx-1 fs_22">${pageNumber}</span>
					</c:when>
					<c:otherwise>
						<span class="cBlack mx-1 fs_22"><a href="${pageContext.request.contextPath}/board/list?pageNum=${pageNumber}">${pageNumber}</a></span>
					</c:otherwise>
				</c:choose>
			</c:when>
		</c:choose>
	</c:forEach>
	</div>
	<div class="col-2">
	<c:choose>
		<c:when test="${pageDto.curPage < pageDto.totalPage}">
			<span><a href="${pageContext.request.contextPath}/board/list?pageNum=${pageDto.curPage + 1}" class="btn-3d red mx-1 fs_18">다음</a></span>
			<span><a href="${pageContext.request.contextPath}/board/list?pageNum=${pageDto.totalPage}" class="btn-3d red fs_18">마지막</a ></span>
		</c:when>
	</c:choose>
	</div>
</div>
</div>
