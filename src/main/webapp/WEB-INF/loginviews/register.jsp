<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="UTF-8"%>
<html>
<head>
    <title>register</title>
</head>
<body>
    <form action="/semi/member/register" method="post">
        <input type="text" name="userName" placeholder="성명 입력">
        <input type="email" name="userEmail" placeholder="이메일">
        <input type="password" name="userPassword" placeholder="비밀번호">
        <input type="file" name="userImage" placeholder="사진">
        <input type="text" name="userPhoneNumber" placeholder="-없이 숫자만 입력">
        <input type="submit" value="회원가입">
    </form>
</body>
</html>
