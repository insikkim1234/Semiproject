<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   
  
</style>
</head>
<body>
<div style="max-width:1000px; margin:0 auto;"> <!-- 왜 mw_1000클래스로 주면 안먹히지..? -->
	<form action="./insertMarketBoard" method="post" enctype="multipart/form-data">
		<!-- hidden -->
		<input type="hidden" name="currentPage" value="${currentPage}">
		<input type="hidden" name="num" value="${num}">	
		
		<div class="fw_500 cBlack mt-5">
			<a href="${pageContext.request.contextPath}">HOME</a><span class="fs_18 mx-1">></span>
			<a href="${pageContext.request.contextPath}/mboard">벼룩시장</a><span class="fs_18 mx-1">></span>
			<a href="${pageContext.request.contextPath}/mboard/form">나의 물품 등록</a>
		</div>
		<!-- <h3 class="cGreen fw_600 text-center fs_40 my-3">나의 물품 판매</h3> -->
		<h3 data-shadow='Sell Your MEMORY' class="form_title text-center my-3">Sell Your MEMORY</h3>
		<h6 class="cGreen fw_600 mt-4">제목</h6>
		<input type="text" name="boardTitle" class="form-control borderGreen bg_red inset_shadow"
		required autofocus value="${boardTitle}" placeholder="제목">
		<div class="row mt-3">
			<div class="col">
				<h6 class="cGreen fw_600 mt-2">대표 사진</h6>
				<input type="file" name="upload1" class="form-control borderGreen bg_red inset_shadow" id="product-input" onchange="previewImage(this, 'product-preview')" required>
				<div id="product-preview"></div>
			</div>
			<div class="col">
				<h6 class="cGreen fw_600 mt-2">물품 사진 1</h6>
				<input type="file" name="upload2" class="form-control borderGreen bg_red inset_shadow" id="product-input2" onchange="previewImage(this, 'product-preview2')" required>
				<div id="product-preview2"></div>
			</div>
			<div class="col">
				<h6 class="cGreen fw_600 mt-2">물품 사진 2</h6>
				<input type="file" name="upload3" class="form-control borderGreen bg_red inset_shadow" id="product-input3" onchange="previewImage(this, 'product-preview3')" required>
				<div id="product-preview3"></div>
			</div>
		</div>
		
		<h6 class="cGreen fw_600 mt-3">희망 가격</h6>
		<input type="text" name="productPrice" class="form-control borderGreen bg_red inset_shadow" required autofocus value="${productPrice}"
		placeholder="￦ 가격을 입력해주세요. [예 : 5000]">
		<h6 class="cGreen fw_600 mt-3">거래 희망 장소</h6>
		<input type="text" name="productPlace" class="form-control borderGreen bg_red inset_shadow" autofocus value="${productPlace}"
		placeholder="희망하는 거래 위치를 입력해주세요.">
		<h6 class="cGreen fw_600 mt-3">자세한 설명</h6>
		<textarea name="productContent" class="form-control borderGreen bg_red inset_shadow" required
			style="width: 100%;height: 200px;"
			placeholder="게시글의 내용을 작성해주세요.
			
신뢰할 수 있는 거래를 위해 자세히 작성해주세요:)"></textarea>
		<div class="text-center">
			<button type="submit" class="btn-3d red mt-4">물품등록</button>
			<button type="button" class="btn-3d red mt-4 ml-2" onclick="history.back()">목록으로</button>
		</div>
		
	</form>
</div>
	<!-- <script>
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
    </script> -->
     <script>
    function previewImage(input, previewId) {
      const preview = document.getElementById(previewId);
      preview.innerHTML = ''; // 초기화

      const files = input.files;
      for (const file of files) {
        const reader = new FileReader();

        reader.onload = function (e) {
          const img = document.createElement('img');
          img.src = e.target.result;
          img.alt = file.name;
          img.style.width = '95%'; // 이미지 크기 조절
          /* img.style.marginRight = '5px';
          img.style.marginLeft = '5px'; */
          preview.appendChild(img);
        };

        reader.readAsDataURL(file);
      }
    }
  </script>
</body>
</html>

