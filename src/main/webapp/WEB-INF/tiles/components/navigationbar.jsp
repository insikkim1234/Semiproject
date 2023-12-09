<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<h1>
    <img src="../../../resources/photo/대표사진.png" style="height:50px; margin-right:10px;">
    나 혼자 먹는다
</h1>

<div class="btn-bar">
    <form action="/semi/board">
  <button type="submit" class="btn btn-primary">게시판 목록</button>
</form>
<form action="/semi/recipe/sample">
  <button type="submit" class="btn btn-success">recipe 샘플</button>
</form>
<form action="/semi/mboard">
  <button type="submit" class="btn btn-warning">중고마켓</button>
</form>
<form action="${root}/member/save">
  <button type="submit" class="btn btn-danger">회원가입</button>
</form>
<form action="/member/login">
  <button type="submit" class="btn btn-info">로그인</button>
</form>
 <form action="/member/semi/">
  <button type="submit" class="btn btn-info">회원목록조회</button>
</form>

</div>
