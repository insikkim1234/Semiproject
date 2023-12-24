<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="naver.storage.NcpObjectStorageService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:set var="root" value="<%=request.getContextPath()%>"/>
<div style="box-shadow: 0 10px 30px -10px #4950578f; border-bottom:3px dashed #c12c2f">
<div class="mw_1200">
	<nav class="navbar navbar-expand-sm d-flex flex-column">
	  <div class="container-fluid">
	    <%-- <a href="${pageContext.request.contextPath}"> <img
			src="<%=NcpObjectStorageService.STORAGE_PHOTO_PATH%>eating_alone_mainlogo7.png"
			class="img-fluid ml-1" style="width: 350px;">
		</a>
		 --%>
		<div class="hover__wrap">
		  <div class="hover__leftright">
		    <figure class="front">
		     <a href="${pageContext.request.contextPath}">	
		      <img src="<%=NcpObjectStorageService.STORAGE_PHOTO_PATH%>eating_alone_mainlogo8.png" alt="" class="img-fluid">
		    </a>
		    </figure>
		    <figure class="back">
		     <a href="${pageContext.request.contextPath}">
		      <img src="<%=NcpObjectStorageService.STORAGE_PHOTO_PATH%>book_logo.png" alt="" class="img-fluid">
		    </a>
		    </figure>
		  </div>
		</div>
		
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mynavbar">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="collapse navbar-collapse mt-auto" id="mynavbar">
	      <ul class="navbar-nav ml-auto align-center expanded text-center menubtn_effect">
	        <li class="nav-item mx-4">
	          <a class="nav-link fs_20 fw_600" href="${pageContext.request.contextPath}/recipe/board">
	            <span>오늘 뭐 먹지?</span>
	          	<span style="text-shadow:1px 1px hsl(50, 75%, 45%), 2px 2px hsl(50, 45%, 45%), 3px 3px hsl(50, 45%, 45%), 4px 4px hsl(50, 75%, 45%);"><i class="bi bi-book-fill mr-2"></i>레시피북</span>
	          </a>
	        </li>
	        <li class="nav-item mx-4">
	          <a class="nav-link fs_20 fw_600" href="${pageContext.request.contextPath}/board/list">
	          <span>자취생 다 모여</span>
	          <span style="text-shadow:1px 1px hsl(50, 75%, 45%), 2px 2px hsl(50, 45%, 45%), 3px 3px hsl(50, 45%, 45%), 4px 4px hsl(50, 75%, 45%);"><i class="bi bi-chat-text-fill mr-2"></i>커뮤니티</span>
	          </a>
	        </li>
	        <li class="nav-item ml-4">
	          <a class="nav-link fs_20 fw_600" href="${pageContext.request.contextPath}/mboard">
				<span>돈 아끼는 팁</span>
	          	<span style="text-shadow:1px 1px hsl(50, 75%, 45%), 2px 2px hsl(50, 45%, 45%), 3px 3px hsl(50, 45%, 45%), 4px 4px hsl(50, 75%, 45%);"><i class="bi bi-person-hearts mr-2"></i>벼룩시장</span>
			  </a>
	        </li>
	      </ul>
	      <!-- <form class="d-flex m-0 justify-content-end">
		      <input class="form-control me-2" type="text" style="border: 0;" placeholder="Search">
		      <button class="btn btn_green2 fw_600" type="button">검색</button>
		  </form> -->
	    </div>
	  </div>
	  
	  <div class="btn-bar member_btns">
		<c:if test="${sessionScope.login_member_dto==null}">
			<a href="${pageContext.request.contextPath}/member/login">
			<button type="submit" class="btn-3d red2 mx-2 mt-2 p-0 login_rborder">
				<div>로그인</div>
			</button>
			</a>
			<a href="${pageContext.request.contextPath}/member/register">
				<button type="submit" class="btn-3d red2 mt-2 mx-2 p-0">
					<div>회원가입</div>
				</button>
			</a>
		</c:if>
		<%--	로그인중 세션	  --%>
		  <c:if test="${sessionScope.login_member_dto != null}">
			  <c:choose>
				  <c:when test="${empty sessionScope.login_member_dto.userImage}">
					  <!-- 기본 이미지 -->
					  <img src="${root}/resources/photo/tomato.png" alt="기본 프로필 사진" class="pro_img img-fluid">
				  </c:when>
				  <c:otherwise>
					  <!-- 세션에 저장된 사용자 프로필 이미지 -->
					  <img src="<%=NcpObjectStorageService.STORAGE_PROFILE_PHOTO_PATH%>${sessionScope.login_member_dto.userSeq}" class="pro_img img-fluid">
				  </c:otherwise>
			  </c:choose>
			  <div class="fs_18 fw_500 my-auto" style="color: black">${sessionScope.login_member_dto.userNickName}님</div>&nbsp;&nbsp;
			  <a href="${pageContext.request.contextPath}/member/logout" class="my-auto">
				  <button type="submit" class="btn mx-2 p-0">
					  <div class="btn-3d red2">로그아웃</div>
				  </button>
			  </a>
		  </c:if>
		</div>
	</nav>
</div>
</div>

	