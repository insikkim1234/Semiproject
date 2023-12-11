<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<h1>
	<img src="https://kr.object.ncloudstorage.com/semi-project-eatingalone/photo/logo.jpg" style="height:50px; margin-right:1px;">
	나 혼자 먹는다
</h1>

<div class="btn-bar">
	<form action="/semi/board">
	  <button type="submit" class="btn btn-primary">게시판 목록</button>
	</form>
	<form action="/semi/recipe/sample">
	  <button type="submit" class="btn btn-success">recipe 샘플</button>
	</form>
	<form action="/semi/recipe/board">
	  <button type="submit" class="btn btn-info">레시피 보드</button>
	</form>
	<form action="/semi/mboard">
	  <button type="submit" class="btn btn-warning">중고마켓</button>
	</form>
	<form action="/semi/member/register">
	  <button type="submit" class="btn btn-danger">회원가입</button>
	</form>
	<form action="/semi/member/login">
	  <button type="submit" class="btn btn-info">로그인</button>
	</form>
	 <form action="/semi/member/semi/">
	  <button type="submit" class="btn btn-info">회원목록조회</button>
	</form>

</div>