<%@ page import="naver.storage.NcpObjectStorageService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="text-center" style="background-color: #eeefc7b8;">
	<a href=""> <img
		src="<%=NcpObjectStorageService.STORAGE_PHOTO_PATH%>eating_alone_mainlogo3.png"
		class="img-fluid" style="width: 400px; padding: 10px 0;">
	</a>
</div>

<div class="btn-bar member_btns">
	<form action="/semi/member/login">
		<button type="submit" class="btn mx-2 px-0">
			<img alt="" src="<%=NcpObjectStorageService.STORAGE_PHOTO_PATH%>member_login_logo.png" class="img-fluid member_logo_btn">
		</button>
	</form>
	<form action="/semi/member/register">
		<button type="submit" class="btn mx-2 px-0">
			<img alt="" src="<%=NcpObjectStorageService.STORAGE_PHOTO_PATH%>member_join_logo.png" class="img-fluid member_logo_btn">
		</button>
	</form>
	<form action="/semi/member/semi/">
		<button type="submit" class="btn mx-2 px-0">
			<img alt="" src="<%=NcpObjectStorageService.STORAGE_PHOTO_PATH%>member_search_logo.png" class="img-fluid member_logo_btn">
		</button>
	</form>
</div>


<nav class="navbar navbar-expand-sm backGreen mb-3 p-0 text-white">
	<div class="container-fluid">
		<a class="navbar-brand" href="javascript:void(0)"> <img
			src="https://kr.object.ncloudstorage.com/semi-project-eatingalone/photo/eatingalone_logo.png"
			class="img-fluid" style="width: 50px;">
		</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#mynavbar">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="mynavbar">
			<div class="navbar-nav mx-auto">
				<div class="nav-item align-items-center d-flex mx-5">
					<form action="/semi/board" style="margin: 0;">
						<button type="submit" class="btn headmenu_btn">게시판 목록</button>
					</form>
				</div>
				<div class="nav-item align-items-center d-flex mx-5">
					<form action="/semi/recipe/sample" style="margin: 0;">
						<button type="submit" class="btn headmenu_btn">recipe 샘플</button>
					</form>
				</div>
				<div class="nav-item align-items-center d-flex mx-5">
					<form action="/semi/recipe/board" style="margin: 0;">
						<button type="submit" class="btn headmenu_btn">레시피 보드</button>
					</form>
				</div>
				<div class="nav-item align-items-center d-flex mx-5">
					<form action="/semi/mboard" style="margin: 0;">
						<button type="submit" class="btn headmenu_btn">중고마켓</button>
					</form>
				</div>
			</div>

			<form class="d-flex m-0 justify-content-end">
				<input class="form-control me-2" type="text" placeholder="Search">
				<button class="btn btn_headersearch fw_600" type="button">검색</button>

			</form>
		
		</div>
	</div>
</nav>


