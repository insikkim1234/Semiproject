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
div.simpleicon {
      cursor: pointer;
      margin-right: 30px;
      font-size: 25px;
      height: 38px;
      margin-top: 3px;
      margin-left: -5px;
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
</style>
<script type="text/javascript">
	<%--$(function(){
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
		
	
	function grid()
	{
		$.ajax({
			type:"get",
			dataType:"json",
			url:"./",
			success:function(res){
				let s="";
				$.each(res,function(idx,item){
					var userName=item.userName;
		            console.log(item.recipePhoto);
						s+=
							`
							<div class="box" style="background-color:#fcc;">
								<figure>
								<img src="<%=NcpObjectStorageService.STORAGE_PHOTO_PATH%>\${item.boardImage}"><br>
									<figcaption>
										<b>${item.boardTitle}</b><br>
										<span style="color:gray;">${item.boardTitle}</span>
										<br>
										<span class="day">${item.userName}
											&nbsp;&nbsp;&nbsp;
										조회 ${item.boardViewCount}</span>
									</figcaption>
								</figure>
							</div>
							`;
					}
				});
				$(".list").html(s);
		    }
		});
	}
	
	function list()
	{
		$.ajax({
			type:"get",
			dataType:"json",
			url:"./",
			success:function(res){
				let s="";
				s+=				
				`
				<table class="table table-bordered" style="450px">									
				`;				
				$.each(res,function(idx,item){
					var userName=item.userName;
	                  console.log(userName);
					s+=
					`
					<tr>
						<td>
						<img src="<%=NcpObjectStorageService.STORAGE_PHOTO_PATH%>\${item.boardImage}"><br>
							<h5><b class="subject" style="cursor:pointer">${item.boardTitle}</b></h5>
							<div style="margin-left:20px;color:gray;" class="content1">
								<pre>${item.productContent}</pre>
							</div>
							<div>
								<span>${item.userName}</span>&nbsp;&nbsp;
								<span class="day">${item.createDate}
									&nbsp;&nbsp;
									조회 ${item.boardViewCount}
								</span>
							</div>
						</td>
					</tr>
					`;
				});
				s+="</table>";
				$(".list").html(s);
				//첫번째 content 만 일단 보이도록	
				$("div.content1").eq(0).css("display","block");
		    }
		});
	} --%>
</script>
</head>
<body>
	<div class="mw_1000">
		<div class="fs_40 fw_600 cGreen text_left mt-5">이거 어때?</div>
		<form class="d-flex m-0 justify-content-end mt-3">
			<div class="simpleicon" style="margin-right: 10px;">
	            <i class="bi bi-grid simplegrid"></i>
	            <span style="margin-right: 5px;"></span> 
	            <i class="bi bi-list-ul simplelist"></i>
	   		</div>
			<input class="form-control me-2" type="text" placeholder="검색어 입력" style="width: 200px; border:2px solid #11B560;">
			<button class="btn btn_green2 fw_600" type="button">검색</button>
		</form>
		<div class="fs_17 bg_green row mt-3 mw_1000">
			<div class="col py-3 fw_600">${totcalCnt}건의 거래 진행중..</div>
			<div class="col text-end">
				<button type="button" class="btn btn_green fw_600 mt-2"
					onclick="location.href='./mboard/form'">나의 물품등록</button>
			</div>
		</div>
		<div>
		
		
<<<<<<< HEAD
		<!-- !!!!!!!!!!!!!!!!!!!!!!!! -->
		<div class="simpleicon">
			<i class="bi bi-grid simplegrid"></i> <i
				class="bi bi-card-list simplelist"></i>
		</div>
		
		
		<table class="table table-striped" style="margin-top: 30px;width:600px;">
		<thead>
			<tr>
				<th width="50">번호</th>
				<th width="300">제목</th>
				<th width="80">작성자</th>
				<th width="100">작성일</th>
				<th width="50">조회</th>				
			</tr>
		</thead>
		<tbody>
		<c:forEach var="dto" items="${mdata}" >
			<tr>
				
				<td>
					${no}
					<c:set var="no" value="${no-1}"/>
				</td>
				<td>
				<a href="./content?num=${mdto.boardSeq}&currentPage=${currentPage}">
				${dto.boardTitle}
				</a>
				</td>
				<td></td>
				<td>${dto.createDate}</td>
				<td>${dto.boardViewCount}</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
        
=======
		<div class="blist">
			<table class="table">
				<thead>
					<tr class="text-center">
						<th width="50">번호</th>
						<th width="200">제목</th>
						<th width="80">작성자</th>
						<th width="100">작성일</th>
						<th width="50">조회</th>				
					</tr>
				</thead>
				<tbody>
				<c:forEach var="dto" items="${mdata}" >
					<tr class="text-center">
						
						<td>
							${no}
							<c:set var="no" value="${no-1}"/>
						</td>
						<td>
						
						${dto.boardTitle}
						
						</td>
						<td></td>
						<td>${dto.createDate}</td>
						<td>${dto.boardViewCount}</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
	    </div>    
>>>>>>> main
		
		<div style="text-align: center;">
			<!-- 이전 -->
			<c:if test="${startPage>1}">
				<a href="./mboard?currentPage=${startPage-1}">이전</a>
			</c:if>
			&nbsp;
			<c:forEach var="pno" begin="${startPage}" end="${endPage}">
				<a href="./mboard?currentPage=${pno}" style="cursor: pointer;"> <c:if
						test="${pno==currentPage}">
						<span style="color: black;">${pno}</span>
					</c:if> <c:if test="${pno!=currentPage}">
						<span style="color: #11b560;">${pno}</span>
					</c:if>
				</a>
			&nbsp;
		</c:forEach>
			<!-- 다음 -->
			<c:if test="${endPage<totalPage}">
				<a href="./mboard?currentPage=${endPage+1}">다음</a>
			</c:if>
		</div>
	</div>
	</div>
</body>
</html>

