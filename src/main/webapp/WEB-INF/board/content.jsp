<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<body>
<div class="mw_1000">
	<div class="fw_500 cBlack mt-5">
		<a href="${pageContext.request.contextPath}">HOME</a><span class="fs_18 mx-1">></span>
		<a href="${pageContext.request.contextPath}/board/list">자취생 커뮤니티</a><span class="fs_18 mx-1">></span>
		<a href="${pageContext.request.contextPath}/board/content">상세 페이지</a>
	</div>
	<div class="mt-4 content-border">
		<div class="fs_30 mt-2 fw_600 px-2">${dto.comBoardSubject}</div>
		<div class="row px-2 mt-2">
			<div class="col">
				<span><i class="bi bi-person-fill fs_17 mr-2"></i><b>${dto.userName}</b></span>&nbsp;
				<span><i class="bi bi-three-dots-vertical"></i></span>&nbsp;
				<span class="day"><i class="bi bi-eye-fill fs_17 mr-2"></i><b>${dto.comBoardviewCount}</b></span>
					
				<button type="button" class="btn-3d red ml-3 fw_500"
					 onclick="location.href='./updateform?comBoardSeq=${dto.comBoardSeq}'">수정</button>
						
				<button type="button" class="btn-3d red ml-1 fw_500"
					 onclick="location.href='./delete?comBoardSeq=${dto.comBoardSeq}'">삭제</button>
			</div>
			<div class="col text-right">
				<fmt:formatDate value="${dto.writeDay}" pattern="yyyy-MM-dd HH:mm"/>
			</div>
		</div>
		
		<div class="content-border mt-3 py-2">
			<pre style="min-height: 300px;" class="fs_16 px-2">${dto.comBoardContent}</pre>
			<div class="content-border py-2">
				<i class="bi bi-chat-dots ml-3 "></i> &nbsp;${acount}
			</div>
			<div style="margin-bottom: 10px; border-bottom: 1px solid #c5c5c5;">
	 			<form action="./addanswer" method="post">
	 				<input type="hidden" name="num" value="${dto.comBoardSeq}">
	 				<div class="input-group content_comment px-2"> 						
	 					<input type="text" name="nickname" class="input1 bg_red" placeholder="닉네임">
	 					<input type="text" name="content" class="col input2 bg_red" placeholder="댓글">
	 							
	 					<button type="submit" class="btn-3d red ml-2">저장</button>
	 				</div>
	 			</form>
	 		</div> 	
			
	
			<div class="text-center mt-4"> 
				<button type="button" class="btn-3d red fw_600"
				onclick="location.href='./list'">목록으로</button>
			</div>
		</div>
	</div>
</div>
</body>