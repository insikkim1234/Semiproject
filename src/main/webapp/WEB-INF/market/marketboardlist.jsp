<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
body * {
	font-family: 'Jua';
}

div.simpleicon {
	margin: 30px 100px;
}

div.simpleicon * {
	cursor: pointer;
	margin-right: 30px;
	font-size: 30px;
}

div.list {
	margin: 30px 50px;
}

div.box {
	width: 200px;
	height: 270px;
	text-align: center;
	border: 5px solid gray;
	border-radius: 20px;
	float: left;
	margin-right: 30px;
	margin-bottom: 20px;
}

div.box figure img {
	width: 160px;
	height: 160px;
	border-radius: 30px;
	margin-top: 5px;
}

.day {
	color: gray;
	font-size: 0.8em;
	margin-right: 20px;
}

div.content {
	display: none;
}

.mytooltip {
	position: absolute;
	color: black;
	width: auto;
	background-color: #f90;
	border: 2px solid white;
	padding: 10px;
	font-size: 14px;
	border-radius: 30px;
	/*opacity:0.8;*/
	display: none;
}

.mytooltip img {
	border-radius: 30px;
}
</style>
<script type="text/javascript">
	$(function(){
		//처음 시작시 그리드모양 이미지형태로 출력하기
		grid();
		
		//list();
		
		$(".simplelist").css("color","red");
		
		$(".simplegrid").click(function(){
			$(this).css("color","red");
			$(".simplelist").css("color","black");
			grid();
		});
		
		$(".simplelist").click(function(){
			$(this).css("color","red");
			$(".simplegrid").css("color","black");
			list();
		});
		
		//list 의 제목 클릭시 해당 내용만 나오게 하기
		$(document).on("click","b.subject",function(){
			$("div.content").hide();
			
			$(this).parent().next().slideDown('slow');
		});
		//사진에 마우스를 올리면 사진이 크게 보이게 하기				
		$(document).on("mousemove","div.box img",function(e){
			$("div.mytooltip").css({
					"left":e.pageX+"px",
					"top":e.pageY+"px"
			});
		});
		$(document).on("mouseover","div.box img",function(e){
			let imgSrc=$(this).attr("src");
			$("div.mytooltip").html(`<img src="${imgSrc}" style="max-width:400px">`);
			$("div.mytooltip").fadeIn('fast');
		});
		$(document).on("mouseout","div.box img",function(e){
			$("div.mytooltip").fadeOut('fast');
		});
	});
	
	function grid()
	{
		$.ajax({
			type:"get",
			dataType:"json",
			url:"simpletojson.jsp",
			success:function(res){
				let s="";
				$.each(res,function(idx,item){
					if(item.photo!='no'){
						s+=
							`
							<div class="box" style="background-color:#fcc;">
								<figure>
									<img src="../save/${item.photo}">
									<figcaption>
										<b>${item.subject}</b><br>
										<span style="color:gray;">${item.writer}</span>
										<br>
										<span class="day">${item.writeday}
											&nbsp;&nbsp;&nbsp;
										조회 ${item.readcount}</span>
									</figcaption>
								</figure>
							</div>
							`;
					}
				});
				$(".list").html(s);
		    },
			statusCode:{
				404:function(){
					alert("json 파일을 찾을수 없어요!");
				},
				500:function(){
				   alert("서버 오류..코드를 다시한버너 보세요");
				}
			}
		});
	}
	
	function list()
	{
		$.ajax({
			type:"get",
			dataType:"json",
			url:"simpletojson.jsp",
			success:function(res){
				let s="";
				s+=				
				`
				<table class="table table-bordered" style="450px">									
				`;				
				$.each(res,function(idx,item){
					s+=
					`
					<tr>
						<td>
							<h5><b class="subject" style="cursor:pointer">${item.subject}</b></h5>
							<div style="margin-left:20px;color:gray;" class="content">
								<pre>${item.content}</pre>
							</div>
							<div>
								<span>${item.writer}</span>&nbsp;&nbsp;
								<span class="day">${item.writeday}
									&nbsp;&nbsp;
									조회 ${item.readcount}
								</span>
							</div>
						</td>
					</tr>
					`;
				});
				s+="</table>";
				$(".list").html(s);
				//첫번째 content 만 일단 보이도록	
				$("div.content").eq(0).css("display","block");
		    },
			statusCode:{
				404:function(){
					alert("json 파일을 찾을수 없어요!");
				},
				500:function(){
				   alert("서버 오류..코드를 다시한버너 보세요");
				}
			}
		});
	}
