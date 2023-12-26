<%@ page import="naver.storage.NcpObjectStorageService" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="mw_1000">
	<div class="fw_500 cBlack mt-5">
		<a href="${pageContext.request.contextPath}">HOME</a><span class="fs_18 mx-1">></span>
		<a href="${pageContext.request.contextPath}/board/list">자취생 커뮤니티</a><span class="fs_18 mx-1">></span>
		<a href="${pageContext.request.contextPath}/board/form">글수정</a>
	</div>
	 <form action="./updateprocess" method="post" enctype="multipart/form-data">
	 	<input type="hidden" name="num" value="${dto.comBoardSeq}">
		<h6 class="cGreen fw_600 mt-4">제목</h6>
		<input type="text" name="comBoardSubject" class="form-control borderGreen bg_red inset_shadow"
			required="required" value="${dto.comBoardSubject}">
		 <h6 class="cGreen fw_600 mt-4">사진</h6>
		 <input type="file" name="upload" id="upload" class="form-control borderGreen bg_red inset_shadow" id="product-input" onchange="previewImage(this, 'product-preview')">
		 <div id="product-preview">
			 <img src="<%=NcpObjectStorageService.STORAGE_PHOTO_PATH%>${dto.comBoardPhoto}" class="card-img-top custom-img img-fluid recipe_img" id="current-image">
		 </div>


		 <h6 class="cGreen fw_600 mt-4">수정은 여기에</h6>
		<textarea style="width: 100%;height: 200px;"
			name="comBoardContent" required="required" class="form-control borderGreen bg_red inset_shadow">${dto.comBoardContent}</textarea>
				
		<div class="text-center mt-2">
			<button type="submit" class="btn-3d red mt-3">수정등록</button>
			<button type="button" class="btn-3d red mt-3 ml-2" onclick="history.back()">목록으로</button>
		</div>
	</form>

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
					img.style.width = '55%'; // 이미지 크기 조절
					/* img.style.marginRight = '5px';
                    img.style.marginLeft = '5px'; */
					preview.appendChild(img);
				};

				reader.readAsDataURL(file);
			}
		}
	</script>
</div>