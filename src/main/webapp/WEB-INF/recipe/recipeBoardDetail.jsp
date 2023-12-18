<%@ page import="naver.storage.NcpObjectStorageService" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
    .div_detail {
    	width: 1200px;
	    box-sizing: border-box;
	    box-shadow: 10px 15px 30px #49505770;
	    padding: 50px;
	    border: 1px solid #19875440;
    }

    .div_detailItem {
        margin: 0 auto;
        max-width: 750px;
    }

	span.detailWriter, span.detailViewCount, span.detailCreatedAt, span.detailUpdatedAt {
   		font-size: 11px;
   		color: gray;
    }
    
    .detail_img {
    	width: 500px;
    	height: 500px;
        border-radius: 16px;
    }
    
    .detailContent {
	    position: relative;
	    padding: 2px 10px 10px 10px;
	    color: #aaa;
	    font-size: 16px;
	    line-height: 170%;
	    font-style: normal;
	    margin: 0;
	    width: 100%;
    }
    
    .detailInfo {
    	padding: 2px 15px 0;
	    text-align: center;
	    padding-bottom: 40px;
    }
    
    .detailInfo span {
    	display: inline-block;
	    width: 32%;
	    padding-top: 56px;
	    color: #bcb7b7;
	    font-size: 16px;
    }
    
    .detailInfo1 {
        background: url(//recipe1.ezmember.co.kr/img/mobile/icon_man.png) center no-repeat;
    	background-size: 34px;
    }

    .detailInfo2 {
        background: url(//recipe1.ezmember.co.kr/img/mobile/icon_time2.png) center no-repeat;
    	background-size: 34px;
    }

    .detailInfo3 {
		background: url(//recipe1.ezmember.co.kr/img/mobile/icon_star.png) center no-repeat;
    	background-size: 34px;
    }
    
    .detailIngredient {
	    position: relative;
	    padding: 2px 10px 10px 10px;
	    color: black;
	    font-size: 16px;
	    line-height: 170%;
	    font-style: normal;
	    margin: 0;
	    width: 100%;
    }
</style>
<div class="mw_1200">
	<div class="fs_32 fw_600 cGreen r-detail mt-5">레시피 A to Z</div>
	<div class="div_detail mt-3">
		<div class="div_detailItem">
			<div class="rtitle_border">
				<div class="fs_28 fw_600 cBlack">
					${dto.recipeTitle}
				</div>
				<br>
				<br>
				<div class="text-end">
					<span class="detailWriter"><i class="bi bi-person-fill fs_19"></i></span>
					<b>${dto.recipeUserName}</b>&nbsp;
					<span><i class="bi bi-three-dots-vertical"></i></span>&nbsp;
					<span class="detailViewCount"><i class="bi bi-eye-fill fs_19"></i></span>
					<b>${dto.recipeViewCount}</b>
				</div>
				<div class="text-end">
					<span class="detailCreatedAt">작성일 : </span>
					<b><fmt:formatDate value="${dto.recipeCreatedAt}" pattern="yyyy-MM-dd"/></b>&nbsp;
					<br>
					<span class="detailUpdatedAt">수정일 : </span>
					<b><fmt:formatDate value="${dto.recipeUpdatedAt}" pattern="yyyy-MM-dd"/></b> 
				</div>
			</div>
			
			<br><br>
			<div class="text-center">
				<img class="detail_img" src="<%=NcpObjectStorageService.STORAGE_PHOTO_PATH%>${dto.recipePhoto}" >
			</div>
			<br>
			<div class="detailContent">
				[내용]
				<pre>${dto.recipeContent}</pre>
			</div>
			<div class="detailInfo">
				<span class="detailInfo1">${dto.recipeServing}</span>
				<span class="detailInfo2">${dto.recipeTime}</span>
				<span class="detailInfo3">${dto.recipeDifficulty}</span>
			</div>
			<div class="detailIngredient">
				<span style="color: #aaa;">[재료]</span>
				<br>
			    <c:if test="${not empty dto.recipeIngredient}">
			        <c:set var="ingredients" value="${dto.recipeIngredient}" />
			        <c:forTokens var="ingredient" items="${ingredients}" delims=",">
			        	<!-- TODO : 이미지 이름 ingredient, ingredient2 중 하나 선택 -->
			            <img src="<%=NcpObjectStorageService.STORAGE_PHOTO_PATH%>ingredient2.png" class="img-fluid" style="width: 40px;"> <div class="rgyPostIt">${ingredient}</div>
			            <br/>
			        </c:forTokens>
				</c:if>
			</div>
		</div>
	</div>
</div>
