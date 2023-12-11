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
<style>
   
  
</style>
</head>
<body>
<div>
	<form action="./addboard" method="post" enctype="multipart/form-data">
		<!-- hidden -->
		<input type="hidden" name="currentPage" value="${currentPage}">
		<input type="hidden" name="num" value="${num}">	
		
		<h3 class="cGreen fw_600 text-center">나의 물품 판매</h3>
		<h6 class="cGreen fw_600 mt-4">제목</h6>
		<input type="text" name="subject" class="form-control borderGreen"
		required autofocus value="${subject}" placeholder="제목">
		<h6 class="cGreen fw_600 mt-2">물품 사진</h6>
		<input type="file" name="upload" multiple class="form-control borderGreen" id="product-input">
		<div id="product-preview"></div>
		<h6 class="cGreen fw_600 mt-2">희망 가격</h6>
		<input type="text" name="price" class="form-control borderGreen" required autofocus value="${price}"
		placeholder="￦ 가격을 입력해주세요.">
		<h6 class="cGreen fw_600 mt-2">거래 희망 장소</h6>
		<input type="text" name="place" class="form-control borderGreen" autofocus value="${place}"
		placeholder="희망하는 거래 위치를 입력해주세요.">
		<h6 class="cGreen fw_600 mt-2">자세한 설명</h6>
		<textarea name="content" class="form-control borderGreen" required
			style="width: 100%;height: 200px;"
			placeholder="게시글의 내용을 작성해주세요. (판매금지 물품은 게시가 제한될 수 있습니다.)

신뢰할 수 있는 거래를 위해 자세히 작성해주세요."></textarea>
		
		
		
		
		<br><br><br>
		<div class="borderGreen d-flex">
			<div class="w100p backGreen">
				제목
			</div>
			<div class="col">
				<input type="text" name="subject" class="form-control"
					required autofocus value="${subject}">
			</div>
		</div>
		<div class="borderGreen d-flex">
			<div class="col p-0 d-flex">
					<div class="w100p backGreen" style="height: 100%;">물품사진</div>
					<div>
						<input type="file" name="upload" multiple class="form-control" id="product-input">
						<div id="product-preview"></div>
					</div>
			</div>
		</div>
		<div class="borderGreen d-flex">
			<div class="col p-0">
				<%-- <div class="d-flex">
					<div class="w100p backGreen">판매자</div>
					<input type="text" name="name" class=""
					required autofocus value="${name}">
				</div> --%>
				<div class="d-flex">
					<div class="w100p backGreen">희망가격</div>
					<input type="text" name="price" class=""
					required autofocus value="${price}">
				</div>
				<div class="d-flex">
					<div class="w100p backGreen">희망장소</div>
					<input type="text" name="place" class=""
					required autofocus value="${place}">
				</div>
			</div>
			<div class="col p-0">
				<div class="d-flex">
					<div class="w100p backGreen">상세설명</div>
					<textarea name="content" class="form-control" required
					style="width: 100%;height: 200px;"></textarea>
				</div>
			</div>
		</div>
		<button type="submit" class="btn btn-outline-success">물품등록</button>
		<button type="button" class="btn btn-outline-success" onclick="history.back()">목록으로</button>
		
		
		<div class="borderGreen d-flex">
			<div class="w100p backGreen">
				제목
			</div>
			<div class="col">
				<input type="text" name="subject" class="form-control"
					required autofocus value="${subject}">
			</div>
		</div>
		<div class="borderGreen d-flex">
			<div class="col p-0 d-flex">
					<div class="w100p backGreen" style="height: 100%;">물품사진</div>
					<div>
						<input type="file" name="upload" multiple class="form-control" id="product-input">
						<div id="product-preview"></div>
					</div>
			</div>
		</div>
		<div class="borderGreen d-flex">
			<div class="w100p backGreen">
				희망가격
			</div>
			<div class="col">
				<input type="text" name="price" class=""
					required autofocus value="${price}">
			</div>
		</div>
		<div class="borderGreen d-flex">
			<div class="w100p backGreen">
				희망장소
			</div>
			<div class="col">
				<input type="text" name="place" class=""
					required autofocus value="${place}">
			</div>
		</div>
		<div class="borderGreen d-flex">
			<div class="w100p backGreen">
				상세설명
			</div>
			<div>
				<textarea name="content" class="form-control" required
				style="width: 100%;height: 200px;"></textarea>
			</div>
		</div>
		<button type="submit" class="btn btn-outline-success">물품등록</button>
		<button type="button" class="btn btn-outline-success" onclick="history.back()">목록으로</button>
	</form>
</div>
<script>
        document.getElementById('product-input').addEventListener('change', handleFileSelect);

        function handleFileSelect(event) {
            const files = event.target.files;
            const productPreview = document.getElementById('product-preview');

            // 초기화
            productPreview.innerHTML = '';

            for (const file of files) {
                const reader = new FileReader();

                reader.onload = function (e) {
                    const img = document.createElement('img');
                    img.src = e.target.result;
                    img.alt = file.name;
                    img.style.marginRight = '10px';
                    productPreview.appendChild(img);
                };

                reader.readAsDataURL(file);
            }
        }
    </script>
</body>
</html>

