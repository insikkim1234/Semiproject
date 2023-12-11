<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Jua&family=Lobster&family=Nanum+Pen+Script&family=Permanent+Marker&family=Single+Day&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<style>
    body * {
        font-family: 'Jua';
    }
   
	span.day {
   		font-size: 11px;
   		color: gray;
    }  
</style>
</head>
<body>
	<div>
		<b style="font-size: 40px;">${dto.sRecipeTitle}</b>
		<br>
		<div style="align: center; font-size: 25px;">
			<img class="recipe_img" src="https://kr.object.ncloudstorage.com/semi-project-eatingalone/photo/${dto.sRecipePhoto}" >
			<b>${dto.sRecipeName}</b>&nbsp;
			<span class="day" style="font-size: 20px;">
				조회 : ${dto.nRecipeViewCount}
			</span>
		</div>
		<br>
		<pre style="font-size: 17px;">${dto.sRecipeContent}</pre>
	</div>
</body>
</html>
