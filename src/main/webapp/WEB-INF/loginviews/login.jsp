<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="UTF-8"%>
<html>
<head>
    <title>login</title>
</head>
<body>
<form action="/member/login" method="post">
    <input type="text" name="sUserEmail" placeholder="이메일">
    <input type="text" name="sUserPassword" placeholder="비밀번호">
    <button type="submit">로그인</button>
</form>
</body>
</html>