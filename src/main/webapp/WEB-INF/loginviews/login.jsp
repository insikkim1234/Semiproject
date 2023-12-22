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
     	border-bottom: 2px solid #c12c2f;
      	outline: none;
      	background-color: transparent;
        font-family: cursive;
    }
    .btnlogin {
        width: 100px;
        display: table;
        margin-left: auto;
        margin-right: auto;
    }
    .message {
        text-align: center;
    }
</style>
<body>
<div class="fw_500 cBlack mt-5 mx-auto" style="width: 300px">
	<a href="${pageContext.request.contextPath}">HOME</a><span class="fs_18 mx-1">></span>
	<a href="${pageContext.request.contextPath}/member/login">로그인</a>
</div>
<!-- <div class="cGreen fs_40 mt-3 text-center fw_600">SIGN IN</div> --><!--이거 새로만듬 -->
<div class="text-center mt-4">
	<span class="title_login ">
		<span>S</span>
		<span>I</span>
		<span>G</span>
		<span>N</span>
		<span>&nbsp;</span>
		<span>I</span>
		<span>N</span>
	</span>
</div>
<div class="tablef mt-5"> <!--mt-3클래스추가  -->
<form action="/semi/member/login" class="signin" method="post">
    <input type="email" name="userEmail" placeholder="Email Address"><br><br>
    <input type="password" name="userPassword" placeholder="Password"><br><br>
    <div class="message">아직 회원이 아니신가요? <a href="/semi/member/register" style="color: #c12c2f; font-weight: 700;">참 쉬운 회원가입</a></div><br>
    <button type="submit" class="btn-3d red btnlogin fw_500">로그인</button>
</form>
</div>
</body>
</html>