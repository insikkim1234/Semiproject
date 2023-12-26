<%@page import="naver.storage.NcpObjectStorageService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<script type="text/javascript">
$(function() {
	list();
    $('#btnAnswerAdd').click(function() {
        var boardSeq = ${mDto.boardSeq};
		var commentContent = $('#answerMsg').val();
        
        if (commentContent.trim() === "") {
        	return;
        }
		
        $.ajax({
            url: './insertMAnswer',
            method: 'POST',
            contentType: 'application/x-www-form-urlencoded',
            data: {
            	boardSeq: boardSeq,
                msg: commentContent
            },
            success: function(response) {
                console.log('댓글이 성공적으로 저장되었습니다.');
                console.log(response.status);
                // 성공적으로 저장된 경우 추가 작업 수행
                // 예를 들어, 화면에 새로운 댓글을 추가하는 등의 작업 수행 가능
                list();
                $("#answerMsg").val("");
                
            },
            error: function(xhr, status, error) {
                console.error('댓글 저장에 실패했습니다.');
                console.error('에러 상태 코드:', status);
                console.error('에러 메시지:', error);
            }
        });
    });

    $(document).on("click",".answerDel",function(){
    	let commentSeq=$(this).attr("commentSeq");
    	let boardSeq=$(this).attr("boardSeq");
    	
    	$.ajax({
    		type:"POST",
    		dataType:"text",
    		url:"./deleteMComment",
    		data:{"commentSeq":commentSeq,
    			"boardSeq":boardSeq},
    		success:function(res){
    			list();
    		}
    	});
    });
});


	
function list()
{
	let boardSeq = ${mDto.boardSeq};
	
	$.ajax({
		type:"get",
		dataType:"json",
		url:"./list",
		data:{"boardSeq":boardSeq},
				
		success:function(res){
			let length=res.length;
			let datas=res.data;

			$("#answercount").text("댓글 "+length);

			var s = '';
			var sessionSeq = ${sessionScope.login_member_dto.userSeq}
			$.each(datas, function (idx, item) {
			    s += `
			        \${item.userNickName}<br>
			        <span style="margin-left:20px;">\${item.commentContent}</span>
			        &nbsp;
			        <span style="color:gray;font-size:0.9em;">\${item.createDate}</span>`;

				if (sessionSeq === item.userSeq)
				{
					s += `<i class="bi bi-trash answerDel" commentSeq="\${item.commentSeq}"
			         	boardSeq="\${item.boardSeq}"></i>`;
				}
				s += "<br>";
			    s += "<hr>";
			});

			$("div.answerlist").html(s);
	    }
	});
}




</script>
</head>
<body>
<div class="mw_1000">
	<div class="fw_500 cBlack mt-5">
		<a href="${pageContext.request.contextPath}">HOME</a><span class="fs_18 mx-1">></span>
		<a href="${pageContext.request.contextPath}/mboard">벼룩시장</a><span class="fs_18 mx-1">></span>
		<a href="${pageContext.request.contextPath}/mboard/content">상세 페이지</a>
	</div>
	<div class="fs_40 fw_600 cGreen text_left mt-3 mboard_effect">
		<span>고</span><span>민</span><span>하</span><span>다</span><span>&nbsp;</span><span>뺏</span><span>긴</span><span>다</span><span>?</span>
	</div>
	<div class="r-detail"></div>
		<div class="mt-4 content-border">
			<div class="fs_30 mt-2 fw_600 px-2">${mDto.boardTitle}</div>
			<div class="row px-2 mt-2">
				<div class="col">
					<span><i class="bi bi-person-fill fs_17 mr-2"></i><b>${mDto.userNickName}</b></span>&nbsp;
					<span><i class="bi bi-three-dots-vertical"></i></span>&nbsp; <span
						class="day"><i class="bi bi-eye-fill fs_17 mr-2"></i><b>${mDto.boardViewCount}</b></span>

					<c:if test="${sessionScope.login_member_dto != null && sessionScope.login_member_dto.userSeq.equals(mDto.userSeq)}">	
						<button type="button" class="btn-3d red2 ml-3"
							onclick="location.href='./updateform?boardSeq=${mDto.boardSeq}'">수정</button>	
						<button type="button" class="btn-3d red2 ml-1"
							onclick="location.href='./deletecontent?boardSeq=${mDto.boardSeq}&currentPage=${currentPage}'">삭제</button>
					</c:if>
				</div>
				<div class="col text-right">
					<span class="detailCreatedAt">작성일 : </span>
					<b><fmt:formatDate value="${mDto.createDate}" pattern="yyyy-MM-dd"/></b>&nbsp;
					<span class="detailUpdatedAt">수정일 : </span>
					<b><fmt:formatDate value="${mDto.updateDate}" pattern="yyyy-MM-dd"/></b> 
				</div>
			</div>	
		</div>	
	<hr>
	
	<div class="text-center">
		<div class="mt-3">
	    	<img class="img-fluid" src="<%=NcpObjectStorageService.STORAGE_PHOTO_PATH%>${mDto.boardImage}" style="width: 40%">
		</div>
	    <div class="mt-3">
	        <img class="img-fluid" src="<%=NcpObjectStorageService.STORAGE_PHOTO_PATH%>${pDto.productImage1}"style="width: 40%">
	    </div>
	    <div class="mt-3">
	        <img class="img-fluid" src="<%=NcpObjectStorageService.STORAGE_PHOTO_PATH%>${pDto.productImage2}" style="width: 40%">
	    </div>
	</div>

	<div class="d-flex justify-content-center">
		<div class="cGreen fw_600 fs_18 mt-5 bg_red inset_shadow2 borderGreen br_5" style="width: 30%">&nbsp;거래 희망 가격 : ${pDto.productPrice}</div>
	</div>
	<div class="d-flex justify-content-center">
		<div class="cGreen fw_600 fs_18 mt-3 bg_red inset_shadow2 borderGreen br_5" style="width: 30%">&nbsp;거래 희망 장소 : ${pDto.productPlace}</div>
	</div>
	<div class="text-center">
		<pre class="m-0 py-3 fs_17">${pDto.productContent}</pre>
	</div>
	
		
	<div class="content-border mt-3 py-2">
			<div id="answercount">댓글 0</div>
			<div class="answerlist" style="margin-left:10px;">
				댓글목록 나올곳
			</div>
	
			<div class="answerform input-group">
				<input type="text" class="bg_red inset_shadow2 mt-2 br_5" style="border:0; width:93%" placeholder="댓글내용"
				id="answerMsg">
				<button type="button" class="btn-3d red ml-3" id="btnAnswerAdd" style="border-radius: 5px;">저장</button>
			</div>
	</div>
	<hr>
	<div class="text-center">
		<button type="button" class="btn-3d red mt-3"
			style="width:80px;" onclick="history.back()">목록으로
		</button>
	</div>				
</div>
</body>