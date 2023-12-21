<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
<style>
    .uploadcamera{
    	font-size: 25px;
		cursor: pointer;
    }
</style>

</head>
<body>
<div class="mw_1000">
	<div class="fw_500 cBlack mt-5">
		<a href="${pageContext.request.contextPath}">HOME</a><span class="fs_18 mx-1">></span>
		<a href="${pageContext.request.contextPath}/board/list">자취생 커뮤니티</a><span class="fs_18 mx-1">></span>
		<a href="${pageContext.request.contextPath}/board/form">글수정</a>
	</div>
	 <form action="./updateprocess" method="post" enctype="multipart/form-data">
	 	<input type="hidden" name="num" value="${dto.comBoardSeq}">
		<h6 class="cGreen fw_600 mt-4">제목</h6>
		<input type="text" name="subject" class="form-control borderGreen"
			required="required" value="${dto.comBoardSubject}">
		<input type="file" name="upload" id="upload"
			style="display: none;">
						
		<h6 class="cGreen fw_600 mt-4">수정은 여기에</h6>
		<textarea style="width: 100%;height: 200px;"
			name="content" required="required" class="form-control borderGreen">${dto.comBoardContent}</textarea>
				
		<div class="text-center">
			<button type="submit" class="btn btn_product_input mt-3">잡담등록</button>
			<button type="button" class="btn btn_product_input mt-3 ml-2" onclick="history.back()">목록으로</button>
		</div>
	</form>
</div>
</body>
</html>