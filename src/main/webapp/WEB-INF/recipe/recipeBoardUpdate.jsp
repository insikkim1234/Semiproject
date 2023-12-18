<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div style="max-width:1000px; margin:0 auto;"> 
    <form action="./updateRecipe" method="post" enctype="multipart/form-data">
        <!-- hidden -->
        <input type="hidden" name="recipeIdx" value="${recipeDto.recipeIdx}">
        
        <h3 class="cGreen fw_600 text-center fs_40 my-3">레시피 수정하기</h3>
        
        <!-- 제목 수정 -->
        <h6 class="cGreen fw_600 mt-4">제목</h6>
        <input type="text" name="recipeTitle" class="form-control borderGreen"
            required autofocus value="${recipeDto.recipeTitle}" placeholder="제목">
        
        <!-- 사진 수정 -->
        <div class="row mt-3">
            <div class="col">
                <h6 class="cGreen fw_600 mt-2">사진</h6>
                <input type="file" name="upload" class="form-control borderGreen" id="product-input4" onchange="previewImage(this, 'product-preview4')">
                <div id="product-preview4" class="mt-2"></div>
            </div>
        </div>
        
        <!-- 내용 수정 -->
        <h6 class="cGreen fw_600 mt-3">설명</h6>
        <textarea name="recipeContent" class="form-control borderGreen" required autofocus rows="3" cols="50" placeholder="설명을 입력해주세요.">${recipeDto.recipeContent}</textarea>

        <!-- 조리시간 수정 -->
        <h6 class="cGreen fw_600 mt-3">조리시간</h6>
        <input type="text" name="recipeTime" class="form-control borderGreen" required autofocus value="${recipeDto.recipeTime}"
            placeholder="예 : 10분">
        
        <!-- 난이도 수정 -->
        <h6 class="cGreen fw_600 mt-3"><th>난이도</th></h6>
        <td>
            <select class="form-select" name="recipeDifficulty" style="border: 2px solid #11B560;">
                <option hidden disabled selected style="color: black;">난이도 선택</option>
                <option value="쉬움" ${recipeDto.recipeDifficulty == '쉬움' ? 'selected' : ''}>쉬움</option>
                <option value="보통" ${recipeDto.recipeDifficulty == '보통' ? 'selected' : ''}>보통</option>
                <option value="어려움" ${recipeDto.recipeDifficulty == '어려움' ? 'selected' : ''}>어려움</option>
            </select>
        </td>   
        
        <!-- 인분 수정 -->
        <h6 class="cGreen fw_600 mt-3">인분</h6>
        <input type="text" name="recipeServing" class="form-control borderGreen" autofocus value="${recipeDto.recipeServing}"
            placeholder="예 : 1인분">
        
        <!-- 재료 수정 -->
        <h6 class="cGreen fw_600 mt-3"><th>재료</th></h6>
        <td>
            <div id="ingredient-container">
                <c:forEach var="ingredient" items="${recipeDto.recipeIngredient}" varStatus="status">
                    <div class="ingredient-row">
                        <input type="text" name="recipeIngredient" class="form-control borderGreen" required autofocus value="${ingredient}"
                            placeholder="예 : 계란 1개">
                        <button type="button" class="btn btn-outline-secondary" onclick="removeIngredient(this)">삭제</button>
                        <br>
                    </div>
                </c:forEach>
                <button type="button" class="btn btn-outline-success" onclick="addIngredient()">추가</button>
            </div>
        </td>
        
        <!-- 저장 버튼 -->
        <div class="text-center">
            <button type="submit" class="btn btn_product_input mt-3">저장</button>
            <button type="button" class="btn btn_product_input mt-3 ml-2" onclick="history.back()">이전</button>
        </div>
    </form>
</div>

<script>
    // 이미지 미리보기 함수
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
    
    // 재료 추가 함수
    function addIngredient() {
        var container = document.getElementById("ingredient-container");
        var newRow = document.createElement("div");
        newRow.className = "ingredient-row";
        newRow.innerHTML = '<br>' +
                           '<input type="text" name="recipeIngredient" class="form-control" required autofocus placeholder="예: 계란 1개">' +
                           '<button type="button" class="btn btn-outline-secondary" onclick="removeIngredient(this)">삭제</button>';
        container.appendChild(newRow);
    }

    // 재료 삭제 함수
    function removeIngredient(button) {
        button.parentNode.remove();
    }
</script>
