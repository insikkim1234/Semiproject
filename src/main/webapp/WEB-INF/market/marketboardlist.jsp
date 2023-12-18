<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<div class="mw_1000">
	<div class="fs_40 fw_600 cGreen text_left mt-5">이거 어때?</div>
	<form action="./mboard" class="d-flex m-0 justify-content-end mt-3">
		<input class="form-control me-2" type="text" name="searchWord" placeholder="검색어 입력" style="width: 200px; border:2px solid #11B560;">
		<button class="btn btn_green2 fw_600" type="submit">검색</button>
	</form>
	<div class="fs_17 bg_green row mt-3 mw_1000">
		<c:if test="${isSearch}">
			<div class="col py-3 fw_600">총 ${totalCount}개의 거래 검색됨</div>
		</c:if>
		<c:if test="${!isSearch}">
			<div class="col py-3 fw_600">${totalCount}건의 거래 진행중..</div>
		</c:if>
		<div class="col text-end">
			<button type="button" class="btn btn_green fw_600 mt-2"
				onclick="location.href='./mboard/form'">나의 물품등록</button>
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
					<td></td>
					<td>${dto.createDate}</td>
					<td>${dto.boardViewCount}</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
	
	<div class="text-center fw_500 fs_18">
		<c:choose>
			<c:when test="${pageDto.curPage > 1}">
				<a href="${pageContext.request.contextPath}/mboard?currentPage=1" class="btn_green3 mx-1 fs_18">처음</a>
				<a href="${pageContext.request.contextPath}/mboard?currentPage=${pageDto.curPage - 1}" class="btn_green3 fs_18">이전</a>
			</c:when>
		</c:choose>

		<c:forEach begin="${pageDto.startPage}" end="${pageDto.endPage}" var="pageNumber">
			<c:choose>
				<c:when test="${pageNumber >= 1 and pageNumber <= pageDto.totalPage}">
					<c:choose>
						<c:when test="${pageNumber == pageDto.curPage}">
							<span class="cBlack mx-1 fs_22">${pageNumber}</span>
						</c:when>
						<c:otherwise>
							<span class="cGreen mx-1 fs_22"><a href="${pageContext.request.contextPath}/mboard?currentPage=${pageNumber}">${pageNumber}</a></span>
						</c:otherwise>
					</c:choose>
				</c:when>
			</c:choose>
		</c:forEach>

		<c:choose>
			<c:when test="${pageDto.curPage < pageDto.totalPage}">
				<span><a href="${pageContext.request.contextPath}/mboard?currentPage=${pageDto.curPage + 1}" class="btn_green3 mx-1 fs_18">다음</a></span>
				<span><a href="${pageContext.request.contextPath}/mboard?currentPage=${pageDto.totalPage}"class="btn_green3 fs_18">마지막</a ></span>
			</c:when>
		</c:choose>
	</div>
</div>


