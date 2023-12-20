<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<input type="hidden" id="boardSeq" value="${mDto.boardSeq}">
<input type="hidden" id="userSeq" value="${mDto.userSeq}">

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
                
            },
            error: function(xhr, status, error) {
                console.error('댓글 저장에 실패했습니다.');
                console.error('에러 상태 코드:', status);
                console.error('에러 메시지:', error);
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
					`<span style="margin-left:20px;">\${item.commentContent}</span>
					&nbsp;
					<span style="color:gray;font-size:0.9em;">\${item.createDate}</span>					
					`;
				
				
				s+="<br>";
			});
		
			$("div.answerlist").html(s);
	    }
	});
}

</script>
</head>
<body>
	<div class="fw_500 cBlack mt-5">
		<a href="${pageContext.request.contextPath}">HOME</a><span class="fs_18 mx-1">></span>
		<a href="${pageContext.request.contextPath}/mboard">벼룩시장</a><span class="fs_18 mx-1">></span>
		<a href="${pageContext.request.contextPath}/mboard/content">상세 페이지</a>
	</div>
<div>
	<div>
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
	
		
	</div> 
	<div id="answerend"></div>
	
</div>

</body>