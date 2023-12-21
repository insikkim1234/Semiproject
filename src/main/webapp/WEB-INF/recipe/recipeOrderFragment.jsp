<%@ page import="naver.storage.NcpObjectStorageService" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- TODO: move to css file-->
<style>
	#order_title {
		background-color: var(--white);
        padding: 10px;
        margin: 10px;
        display: flex;
        font-size: 16px;
        color: #aaa;
	}
	
    .div_recipeOrder {
        width: 100%;
        /* background-color: var(--black); */
        padding: 10px;
    }

    .img_recipeOrder {
        width: 100%;
        height: auto;
        border-radius: 10px;
    }

    .div_recipeOrderContent {
        flex-grow: 1;
        margin-right: 20px;
        font-size: 24px;
    }

</style>

<div class="mw_1200 rOrderbox mb-5">
	<div class="div_recipeOrder mt-5">
		<div class="cGreen fw_600 mt-4 fs_30 nanumfont mw_750">
			[조리 Step By Step]
		</div>
	    <c:forEach var="orderItem" items="${recipeOrderDtoList}" >
	        <div class="row mw_750 mt-4">
	            <div class="col-4">
	                <img class="img_recipeOrder" src="<%=NcpObjectStorageService.STORAGE_PHOTO_PATH%>${orderItem.recipeOrderPhoto}" />
	            </div>
	            <div class="col ml-4 fs_19">
	            	<div class="rgyPostIt3">Step<c:out value="${orderItem.recipeNumber}" /></div>
	                <c:out value="${orderItem.recipeOrderContent}" />
	            </div>
	        </div>
	    </c:forEach>
	</div>
</div>