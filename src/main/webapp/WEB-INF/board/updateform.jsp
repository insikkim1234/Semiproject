<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<style>
    body * {
        font-family: 'Jua';
    }
    .uploadcamera{
    	font-size: 25px;
		cursor: pointer;
    }
</style>

</head>
<body>

 <form action="./updateprocess" method="post" enctype="multipart/form-data">
 	<input type="hidden" name="num" value="${dto.comBoardSeq}">
 

	
		
		
			
			
			<tr>
				<th width="100">제목</th>
				<td class="input-group">
					<input type="text" name="subject" class="form-control"
					required="required" value="${dto.comBoardSubject}">
					<input type="file" name="upload" id="upload"
					style="display: none;">
					
					
				</td>
			</tr>
			<tr>
				<th width="100">내용</th>
				<td>
					<textarea style="width: 100%;height: 150px;"
						name="content" required="required" class="form-control">${dto.comBoardContent}</textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit" class="btn btn-outline-success"
					style="width: 100px;">수정</button>
					
					<button type="button" class="btn btn-outline-success"
					style="width: 100px;" onclick="history.back()">이전</button>
				</td>
			</tr>
		</table>
	</form>

</body>
</html>