<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>나 혼자 먹는다</title>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<style>
  h1 {
    font-family: "핑프 째즈체"; 
    text-align: center;
  }
  
  .btn-bar {
    display: flex;
    justify-content: center; 
  }
  
  .btn-bar button {
    margin: 0 10px;
  }
</style>

</head>

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
  <a href="/semi/recipe/sample">레시피 샘플</a>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <a href="/semi/mboard">중고마켓 목록</a>
</div>

</body>

</html>