<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript">



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
<script>
        document.getElementById('btnansweradd').addEventListener('click', function() {
            // 입력된 댓글 내용 가져오기
            var comment = document.getElementById('answermsg').value;
            
            // 새로운 div 엘리먼트 생성하여 댓글 출력
            var newComment = document.createElement('div');
            newComment.textContent = comment;
            
            // 댓글 목록에 새 댓글 추가
            document.querySelector('.answerlist').appendChild(newComment);
            
            // 댓글 카운트 업데이트
            var commentCount = document.querySelectorAll('.answerlist div').length;
            document.getElementById('answercount').innerText = '댓글 ' + commentCount;
        });
    </script>
</body>