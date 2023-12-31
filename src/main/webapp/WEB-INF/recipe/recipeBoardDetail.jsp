<%@ page import="naver.storage.NcpObjectStorageService" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
    .div_detail {
    	width: 100%;
	    box-sizing: border-box;
	    box-shadow: 10px 15px 30px #49505770;
	    padding: 50px;
	    border-radius: 5px;
    	border: 6px dashed #c12c2f91;
    }

    .div_detailItem {
        margin: 0 auto;
        max-width: 750px;
    }

	span.detailWriter, span.detailViewCount, span.detailCreatedAt, span.detailUpdatedAt {
   		font-size: 14px;
   		font-weight:500;
   		color: #6b6b6b;
    }
    
    .detail_img {
    	width: 50%;
    }
    
    .detailContent {
	    position: relative;
	    color: #6b6b6b;
	    line-height:180%;
	    width: 100%;
	    border-bottom: 1px solid #6b6b6b;
	    
    }
    
    .detailInfo {
	    text-align: center;
		color:#000;
		border-bottom: 1px solid #000;
		margin-right:0;
		margin-left:0;
    }
    
    
    .detailIngredient {
	    position: relative;
	    color: black;
	    font-size: 16px;
	    line-height: 170%;
	    font-style: normal;
	    margin: 0;
	    width: 100%;
    }
</style>
<div class="mw_1200">
	<div class="fw_500 cBlack mt-5">
		<a href="${pageContext.request.contextPath}">HOME</a><span class="fs_18 mx-1">></span>
		<a href="${pageContext.request.contextPath}/recipe/board">레시피북</a><span class="fs_18 mx-1">></span>
		<a href="${pageContext.request.contextPath}/recipe/board/recipeBoardDetail">현재페이지</a>
	</div>
	<!-- <div class="fs_32 fw_600 cGreen r-detail mt-2">레시피 A to Z</div> -->
	<div class="wrapper2 mt-3">
		<div class="focus2">
		    레시피 A to Z
		</div>
		<div class="mask2">
		   <div class="text2">레시피 A to Z</div>
  		</div>
	</div>
	<div class="r-detail"></div>
	<div class="div_detail mt-3" style="background: #ecd26017;">
		<div class="rgyPostIt2 fw_600">레시피 #${dto.recipeIdx}</div>
		<div class="div_detailItem">
			<div class="rtitle_border">
				<div class="fs_28 fw_600 cBlack text-center">
					<!-- <div class="rgyPostIt2 mr-3">레시피 #${dto.recipeIdx}</div> -->${dto.recipeTitle}
				</div>
				<div class="text-end mt-2">
					<span class="detailWriter"><i class="bi bi-person-fill fs_19"></i></span>
					<b>${dto.recipeUserName}</b>&nbsp;
					<span><i class="bi bi-three-dots-vertical"></i></span>&nbsp;
					<span class="detailViewCount"><i class="bi bi-eye-fill fs_19"></i></span>
					<b>${dto.recipeViewCount}</b>
				</div>
				<div class="row">
					<div class="col">
						<a href="${pageContext.request.contextPath}/recipe/board" class="btn-3d red2 fw_600">목록</a>
                  		<c:if test="${sessionScope.login_member_dto != null && sessionScope.login_member_dto.userSeq.equals(dto.recipeUserSeq)}">
	                  		<a class="fw_600 btn-3d red2 ml-2" href="${pageContext.request.contextPath}/recipe/update/${dto.recipeIdx}">수정</a>
	                  		<form action="../deleteRecipe" method="post" class="d-inline-block p-0">
	                  			<input type="hidden" name="recipeIdx" value="${dto.recipeIdx}" />
	                     		<button class="fw_600 btn-3d red2 fw_600 ml-2" type="submit" style="border-radius: 5px;">삭제</button>
	                  		</form>
                     	</c:if>
               		</div>

					<div class="col text-end my-1">
						<span class="detailCreatedAt">작성일 : </span>
						<b><fmt:formatDate value="${dto.recipeCreatedAt}" pattern="yyyy-MM-dd"/></b>&nbsp;
						<span class="detailUpdatedAt">수정일 : </span>
						<b><fmt:formatDate value="${dto.recipeUpdatedAt}" pattern="yyyy-MM-dd"/></b> 
					</div>
				</div>
			</div>
			
			<br><br>
			<div class="text-center">
				<img class="detail_img" src="<%=NcpObjectStorageService.STORAGE_PHOTO_PATH%>${dto.recipePhoto}" >
			</div>
			<br>
			<div class="detailContent">
				<div class="cGreen fw_600 fs_24 mt-2 nanumfont">[주저리 주저리]</div>
				<pre class="m-0 py-3 fs_16">${dto.recipeContent}</pre>
			</div>
			<div class="cGreen fw_600 fs_24 mt-2 nanumfont">
				[About 레시피]</div>
			<div class="detailInfo row">
				<div class="col my-3">
					<span class="fs_24 fw_600 nanumfont cGreen">얼만큼? : </span>
					<i class="bi bi-people-fill fs_25"></i>
					<span class="mt-2 fs_18 fw_600">${dto.recipeServing}</span>
				</div>
				<div class="col my-3">
					<span class="fs_24 fw_600 nanumfont cGreen">시간은? : </span>
					<i class="bi bi-alarm-fill fs_25"></i>
					<span class="mt-2 fs_18 fw_600">${dto.recipeTime}</span>
				</div>
				<div class="col my-3">
					<span class="fs_24 fw_600 nanumfont cGreen">할 수 있다! : </span>
					<i class="bi bi-star-fill fs_25"></i>
					<span class="mt-2 fs_18 fw_600">${dto.recipeDifficulty}</span>
				</div>
			</div>
			<div class="detailIngredient">
				<div class="cGreen fw_600 mt-4 fs_24 nanumfont mb-3">[About 재료]</div>
				
			    <c:if test="${not empty dto.recipeIngredient}">
			        <c:set var="ingredients" value="${dto.recipeIngredient}" />
			        <c:forTokens var="ingredient" items="${ingredients}" delims=",">
			        	<!-- TODO : 이미지 이름 ingredient, ingredient2 중 하나 선택 -->
			            <div class="d-flex align-items-center">
			            <i class="bi bi-basket3-fill mr-3 fs_26" style="color: #000;"></i><i class="bi bi-three-dots-vertical mr-2 fs_20" style="color: #000;"></i><div class="rgyPostIt">${ingredient}</div>
			            </div>
			            <br/>
			        </c:forTokens>
				</c:if>
			</div>
		</div>
	</div>
</div>
