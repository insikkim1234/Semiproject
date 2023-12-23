<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div style="max-width:1000px; margin:0 auto;"> 
	<form action="./insertRecipe" method="post" enctype="multipart/form-data">
		<!-- hidden -->
		<input type="hidden" name="currentPage" value="${currentPage}">
		<input type="hidden" name="num" value="${num}">	
		<div class="fw_500 cBlack mt-5">
		<a href="${pageContext.request.contextPath}">HOME</a><span class="fs_18 mx-1">></span>
		<a href="${pageContext.request.contextPath}/recipe/board">레시피북</a><span class="fs_18 mx-1">></span>
		<a href="${pageContext.request.contextPath}/recipe/recipeBoardInput">레시피 등록</a>
	</div>
		<!-- <h3 class="cGreen fw_600 text-center fs_40 my-3">나만의 레시피</h3> -->
		<h3 data-shadow='My Secret RECIPE' class="form_title text-center my-3">My Secret RECIPE</h3>
		<h6 class="cGreen fw_600 mt-4">제목</h6>
		<input type="text" name="recipeTitle" class="form-control borderGreen bg_red inset_shadow"
		required autofocus value="${recipeTitle}" placeholder="제목">
		<div class="row mt-3">
			<div class="col">
				<h6 class="cGreen fw_600 mt-2">사진</h6>
				<input type="file" name="upload" class="form-control borderGreen bg_red inset_shadow" id="product-input4" onchange="previewImage(this, 'product-preview4')">
				<div id="product-preview4" class="mt-2"></div>
			</div>
		</div>
		<h6 class="cGreen fw_600 mt-3">설명</h6>
		<textarea name="recipeContent" class="form-control borderGreen bg_red inset_shadow" required autofocus rows="3" cols="50" placeholder="설명을 입력해주세요.">${recipeContent}</textarea>

		<h6 class="cGreen fw_600 mt-3">조리시간</h6>
		<input type="text" name="recipeTime" class="form-control borderGreen bg_red inset_shadow" required autofocus value="${recipeTime}"
		placeholder="예 : 10분">
		
		<h6 class="cGreen fw_600 mt-3"><th>난이도</th></h6>
		<td>
			<select class="form-select bg_red inset_shadow" name="recipeDifficulty" style="border: 2px solid #c63702;">
			    <option hidden disabled selected style="color: black;">난이도 선택</option>
			    <option value="쉬움">쉬움</option>
			    <option value="보통">보통</option>
			    <option value="어려움">어려움</option>
			</select>
		</td>	
		<h6 class="cGreen fw_600 mt-3">인분</h6>
		<input type="text" name="recipeServing" class="form-control borderGreen bg_red inset_shadow" autofocus value="${recipeServing}"
		placeholder="예 : 1인분">
		
		<h6 class="cGreen fw_600 mt-3"><th>재료</th></h6>
		<td>
			<div id="ingredient-container">
				<div class="ingredient-row">
					<input type="text" name="recipeIngredient" class="form-control borderGreen bg_red inset_shadow" required autofocus value="${recipeIngredient}"
			placeholder="예 : 계란 1개">
					<button type="button" class="btn btn-3d red2 mt-3" onclick="addIngredient()">추가</button>
					<br>
				</div>
			</div>
		</td>
		
		<h6 class="cGreen fw_600 mt-3"><th>조리 순서</th></h6>
		<td>
			<div id="order-container">
				<div class="order-row">
					<textarea name="orderlist[0].recipeOrderContent" class="form-control bg_red borderGreen inset_shadow" required autofocus placeholder="예 : 파를 다듬어 줍니다.">${recipeOrderContent}</textarea>
					<input type="file" name="orderlist[0].upload" class="form-control bg_red borderGreen mt-1 inset_shadow" required value="${recipeOrderPhoto}">
					<button type="button" class="btn btn-3d red2 mt-3" onclick="addOrder()">추가</button>
					<br>
				</div>
			</div>
		</td>
		<div class="text-center">
			<button type="submit" class="btn btn-3d red mt-3">저장</button>
			<button type="button" class="btn btn-3d red mt-3 ml-2" onclick="history.back()">이전</button>
		</div>
		
	</form>
</div>

<script>
	function addIngredient(){
		var container = document.getElementById("ingredient-container");
        var newRow = document.createElement("div");
        newRow.className = "ingredient-row";
        newRow.innerHTML = '<br>' + 
        				   '<input type="text" name="recipeIngredient" class="form-control bg_red borderGreen inset_shadow" required autofocus placeholder="예: 계란 1개">' +
                           '<button type="button" class="btn-3d red2 mt-3" onclick="removeIngredient(this)">삭제</button>';
        container.appendChild(newRow);
	}

   	function removeIngredient(button) {
		button.parentNode.remove();
	}
       
    function addOrder(){
    	var elements = document.getElementsByClassName("order-row");
 		var idx = 0;
 		if (elements !== null) {
 			idx = document.getElementsByClassName("order-row").length; 			
 		}
 		
		var container = document.getElementById("order-container");
        var newRow = document.createElement("div");
        newRow.className = "order-row";
        newRow.innerHTML = '<br>' + 
					       '<textarea name="orderlist[' + idx + '].recipeOrderContent" class="form-control bg_red borderGreen inset_shadow" required autofocus placeholder="예 : 파를 다듬어 줍니다.">${recipeContent}</textarea>' +
						   '<input type="file" name="orderlist[' + idx + '].upload" class="form-control  bg_red borderGreen inset_shadow mt-1" required>' + 
						   '<button type="button" class="btn-3d red2 mt-3" onclick="removeOrder(this)">삭제</button>';
		container.appendChild(newRow);
	}

    function removeOrder(button) {
    	button.parentNode.remove();
   	}
    
    // 사진 미리보기
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
          img.style.width = '50%'; // 이미지 크기 조절
          preview.appendChild(img);
        };

        reader.readAsDataURL(file);
      }
    }
</script>