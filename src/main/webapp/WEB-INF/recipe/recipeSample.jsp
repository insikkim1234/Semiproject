<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>recipe sample</title>
<link
	href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Jua&family=Lobster&family=Nanum+Pen+Script&family=Permanent+Marker&family=Single+Day&display=swap"
	rel="stylesheet">
<style>
body * {
	font-family: 'Jua';
}
</style>
</head>
<body>
	<h1>recipe sample</h1>
	<form action="./insertRecipe" method="post" enctype="multipart/form-data">
		<table class="table table-bordered" style="width: 500px;">
			<tr>
				<th width="100">제목</th>
				<td><input type="text" name="recipeTitle" class="form-control"
					required autofocus value="${recipeTitle}"></td>
			</tr>
			<tr>
				<th width="100">닉네임</th>
				<td><input type="text" name="recipeName" class="form-control"
					required autofocus value="${recipeName}"></td>
			</tr>
			<tr>
				<th width="100">사진</th>
				<td><input type="file" name="upload" multiple
					class="form-control"></td>
			</tr>
			<tr>
				<th width="100">설명</th>
				<td><input type="text" name="recipeContent"
					class="form-control" required autofocus value="${recipeContent}">
				</td>
			</tr>
			<tr>
				<th width="100">조리시간</th>
				<td><input type="text" name="recipeTime" class="form-control"
					required autofocus value="${recipeTime}"></td>
			</tr>
			<tr>
				<th width="100">난이도</th>
				<td><input type="text" name="recipeDifficulty"
					class="form-control" required autofocus
					value="${recipeDifficulty}"></td>
			</tr>
			<tr>
				<th width="100">인분</th>
				<td><input type="text" name="recipeServing"
					class="form-control" required autofocus value="${recipeServing}">
				</td>
			</tr>
			<tr>
				<th width="100">재료</th>
				<td><input type="text" name="recipeIngredient"
					class="form-control" required autofocus
					value="${recipeIngredient}"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit" class="btn btn-outline-success">저장</button>
					<button type="button" class="btn btn-outline-success"
						onclick="history.back()">이전</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>