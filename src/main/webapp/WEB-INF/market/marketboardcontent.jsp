<%@page import="naver.storage.NcpObjectStorageService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<input type="hidden" id="boardSeq" value="${mDto.boardSeq}">
<input type="hidden" id="userSeq" value="${mDto.userSeq}">
<input type="hidden" id="productPrice" value="${pDto.productPrice}">
<input type="hidden" id="createDate" value="${mDto.createDate}">
<script type="text/javascript">
$(function() {
	list();
    $('#btnansweradd').click(function() {
    	var userSeq=1;
        var boardSeq = $('#boardSeq').val();
        var commentContent = $('#answermsg').val();
        
        if (commentContent.trim() === "") {
        	return;
        }
		
        $.ajax({
            url: './insertAnswer',
            method: 'POST',
            contentType: 'application/x-www-form-urlencoded',
            data: {
                userSeq: userSeq,
            	boardSeq: boardSeq,
                msg: commentContent
            },
            success: function(response) {
                console.log('댓글이 성공적으로 저장되었습니다.');
                console.log(response.status);
                // 성공적으로 저장된 경우 추가 작업 수행
                // 예를 들어, 화면에 새로운 댓글을 추가하는 등의 작업 수행 가능
                list();
                
            },
            error: function(xhr, status, error) {
                console.error('댓글 저장에 실패했습니다.');
                console.error('에러 상태 코드:', status);
                console.error('에러 메시지:', error);
            }
        });
    });
    $(document).on("click",".ansdel",function(){
    	let commentSeq=$(this).attr("commentSeq");
    	
    	$.ajax({
    		type:"get",
    		dataType:"text",
    		url:"./delete",
    		data:{"commentSeq":commentSeq},
    		success:function(res){
    			list();
    		}
    		
    	});
    });
});


	
function list()
{
	let boardSeq=${mDto.boardSeq};
	
	$.ajax({
		type:"get",
		dataType:"json",
		url:"./list",
		data:{"boardSeq":boardSeq},
				
		success:function(res){
			let length=res.length;
			let datas=res.data;
			console.log(length);
			
			$("#answercount").text("댓글 "+length);
				
			let s="";
				
			$.each(datas,function(idx,item){
				
				s+=					
					`
					
					
					\${item.commentUserName}(\${item.commentUserEmail})<br>
					<span style="margin-left:20px;">\${item.commentContent}</span>
					&nbsp;
					
					<span style="color:gray;font-size:0.9em;">\${item.createDate}</span>
					
					<i class="bi bi-trash ansdel" commentSeq="\${item.commentSeq}"></i>
					
					`;
				
				
				s+="<br>";
				s+="<hr>";
			});
		
			$("div.answerlist").html(s);
	    }
	});
}




</script>
</head>
<body>
<div class="mw_1200">
	<div class="fw_500 cBlack mt-5">
		<a href="${pageContext.request.contextPath}">HOME</a><span class="fs_18 mx-1">></span>
		<a href="${pageContext.request.contextPath}/mboard">벼룩시장</a><span class="fs_18 mx-1">></span>
		<a href="${pageContext.request.contextPath}/mboard/content">상세 페이지</a>
	</div>
	<div class="wrapper2 mt-3">
		<div class="focus2">
		    중고마켓
		</div>
		<div class="mask2">
		   <div class="text2">중고마켓</div>
  		</div>
	</div>
	<div class="r-detail"></div>
		<div class="div_detail mt-3" style="background: #ecd26017;">
			<div class="div_detailItem">
				<div class="rtitle_border">
					<div class="fs_28 fw_600 cBlack text-center">
							<div class="rgyPostIt2 mr-3">중고물품 #${mDto.boardSeq}</div>${mDto.boardTitle}
					</div>
					<div class="text-end mt-2">
						<span class="detailWriter"><i class="bi bi-person-fill fs_19"></i></span>
						<b>${mDto.userName}</b>&nbsp;
						<span><i class="bi bi-three-dots-vertical"></i></span>&nbsp;
						<span class="detailViewCount"><i class="bi bi-eye-fill fs_19"></i></span>
						<b>${mDto.boardViewCount}</b>
					</div>
					
					
					
					<div class="col text-end my-1">
						<span class="detailCreatedAt">작성일 : </span>
						<b><fmt:formatDate value="${mDto.createDate}" pattern="yyyy-MM-dd"/></b>&nbsp;
						<span class="detailUpdatedAt">수정일 : </span>
						<b><fmt:formatDate value="${mDto.updateDate}" pattern="yyyy-MM-dd"/></b> 
					</div>
					
	</div>	
	<hr>
<div class="text-center">
	<b>대표 사진</b>
    <img class="detail_img" src="<%=NcpObjectStorageService.STORAGE_PHOTO_PATH%>${mDto.boardImage}" width="200" height="200">
	&nbsp;
	
</div>
<br><br>
<div class="text-center">
    <div class="d-inline-block">
    	<b>물품 사진1</b>
        <img class="detail_img1" src="<%=NcpObjectStorageService.STORAGE_PHOTO_PATH%>${pDto.productImage1}" width="200" height="200">
    	&nbsp;
		
    </div>
    <div class="d-inline-block">
    	<b>물품 사진2</b>
        <img class="detail_img2" src="<%=NcpObjectStorageService.STORAGE_PHOTO_PATH%>${pDto.productImage2}" width="200" height="200">
    	  &nbsp;
		
    </div>
</div>
	<div class="detailContent">
				<div class="cGreen fw_600 fs_24 mt-2 nanumfont">가격: ${pDto.productPrice}</div>
				<div class="cGreen fw_600 fs_24 mt-2 nanumfont">교환 장소 :${pDto.productPlace}</div>
				<pre class="m-0 py-3 fs_16">${pDto.productContent}</pre>
	</div>
	
		
	<div class="content-border mt-3 py-2">
			<div id="answercount">댓글 0</div>
			<div class="answerlist" style="margin-left:10px;">
				댓글목록 나올곳
			</div>
	
			<div class="answerform input-group">
				<input type="text" class="form-control" style="width:300px;" placeholder="댓글내용"
				id="answermsg">
				<button type="button" class="btn-sm btn btn-outline-success" id="btnansweradd">저장</button>	
			</div>
			
			<button type="button" class="btn btn-outline-secondary btn-sm"
				style="width:80px;"
				onclick="history.back()">목록</button>
				
			<button type="button" class="btn btn-outline-secondary btn-sm"
				style="width:80px;"
				onclick="location.href='./updateform?boardSeq=${mDto.boardSeq}'">수정</button>	
	
	</div>

				<button type="button" class="btn btn-outline-secondary btn-sm"
				style="width: 80px;"
				onclick="location.href='./deletecontent?boardSeq=${mDto.boardSeq}&currentPage=${currentPage}'">삭제</button>
			</div>
		</div>
	</div>
</div>
</body>