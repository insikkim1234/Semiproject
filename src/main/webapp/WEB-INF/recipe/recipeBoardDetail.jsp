<%@ page import="naver.storage.NcpObjectStorageService" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
    .div_detail {
        width: 100%;
        box-sizing: border-box;
        background-color: black;
        padding: 10px;
        margin-bottom: 10px;
    }

    .div_detailItem {
        background-color: white;
        padding: 10px;
        margin: 10px;
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

<div class="div_detail">
	<div class="div_detailItem">
		<b style="font-size: 40px;">${dto.recipeTitle}</b>
		<br>
		<br>
		<div>
			<span class="detailWriter">작성자 : </span>
			<b>${dto.recipeUserName}</b>&nbsp;
			<span class="detailViewCount">조회수 : </span>
			<b>${dto.recipeViewCount}</b>
		</div>
		<div>
			<span class="detailCreatedAt">작성일 : </span>
			<b><fmt:formatDate value="${dto.recipeCreatedAt}" pattern="yyyy-MM-dd"/></b>&nbsp;
			<br>
			<span class="detailUpdatedAt">수정일 : </span>
			<b><fmt:formatDate value="${dto.recipeUpdatedAt}" pattern="yyyy-MM-dd"/></b> 
		</div>
		<br><br>
		<div>
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
		            <img src="<%=NcpObjectStorageService.STORAGE_PHOTO_PATH%>ingredient2.png" class="img-fluid" style="width: 40px;"> ${ingredient}
		            <br/>
		        </c:forTokens>
			</c:if>
		</div>
	</div>
</div>
