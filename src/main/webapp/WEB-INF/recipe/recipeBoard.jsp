<%@ page import="naver.storage.NcpObjectStorageService" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
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
	   border: 3px solid black;
	   border-radius: 20px;
	   float: left;
	   margin-right: 30px;
	   margin-bottom: 20px;
	}
	
	div.box figure img {
	   width: 160px;
	   height: 160px;
	   margin-top: 5px;
	}
	
	.recipe_img {
	   width: 160px;
	   height: 160px;
	   margin-top: 5px;
	}
	
	.recipe_writer, .recipe_createdAt {
	   color: gray;
	   font-size: 0.8em;
	   margin-right: 20px;
	}
	
	div.content {
	   display: none;
	}
	
	
	.recipetotalcount {
		display: flex;
	}
	
	#InputButton {
		margin-top: 10px;
		margin-left: 20px;
		background-color: #11B560;
		border: 1px solid #11B560;
		height: 40px;
	}
</style>

<script type="text/javascript">
   let searchword="";
   
   $(function(){
      grid(); //처음 시작시 그리드모양 이미지형태로 출력하기
      
      $("#btnsearch").click(function() {
       //  alert(1);
       searchword=$("#word").val();
       grid();
       
       });
      
      $(".simplegrid").css("color","green");
      
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

   function showTotalCount(totalCount) {
	    let t = `<h4>현재 총<b style="color: green; font-size: 40px;">`;
	    t += totalCount;
	    t += `</b>개의 레시피가 있습니다.</h4>`;
	    
	    let InputButton = `<button type="button" class="btn btn-primary" id="InputButton">글쓰기</button>`;
	    t += InputButton;

	    $(".recipetotalcount").html(t);
	    
	 	// 글쓰기 버튼에 클릭 이벤트 추가
	    $("#InputButton").click(function() {
	        // 글쓰기 버튼 클릭 시 recipeBoardInput.jsp로 이동
	        window.location.href = 'recipeBoardInput';
	    });
	}
   
   function grid()
   {
      $.ajax({
         type:"get",
         dataType:"json",
         url:"./view",
         data:{"word":searchword},
         success:function(res){
            let datas=res.data;
            let totalCount=res.totalCount;
            console.log(totalCount);
            showTotalCount(totalCount);
           
            let s="";
            
            $.each(datas,function(idx,item){
      
               s+=
                  `
                  <div class="box" style="background-color:#FFFFF0;">
                     <figure>
                        <a href="./board/\${item.recipeIdx}">
                           <img src="<%=NcpObjectStorageService.STORAGE_PHOTO_PATH%>\${item.recipePhoto}"><br>
                        </a>
                        <figcaption>
                           <b>\${item.recipeTitle}</b><br>
                           <span style="color:gray;">\${item.recipeName}</span>
                           <br>
                           <span class="recipe_writer">작성자<br>
                              &nbsp;&nbsp;&nbsp;
                           조회수\${item.recipeViewCount}</span>
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
         data:{"word":searchword},
         success:function(res){
        	let datas=res.data;
            let totalCount=res.totalCount;
            console.log(totalCount);
            showTotalCount(totalCount);
            
            let s="";
            s+=
            `
            <table class="table table-bordered" style="450px">
            `;
            $.each(datas,function(idx,item){
               var recipeName=item.recipeName;
               console.log(recipeName);
               s+=
               `
               <tr>
                  <td>
                  <a href="./board/\${item.recipeIdx}">
                  <img class="recipe_img"src="<%=NcpObjectStorageService.STORAGE_PHOTO_PATH%>\${item.recipePhoto}">
                  </a>
                     <h5><b class="subject" style="cursor:pointer">\${item.recipeTitle}</b></h5>
                     <div style="margin-left:20px;color:black;" class="content">
                        <pre>\${item.recipeContent}</pre>
                        </div> 
                        <div>
                           <span>${item.recipeName}</span>&nbsp;&nbsp;
                           <span class="recipe_createdAt">작성일<br>
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

<div style="margin: 30px;">
   <div class="input-group" style="width: 400px;">
      <h5>레시피 검색</h5>
      <input type="text" class="form-control"
         style="width: 150px; margin-left: 50px;" autofocus
         placeholder="검색레시피입력" id="word">
      <button type="button" class="btn btn-primary" id="btnsearch"
         style="margin-left: 10px;">검색</button>
   </div>
   <div style="margin: 20px; font-size: 22px;" class="result"></div>
</div>
<div class="simpleicon">
   <i class="bi bi-grid simplegrid"></i> <i
      class="bi bi-list-ul simplelist"></i>
</div>
<div class="recipetotalcount">
 레시피
 <button type="button" class="btn btn-primary" id="InputButton">글쓰기</button>
</div>
<div class="list">123</div>