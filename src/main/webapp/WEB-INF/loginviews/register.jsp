<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="UTF-8"%>
<html>
<head>
    <title>register</title>
</head>
<body>
    <form action="/member/register" method="post">
        <input type="text" name="sUserName" placeholder="이름">
        <input type="text" name="sUserEmail" placeholder="이메일">
        <input type="text" name="sUserPassword" placeholder="비밀번호">
        <input type="text" name="sUserImage" placeholder="사진">
        <input type="text" name="sUserPhoneNumber" placeholder="전화번호">
        <input type="submit" value="회원가입">
    </form>
</body>
</html>
