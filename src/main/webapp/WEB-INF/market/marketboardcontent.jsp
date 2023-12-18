<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Jua&family=Lobster&family=Nanum+Pen+Script&family=Permanent+Marker&family=Single+Day&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<style>
   body * {
       font-family: 'Jua';
   } 
</style>
<!-- <script type="text/javascript">
/* (134)content.jsp의 js 파트에 $function안에 */
$(function(){
	//1)처음 로딩시 댓글 출력
	list();
	//2)댓글 카메라 클릭시 파일 업로드 버튼 실행
	$(".uploadcamera").click(function(){
		//1.카메라를 클릭 하면 안보이게 해놨던 type="file"실행
		$("#upload").trigger("click");
	});
	
	//3)사진업로드 버튼 체인지시 반응성 생성 (댓글사진 업로드)
	$("#upload").change(function(){		
		//1.formData만들기
		let formData=new FormData();
		//2.formData에 첫번째로 나온 이미지를 붙임
		formData.append("upload",$("#upload")[0].files[0]);
		//3.ajax방식으로 post형식으로 json데이타를 /answer/upload 로 전송
		//폼데이타이므로 processData:false,contentType:false가필요하다 
	
		$.ajax({
			type:"post",
			dataType:"json",
			url:"../answer/upload",
			data:formData,
			processData:false,
			contentType:false,
			success:function(res){
		//4.성공 시 업로드후에 반환받은 파일명을 댓글의 이미지에 넣어준다
			   $("img.answerphoto").attr("src","../res/upload/"+res.photoname);
		    }
		});		
	});
	
	//4)댓글 추가 이벤트
	$("#btnansweradd").click(function(){
		//1.msg에 댓글 내용 저장
		let msg=$("#answermsg").val();
		//2.num에 dto.num저장
		let num=${dto.num};
		//3.댓글 내용이 없으면 입력해달라고 경고창 출력
		if(msg.length==0){
			alert("댓글 내용을 입력해주세요");
			return;
		}
		//4.ajax혀태로 post방식으로 text를 전송하며 /answer/insert를 실행 시킨다.
		//이때 데이타는 json형태로 data:{"num":num,"msg":msg} 전송
		
		$.ajax({
			type:"post",
			dataType:"text",
			url:"../answer/insert",
			data:{"num":num,"msg":msg},
			success:function(res){
				//ㄱ.성공 시 db insert 성공후 댓글 목록 다시 출력
				list();
				//ㄴ.입력창 초기화
				$("#answermsg").val("");
				//ㄷ.댓글 사진 초기화
				$("img.answerphoto").attr("src","../res/photo/noimage.png");
		    }
		});
	});
	
	//5)댓글 삭제 이벤트
	$(document).on("click",".ansdel",function(){
		//1.ansidx변수에 입력받은 ansidx의 값 저장 
		let ansidx=$(this).attr("ansidx");
		//2.ajax의 get방식으로 text를 /answer/delete에 json형태로 보내고 성공시 삭제후 목록 다시 출력
		$.ajax({
			type:"get",
			dataType:"text",
			url:"../answer/delete",
			data:{"ansidx":ansidx},
			success:function(res){
				list();//삭제 후 목록 다시 출력
			}
		});
	});
});//close function
	//6)댓글 리스트 출력하는 list()생성
function list()
{
		//1.num에 입력받은 num값 저장
	let num=${dto.num};
		//2.loginok,loginid에 각각 정보 저장
	let loginok='${sessionScope.loginok}'; 
	let loginid='${sessionScope.myid}';
	console.log(loginok+","+loginid);
		//3.ajax방식으로 댓글의 갯수,모든 댓글 출력 
				//ㄱ.ajax의 get방식으로 json형태의 데이터를 /answer/list에 전송 데이터는 num만 json
				//형태로 보낼것임
	$.ajax({
		type:"get",
		dataType:"json",
		url:"../answer/list",
		data:{"num":num},
				
		success:function(res){
				//ㄴ.성공시 댓글 갯수 출력 
			$("#answercount").text("댓글 "+res.length);
				//ㄷ.빈 변수 s 생성
			let s="";
				//ㄹ.반복문으로 모든 댓글 출력
				//ㅁ.ansname,ansid출력
				//ㅂ.만약 입력산 사진이 있다면 이미지태그 에 추가
				//ㅅ.댓글과 등록날짜를 출력
				//ㅇ.로그인 된 상태이고, 댓글 단 사람과 로그인한 사람이 같은 상황에만 삭제버튼 추가
				//ㅈ.다음 댓글에 띄어쓰는 br태그 추가
			$.each(res,function(idx,item){
				s+=
					`
					\${item.ansname}(\${item.ansid})<br>
					`;
				if(item.ansphoto!=null){
					s+=
						`
						<img src="../res/upload/\${item.ansphoto}" width=60 height=60 border=1 hspace=20>
						`;
				}
				
				s+=					
					`<span style="margin-left:20px;">\${item.ansmsg}</span>
					&nbsp;
					<span style="color:gray;font-size:0.9em;">\${item.writeday}</span>					
					`;
				if(loginok!='' && item.ansid==loginid){
					s+=
						`<i class="bi bi-trash ansdel" ansidx="\${item.ansidx}"></i>`;
				}
				
				s+="<br>";
			});
		//4.밑에 만들어늫은 div(class=answerlist)에 s 저장
			$("div.answerlist").html(s);
	    }
	});
}
</script> -->
</head>
<body>

<div>
<%-- <!-- 1)제목 출력 -->
	<h3><b>${mdto.boardTitle}</b></h3>
	<br>
<!-- 2)프로필 이미지 원형으로 출력 -->	
	<h3></h3><br>
<!-- 3)작성자 -->		
	<b></b> <br>
<!-- 4)조회수 출력 -->	
	<span class="day">
		<fmt:formatDate value="${mdto.createDate}" pattern="yyyy-MM-dd HH:mm"/>
		&nbsp;&nbsp;
		조회 ${mdto.boardViewCount}
	</span>
	<br><br>
<!-- 5)내용 작성(글,사진) -->	
	<pre style="font-size:17px;">${mdto.content}</pre>
	<br><br> --%>
	

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
	
		<!-- 로그인한 사람이 쓴 글에만 수정 삭제 버튼이 보이도록 한다 -->
		<c:if test="${sessionScope.loginok!=null and dto.myid==sessionScope.myid}">
			<button type="button" class="btn btn-outline-secondary btn-sm"
			style="width:80px;"
			onclick="location.href='./updateform?num=${dto.num}&currentPage=${currentPage}'">수정</button>
			
			<button type="button" class="btn btn-outline-secondary btn-sm"
			style="width:80px;"
			onclick="location.href='./delete?num=${dto.num}&currentPage=${currentPage}'">삭제</button>
		</c:if>
	</div> 
	<div id="answerend"></div>
	
</div>
</body>
</html>