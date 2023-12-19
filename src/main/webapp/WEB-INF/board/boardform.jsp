<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
<div style="margin:30px 50px;">
	<div class="fw_500 cBlack mt-5">
		<a href="${pageContext.request.contextPath}">HOME</a><span class="fs_18 mx-1">></span>
		<a href="${pageContext.request.contextPath}/board/list">자취생 커뮤니티</a><span class="fs_18 mx-1">></span>
		<a href="${pageContext.request.contextPath}/board/form">글쓰기</a>
	</div>
	<form action="./insertBoard" method="post" enctype="multipart/form-data">
		<h6 class="cGreen fw_600 mt-4">제목</h6>
		<input type="text" name="comBoardSubject" class="form-control borderGreen"
			   required autofocus placeholder="제목">
		<h6 class="cGreen fw_600 mt-2 p-0">사진</h6>
		<input type="file" name="upload" class="form-control borderGreen" id="product-input" onchange="previewImage(this, 'product-preview')">
		<div id="product-preview"></div>
		<h6 class="cGreen fw_600 mt-3">자세한 설명</h6>
		<textarea name="comBoardContent" class="form-control borderGreen" required
				  style="width: 100%;height: 200px;"
				  placeholder="게시글의 내용을 작성해주세요."></textarea>
		<div class="text-center">
			<button type="submit" class="btn btn_product_input mt-3">물품등록</button>
			<button type="button" class="btn btn_product_input mt-3 ml-2" onclick="history.back()">목록으로</button>
		</div>
	</form>
</div>