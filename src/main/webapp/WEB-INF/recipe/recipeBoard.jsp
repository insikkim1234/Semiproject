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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<style>
   body * {
        font-family: 'Jua';
    }
    
    div.simpleicon{
       margin: 30px 100px;
    }
    
    div.simpleicon *{
       cursor: pointer;
       margin-right:30px;
       font-size:30px;
    }
    
    div.list{
       margin: 30px 50px;
    }
    
    div.box{
       width:200px;
       height: 270px;
       text-align: center;
       border:3px solid black;
       border-radius: 20px;
       float: left;
       margin-right: 30px;
       margin-bottom: 20px;
    }
    
    div.box figure img{
       width:160px;
       height: 160px;
       border-radius: 30px;
       margin-top:5px;
    }
    
    .day{
       color:gray;
       font-size:0.8em;
       margin-right:20px;
    }
    
    div.content{
      display: none;   
   } 
</style>

<script type="text/javascript">
	$(function(){
		//처음 시작시 그리드모양 이미지형태로 출력하기
		grid();
		
		list();
		
		$(".simplelist").css("color","green");
		
		$(".simplegrid").click(function(){
			$(this).css("color","green");
			$(".simplelist").css("color","black");
			grid();
		});
		
		$(".simplelist").click(function(){
			$(this).css("color","green");
			$(".simplegrid").css("color","black");
			list();

		});
		
	});
	
	function grid()
	{
		$.ajax({
			type:"get",
			dataType:"json",
			url:"./view",
			success:function(res){
				let s="";
				$.each(res,function(idx,item){
					var sRecipeName=item.srecipeName;
					console.log(sRecipeName);
					s+=
						`
						<div class="box" style="background-color:#FFFFF0;">
							<figure>
								<img src="">
								<figcaption>
									<b>\${item.srecipeTitle}</b><br>
									<span style="color:gray;">\${item.srecipeName}</span>
									<br>
									<span class="day">작성자
										&nbsp;&nbsp;&nbsp;
									조회수\${item.nrecipeViewCount}</span>
								</figcaption>
							</figure>
						</div>
						`;
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
			url:"./view",
			success:function(res){
				let s="";
				s+=
				`
				<table class="table table-bordered" style="450px">
				`;
				$.each(res,function(idx,item){
					var sRecipeName=item.srecipeName;
					console.log(sRecipeName);
					s+=
					`
					<tr>
						<td>
							<h5><b class="subject" style="cursor:pointer">\${item.srecipeTitle}</b></h5>
							<div style="margin-left:20px;color:black;" class="content">
								<pre>\${item.srecipeContent}</pre>
								</div>
								<div>
									<span>${item.srecipeName}</span>&nbsp;&nbsp;
									<span class="day">작성일
										&nbsp;&nbsp;
										조회수
									</span>
								</div>
							</td>
						</tr>
					`;
				});
				s+="</table>";
				$(".list").html(s);
				//첫번째 content만 일단 보이도록
				$("div.content").eq(0).css("display","block");
			}
		});
		}
</script>
</head>
<body>
   <div class="simpleicon">
      <i class="bi bi-grid simplegrid"></i>
      <i class="bi bi-card-list simplelist"></i>
   </div>
   
   <div class="list">
     123
   </div>
</body>
</html>