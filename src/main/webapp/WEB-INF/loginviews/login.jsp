<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="UTF-8"%>
<html>
<head>
    <title>login</title>
</head>
<body>
<form action="/semi/member/login" method="post">
    <input type="text" name="userEmail" placeholder="이메일">
    <input type="password" name="userPassword" placeholder="비밀번호">
    <button type="submit">로그인</button>
</form>
</body>
</html>