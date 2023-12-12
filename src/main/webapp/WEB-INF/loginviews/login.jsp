<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="UTF-8"%>
<html>
<head>
    <title>login</title>
</head>
<style>
    div.tablef input {
        width: 300px;
        border-radius: 10px;
        padding: 10px;
    }
    .btnlogin {
        width: 300px;
        border-radius: 10px;
        padding: 10px;
    }
</style>
<body>
<div class="tablef">
<form action="/semi/member/login" class="signin" method="post">
    <input type="text" name="userEmail" placeholder="이메일"><br><br>
    <input type="password" name="userPassword" placeholder="비밀번호"><br><br>
    <button type="submit" class="btnlogin">로그인</button>
</form>
</div>
</body>
</html>