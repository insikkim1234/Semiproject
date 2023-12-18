<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="naver.storage.NcpObjectStorageService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div style="box-shadow: 0 5px 30px -10px #4950578f">
<div class="mw_1500">
	<nav class="navbar navbar-expand-sm d-flex flex-column">
	  <div class="container-fluid">
	    <a href="${pageContext.request.contextPath}"> <img
			src="<%=NcpObjectStorageService.STORAGE_PHOTO_PATH%>eating_alone_mainlogo6.png"
			class="img-fluid ml-1" style="width: 350px;">
		</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mynavbar">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="collapse navbar-collapse mt-auto" id="mynavbar">
	      <ul class="navbar-nav ml-auto align-center expanded text-center menubtn_effect">
	        <li class="nav-item mx-5">
	          <a class="nav-link fs_19 fw_600" href="${pageContext.request.contextPath}/board/list">
	          <span>자취생 다 모여</span>
	          <span><i class="bi bi-chat-text-fill mr-2"></i>커뮤니티</span>
	          </a>
	        </li>
	        <li class="nav-item mx-5">
	          <a class="nav-link fs_19 fw_600" href="${pageContext.request.contextPath}/recipe/board">
	            <span>오늘 뭐 먹지?</span>
	          	<span><i class="bi bi-book-fill mr-2"></i>레시피북</span>
	          </a>
	        </li>
	        <li class="nav-item ml-5">
	          <a class="nav-link fs_19 fw_600" href="${pageContext.request.contextPath}/mboard">
				<span>돈 아끼는 팁</span>
	          	<span><i class="bi bi-person-hearts mr-2"></i>벼룩시장</span>
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
			<button type="submit" class="btn mx-2 p-0 login_rborder">
				<div>로그인</div>
			</button>
			</a>
			<a href="${pageContext.request.contextPath}/member/register">
				<button type="submit" class="btn  mx-2 p-0">
					<div>회원가입</div>
				</button>
			</a>
		</c:if>
		
		<%--<c:if test="${sessionScope.loginOk!=null}">
			<img src="${}/resources/upload/${sessionScope.myphoto}" class="profile_photo"
				 width="70" height="70" hspace="10" border="1"
				 onerror=""><br>
			<i class="bi bi-gear photochange"
			   style="font-size: 2em;cursor: pointer;"></i>
			<input type="file" id="profile_upload" style="display: none;">
			<div class="input-group">
				<h5>${sessionScope.myname}님</h5>&nbsp;&nbsp;
				<button type="button" class="btn btn-success btn-sm"
						style="width: 100px;" id="btnlogout">로그아웃</button>
			</div>
		</c:if>--%>
	
			<c:if test="${sessionScope.login_member_dto!=null}">
				<h5>${sessionScope.login_member_dto.userEmail}님</h5>&nbsp;&nbsp;
			</c:if>
		</div>
	</nav>
</div>
</div>

	