</script>
</head>
<body>
	<div>
		<div class="mlist_head fs_20">
			총 ${totalCount}개의 소중한 물건들이 있습니다


			<button type="button" class="btn btn-sm btn_product"
				onclick="location.href='./mboard/form'">나의 물품등록</button>

		</div>
		
		
		<!-- !!!!!!!!!!!!!!!!!!!!!!!! -->
		<div class="simpleicon">
			<i class="bi bi-grid simplegrid"></i> <i
				class="bi bi-card-list simplelist"></i>
		</div>

		<div class="list">123</div>
		<div class="mytooltip">
			Java<br> HTML5<br> SpringBoot<br> React<br>
			jQuery
		</div>

        <!--!!!!!!!!!!!!!!!!!!!!!!!!!!!  -->
		<table class="table table-bordered">
			<thead>
				<tr>
					<th class="cGreen" width="50">번호</th>
					<th width="350">제목</th>
					<th width="80">작성자</th>
					<th width="100">작성일</th>
					<th width="60">조회</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="dto" items="${list}">
					<tr>
						<td>${no} <c:set var="no" value="${no-1}" />
						</td>
						<td>
							<!-- 제목 --> <!-- 답글 레벨 1당 두칸 띄우기 --> <c:forEach begin="1"
								end="${dto.relevel}">
		   					&nbsp;&nbsp;
		   			</c:forEach> <!-- relevel 이 0 이상인경우 답글 아이콘 --> <c:if test="${dto.relevel>0}">
								<img src="../res/photo/re.png">
							</c:if> <!-- 제목 표시 --> <a
							href="./content?num=${dto.num}&currentPage=${currentPage}">
								${dto.subject} <c:if test="${dto.photocount==1}">
									<i class="bi bi-image" style="color: gray;"></i>
								</c:if> <c:if test="${dto.photocount>1}">
									<i class="bi bi-images" style="color: gray;"></i>
								</c:if>
						</a> <!-- 댓글 갯수 표시 --> <c:if test="${dto.acount>0}">
								<a
									href="./content?num=${dto.num}&currentPage=${currentPage}#answerend">
									<span style="color: red;">(${dto.acount})</span>
								</a>
							</c:if>
						</td>
						<td>${dto.writer}</td>
						<td><fmt:formatDate value="${dto.writeday}"
								pattern="yyyy.MM.dd." /></td>
						<td>${dto.readcount}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div style="text-align: center;">
			<!-- 이전 -->
			<c:if test="${startPage>1}">
				<a href="./list?currentPage=${startPage-1}">이전</a>
			</c:if>
			&nbsp;
			<c:forEach var="pno" begin="${startPage}" end="${endPage}">
				<a href="./list?currentPage=${pno}" style="cursor: pointer;"> <c:if
						test="${pno==currentPage}">
						<span style="color: red;">${pno}</span>
					</c:if> <c:if test="${pno!=currentPage}">
						<span style="color: black;">${pno}</span>
					</c:if>
				</a>
			&nbsp;
		</c:forEach>
			<!-- 다음 -->
			<c:if test="${endPage<totalPage}">
				<a href="./list?currentPage=${endPage+1}">다음</a>
			</c:if>
		</div>
	</div>
</body>
</html>

