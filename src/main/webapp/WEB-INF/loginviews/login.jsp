<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="UTF-8"%>
<html>
<head>
    <title>login</title>
</head>
<style>
    div.tablef input { /*요거 속성 변경했으니 참고요  */
        width: 300px;
        /* border-radius: 10px; */
        padding: 10px;
        display: table;
        margin-left: auto;
        margin-right: auto;
        border: none;
     	border-bottom: 2px solid #11B560;
      	outline: none;
      	background-color: transparent;
    }
    .btnlogin {
        width: 150px;
        border-radius: 10px;
        padding: 10px;
        display: table;
        margin-left: auto;
        margin-right: auto;
        border: 2px solid #0e942c; /*보더 색변경  */
    }
    
    .btnlogin:hover { /*이 속성 추가  */
    	border: 2px solid #e1a900;
    }
</style>
<body>
<div class="cGreen fs_40 mt-5 text-center fw_600">SIGN IN</div><!--이거 새로만듬 -->
<div class="tablef mt-3"> <!--mt-3클래스추가  -->
<form action="/semi/member/login" class="signin" method="post">
    <input type="text" name="userEmail" placeholder="Email Address"><br><br>
    <input type="password" name="userPassword" placeholder="Password"><br><br>
    <button type="submit" class="btnlogin btn_green2 fw_500 ">로그인</button>
</form>
</div>
</body>
</html>