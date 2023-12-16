<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="naver.storage.NcpObjectStorageService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%-- <div>
	<div class="text-left">
		<a href=""> <img
			src="<%=NcpObjectStorageService.STORAGE_PHOTO_PATH%>eating_alone_mainlogo5.png"
			class="img-fluid" style="width: 300px; padding: 10px 0;">
		</a>
	</div>
</div>
<hr> --%>
<nav class="navbar navbar-expand-sm d-flex flex-column">
	  <div class="container-fluid">
	    <a href="${pageContext.request.contextPath}"> <img
			src="<%=NcpObjectStorageService.STORAGE_PHOTO_PATH%>eating_alone_mainlogo5.png"
			class="img-fluid" style="width: 300px; padding: 10px 0;">
		</a>
	    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mynavbar">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="collapse navbar-collapse mt-auto" id="mynavbar">
	      <ul class="navbar-nav ml-auto">
	        <li class="nav-item mx-5">
	          <a class="nav-link fs_20 fw_600" href="${pageContext.request.contextPath}/board/list">커뮤니티</a>
	        </li>
	        <li class="nav-item mx-5">
	          <a class="nav-link fs_20 fw_600" href="${pageContext.request.contextPath}/recipe/board">레시피북</a>
	        </li>
	        <li class="nav-item mx-5">
	          <a class="nav-link fs_20 fw_600" href="${pageContext.request.contextPath}/mboard">벼룩시장</a>
	        </li>
	      </ul>
	      <form class="d-flex m-0 justify-content-end">
		      <input class="form-control me-2" type="text" style="border: 0;" placeholder="Search">
		      <button class="btn btn_green2 fw_600" type="button">검색</button>
		  </form>
	    </div>
	  </div>
	</nav>

<div class="btn-bar member_btns">
	<c:if test="${sessionScope.login_member_dto==null}">
		<a href="/semi/member/login">
		<button type="submit" class="btn mx-2 px-0 login_rborder">
			<div>로그인</div>
		</button>
	</a>
	<a href="/semi/member/register">
		<button type="submit" class="btn  mx-2 px-0">
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


<nav class="navbar navbar-expand-sm mb-3 p-0">
<div class="container-fluid">
<a class="navbar-brand" href="javascript:void(0)"> <img
    src="<%=NcpObjectStorageService.STORAGE_PHOTO_PATH%>eatingalone_logo2.png"
    class="img-fluid" style="width: 50px;">
</a>
<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
    data-bs-target="#mynavbar">
    <span class="navbar-toggler-icon"></span>
</button>
<div class="collapse navbar-collapse" id="mynavbar">
    <div class="navbar-nav mx-auto">
        <div class="nav-item align-items-center d-flex mx-5">
            <form action="${pageContext.request.contextPath}/board/list" style="margin: 0;">
                <button type="submit" class="btn headmenu_btn">게시판 목록</button>
            </form>
        </div>
        <div class="nav-item align-items-center d-flex mx-5">
            <form action="/semi/recipe/sample" style="margin: 0;">
                <button type="submit" class="btn headmenu_btn">recipe 샘플</button>
            </form>
        </div>
        <div class="nav-item align-items-center d-flex mx-5">
            <form action="${pageContext.request.contextPath}/recipe/board" style="margin: 0;">
                <button type="submit" class="btn headmenu_btn">레시피 보드</button>
            </form>
        </div>
        <div class="nav-item align-items-center d-flex mx-5">
            <form action="${pageContext.request.contextPath}/mboard" style="margin: 0;">
                <button type="submit" class="btn headmenu_btn">중고마켓</button>
            </form>
        </div>
    </div>

    <form class="d-flex m-0 justify-content-end">
        <input class="form-control me-2" type="text" style="border: 0;" placeholder="Search">
        <button class="btn btn_green fw_600" type="button">검색</button>
    </form>
</div>
</div>
</nav>

