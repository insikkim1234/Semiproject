<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- TODO: move to css file-->
<style>
    .div_recipeOrder {
        width: 100%;
        box-sizing: border-box;
        background-color: var(--black);
        padding: 10px;
    }

    .div_recipeOrderItem {
        background-color: var(--white);
        padding: 10px;
        margin: 10px;
        display: flex;

    }

    .div_recipeOrderImg {
        max-width:30%;
        min-width:30%;
        margin-left: auto;
    }

    .img_recipeOrder {
        width: 100%;
        height: auto;
        border-radius: 16px;
    }

    .div_recipeOrderContent {
        flex-grow: 1;
        margin-right: 20px;
        font-size: 24px;
    }

</style>

<div class="div_recipeOrder">
    <c:forEach var="orderItem" items="${recipeOrderDtoList}" >
        <div class="div_recipeOrderItem">
            <div class="div_recipeOrderContent">
                <c:out value="${orderItem.recipeOrderContent}" />
            </div>
            <div class="div_recipeOrderImg">
                <img class="img_recipeOrder" src="${STORAGE_PHOTO_PATH}${orderItem.recipeOrderPhoto}" />
            </div>
        </div>
    </c:forEach>
</div>