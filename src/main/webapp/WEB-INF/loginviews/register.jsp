<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="UTF-8"%>
<html>
<head>
    <title>register</title>
    <style>
        .file-input-wrapper {
            width: 300px;
            border: 1px solid gray;
            padding: 10px;
            border-radius: 10px;
        }

        .file-input-wrapper input[type=file] {
            width: 100%;
            box-sizing: border-box; 
        }
        input {
            width: 300px;
            padding: 10px;
            border-radius: 10px;
        }
    </style>
</head>
<body>
<form action="/semi/member/register" method="post">
    <input type="text" name="userName" placeholder="성명 입력"><br><br>
    <input type="email" name="userEmail" placeholder="이메일"><br><br>
    <input type="password" name="userPassword" placeholder="비밀번호"><br><br>

    <div class="file-input-wrapper">
        <input type="file" name="userImage" placeholder="사진">
    </div><br>

    <input type="text" name="userPhoneNumber"  placeholder="휴대전화번호(Ex:010-1234-5678)"><br><br>
    <input type="submit" value="회원가입">
</form>
</body>
</html>