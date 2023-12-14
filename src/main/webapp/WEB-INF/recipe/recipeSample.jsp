<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>recipe sample</title>
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
					required autofocus value="${recipeTime}" placeholder="예 : 10분"></td>
			</tr>
			<tr>
				<th width="100">난이도</th>
				<td>
					<select class="form-select" name="recipeDifficulty">
						<option hidden disabled selected>난이도 선택</option>
						<option value="쉬움">쉬움</option>
						<option value="보통">보통</option>
						<option value="어려움">어려움</option>
					</select>
				</td>
			</tr>
			<tr>
				<th width="100">인분</th>
				<td><input type="text" name="recipeServing"
					class="form-control" required autofocus value="${recipeServing}" placeholder="예 : 1인분">
				</td>
			</tr>
			<tr>
				<th width="100">재료</th>
				<td><input type="text" name="recipeIngredient"
					class="form-control" required autofocus
					value="${recipeIngredient}" placeholder="예 : 계란 1개"></td>
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