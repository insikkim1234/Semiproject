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
	<form action="./insertRecipeApi" method="post" enctype="multipart/form-data">
		<table class="table table-bordered" style="width: 500px;">
			<tr>
				<th width="100">제목</th>
				<td><input type="text" name="sRecipeTitle" class="form-control"
					required autofocus value="${sRecipeTitle}"></td>
			</tr>
			<tr>
				<th width="100">닉네임</th>
				<td><input type="text" name="sRecipeName" class="form-control"
					required autofocus value="${sRecipeName}"></td>
			</tr>
			<tr>
				<th width="100">사진</th>
				<td><input type="file" name="upload" multiple
					class="form-control"></td>
			</tr>
			<tr>
				<th width="100">설명</th>
				<td><input type="text" name="sRecipeContent"
					class="form-control" required autofocus value="${sRecipeContent}">
				</td>
			</tr>
			<tr>
				<th width="100">조리시간</th>
				<td><input type="text" name="sRecipeTime" class="form-control"
					required autofocus value="${sRecipeTime}"></td>
			</tr>
			<tr>
				<th width="100">난이도</th>
				<td><input type="text" name="sRecipeDifficulty"
					class="form-control" required autofocus
					value="${sRecipeDifficulty}"></td>
			</tr>
			<tr>
				<th width="100">인분</th>
				<td><input type="text" name="sRecipeServing"
					class="form-control" required autofocus value="${sRecipeServing}">
				</td>
			</tr>
			<tr>
				<th width="100">재료</th>
				<td><input type="text" name="sRecipeIngredient"
					class="form-control" required autofocus
					value="${sRecipeIngredient}"></td>
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