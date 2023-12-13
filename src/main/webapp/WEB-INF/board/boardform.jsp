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
<script type="text/javascript">
	$(function(){
		//카메라 이벤트
		$(".uploadcamera").click(function(){
			$("#upload").trigger("click");//이벤트 강제 발생
		});
		
		$("#upload").change(function(){
			  console.log("1:"+$(this)[0].files.length);
			  console.log("2:"+$(this)[0].files[0]);
			  //정규표현식
			var reg = /(.*?)\/(jpg|jpeg|png|bmp)$/;
			var f=$(this)[0].files[0];//현재 선택한 파일
			if(!f.type.match(reg)){
			   alert("확장자가 이미지파일이 아닙니다");
			   return;
			}

		  if($(this)[0].files[0]){
		   var reader=new FileReader();
		   reader.onload=function(e){
		    $("#showimg").attr("src",e.target.result);
		   }
		   reader.readAsDataURL($(this)[0].files[0]);
		  }
		 });
	});
</script>
</head>
<body>
<!-- 이미지 출력할곳 -->
 <img id="showimg"
 style="position: absolute;left:600px;top:60px;max-width: 300px;">
 
<div style="margin:30px 50px;">
	<form action="./addprocess" method="post" enctype="multipart/form-data">
		<table class="table table-bordered" style="width:500px;">
			<caption align="top">글쓰기</caption>
			<tr>
				<th width="100">작성자</th>
				<td>
					<input type="text" name="writer" class="form-control"
					style="width: 150px" autofocus="autofocus" required="required">
				</td>
			</tr>
			<tr>
				<th width="100">제목</th>
				<td class="input-group">
					<input type="text" name="subject" class="form-control"
					required="required">
					<input type="file" name="upload" id="upload"
					style="display: none;">
					&nbsp;&nbsp;
					<!-- 카메라 아이콘 -->
					<i class="bi bi-camera-fill uploadcamera"></i>
				</td>
			</tr>
			<tr>
				<th width="100">내용</th>
				<td>
					<textarea style="width: 100%;height: 150px;"
						name="content" required="required" class="form-control"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit" class="btn btn-outline-success"
					style="width: 100px;">등록</button>
					
					<button type="button" class="btn btn-outline-success"
					style="width: 100px;" onclick="history.back()">이전</button>
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>