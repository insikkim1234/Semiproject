<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


	<div class="mw_1000">
		<div class="fs_40 fw_600 cGreen text_left mt-5">이거 어때?</div>
		<form class="d-flex m-0 justify-content-end mt-3">
			<input class="form-control me-2" type="text" placeholder="검색어 입력" style="width: 200px; border:2px solid #11B560;">
			<button class="btn btn_green2 fw_600" type="button">검색</button>
		</form>
		<div class="fs_17 bg_green row mt-3 mw_1000">
			<div class="col py-3 fw_600">${totalCount}건의 거래 진행중..</div>
			<div class="col text-end">
				<button type="button" class="btn btn_green fw_600 mt-2"
					onclick="location.href='./mboard/form'">나의 물품등록</button>
			</div>
		</div>
		<div>
		
		


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
				<c:forEach var="dto" items="${mdata}" >
					<tr class="text-center">
						
						<td>
							${no}
							<c:set var="no" value="${no-1}"/>
						</td>
						<td>
						<a id="marketcontent" href="./mboard/content?boardSeq=${dto.boardSeq}&currentPage=${currentPage}">
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

		
		<div style="text-align: center;">
			<!-- 이전 -->
			<c:if test="${startPage>1}">
				<a href="./mboard?currentPage=${startPage-1}">이전</a>
			</c:if>
			&nbsp;
			<c:forEach var="pno" begin="${startPage}" end="${endPage}">
				<a href="./mboard?currentPage=${pno}" style="cursor: pointer;"> <c:if
						test="${pno==currentPage}">
						<span style="color: black;">${pno}</span>
					</c:if> <c:if test="${pno!=currentPage}">
						<span style="color: #11b560;">${pno}</span>
					</c:if>
				</a>
			&nbsp;
		</c:forEach>
			<!-- 다음 -->
			<c:if test="${endPage<totalPage}">
				<a href="./mboard?currentPage=${endPage+1}">다음</a>
			</c:if>
		</div>
	</div>
	</div>


