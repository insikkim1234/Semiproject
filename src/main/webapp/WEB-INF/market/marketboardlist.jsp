<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<div class="mw_1000">
	<div class="fw_500 cBlack mt-5">
		<a href="${pageContext.request.contextPath}">HOME</a><span class="fs_18 mx-1">></span>
		<a href="${pageContext.request.contextPath}/mboard">벼룩시장</a>
	</div>
	<div class="fs_40 fw_600 cGreen text_left mt-3 mboard_effect">
		<span>이</span><span>거</span><span>&nbsp;</span><span>어</span><span>때</span><span>?</span>
	</div>
	<form action="./mboard" class="d-flex m-0 justify-content-end mt-3">
		<input class="form-control me-2" type="text" name="searchWord" placeholder="검색어 입력" style="width: 200px; border:2px solid #c63702;">
		<button class="btn-3d red fw_600 ml-2" type="submit">검색</button>
	</form>
	<div class="fs_18 bg_green row mt-3 mw_1000 br_10">
		<c:if test="${isSearch}">
			<%-- <div class="col py-3 fw_600">총 ${totalCount}개의 거래 검색됨</div> --%>
			<div class="animation py-3 col">
			    <span class="one_text">총 <span style="color: #000; font-size: 18px;">${totalCount}</span>개의 </span>
			    <span class="two_text">거래 검색됨</span>
			</div>
		</c:if>
		<c:if test="${!isSearch}">
			<%-- <div class="col py-3 fw_600">${totalCount}건의 거래 진행중..</div> --%>
			<div class="animation py-3 col">
			    <span class="one_text">총 <span style="color: #000; font-size: 18px;">${totalCount}</span>개의 </span>
			    <span class="two_text">거래 진행중</span>
			</div>
		</c:if>
		<div class="col text-end">
			<button type="button" class="btn custom-btn btn-12 fw_600"
				onclick="location.href='./mboard/form'"><span>Click!</span><span>나의 물품등록</span></button>
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
			<tbody class="mboardlist_body">
			<c:forEach var="dto" items="${mdata}" >
				<tr class="text-center">
					<td>
						${dto.boardSeq}
					</td>
					<td>
					<a id="marketcontent" href="./mboard/content?boardSeq=${dto.boardSeq}&currentPage=${pageDto.curPage}" class="cBlack">
					${dto.boardTitle}
					</a>
					</td>
					<td>${dto.userNickName}</td>
					<td><fmt:formatDate value="${dto.createDate}" pattern="yyyy-MM-dd"/></td>
					<td>${dto.boardViewCount}</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
	
	<div class="container-fluid  mx-auto">
	<div class="text-center fw_500 fs_18 row justify-content-center">
		<div class="col-2">
		<c:choose>
			<c:when test="${pageDto.curPage > 1}">
				<a href="${pageContext.request.contextPath}/mboard?currentPage=1" class="btn-3d red mx-1 fs_18">처음</a>
				<a href="${pageContext.request.contextPath}/mboard?currentPage=${pageDto.curPage - 1}" class="btn-3d red fs_18">이전</a>
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
							<span class="cBlack mx-1 fs_22"><a href="${pageContext.request.contextPath}/mboard?currentPage=${pageNumber}">${pageNumber}</a></span>
						</c:otherwise>
					</c:choose>
				</c:when>
			</c:choose>
		</c:forEach>
		</div>

		<div class="col-2">
		<c:choose>
			<c:when test="${pageDto.curPage < pageDto.totalPage}">
				<span><a href="${pageContext.request.contextPath}/mboard?currentPage=${pageDto.curPage + 1}" class="btn-3d red mx-1 fs_18">다음</a></span>
				<span><a href="${pageContext.request.contextPath}/mboard?currentPage=${pageDto.totalPage}"class="btn-3d red fs_18">마지막</a ></span>
			</c:when>
		</c:choose>
		</div>
	</div>
	</div>
</div>


