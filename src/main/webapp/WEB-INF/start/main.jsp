<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
  <tiles:insertAttribute name="" />
</head>
<c:set var="root" value="<%=request.getContextPath()%>"/>
<body>

<h1>
<img src="../../../resources/photo/대표사진.png" style=height:50px; margin-right:10px;">
나 혼자 먹는다
</h1>

<div class="btn-bar">
  <button class="btn btn-primary">첫화면</button>  
  <button class="btn btn-success">메뉴</button>
  <button class="btn btn-warning">예약</button>
  <button class="btn btn-danger">리뷰</button>
  <button class="btn btn-info">고객센터</button>  
  <a href="/semi/board">게시판 목록</a>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <a href="/semi/recipe/sample">recipe 샘플</a>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <a href="/semi/mboard">중고마켓 목록</a>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <a href="${root}/member/save">회원가입</a>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <a href="/member/login">로그인</a>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <a href="/member/semi/">회원목록조회</a>

</div>

</body>

</html>