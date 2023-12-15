<%@ page import="naver.storage.NcpObjectStorageService" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
   
   /* grid css */
   div.box {
      width: 270px;
      height: 270px;
      text-align: center;
      border: 2px solid #11B560;
      border-radius: 20px;
      float: left;
      margin-right: 30px;
      margin-bottom: 20px;
   }
   
   div.box figure img {
      width: 180px;
      height: 180px;
      margin-top: 5px;
   }
   
   /* list css */
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
       let t = `총&nbsp;`;
       t += totalCount;
       t += `개의 레시피가 모이는중..`;

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
                           <span class="day">
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

<div class="mw_1000">
   <div class="fs_40 fw_600 cGreen text_left mt-5">뭐 먹을까?</div>
   <form class="d-flex m-0 justify-content-end mt-3">
   <div class="simpleicon" style="margin-right: 10px;">
            <i class="bi bi-grid simplegrid"></i>
            <span style="margin-right: 5px;"></span> 
            <i class="bi bi-list-ul simplelist"></i>
    </div>
      <input class="form-control me-2" type="text" id="word" placeholder="검색할 레시피 입력" style="width: 200px; border:2px solid #11B560; height: 38px;">
      <button type="button" class="btn btn_green2 fw_600"  id="btnsearch" style="height: 38px;">검색</button>
   </form>
   <div class="fs_17 bg_green row mt-3 mw_1000">
      <div class="col py-3 fw_600">
      	<div class="recipetotalcount">
		   레시피
		</div>
      </div>
      <div class="col text-end">
            <button type="button" class="btn btn_green fw_600 mt-2" id="InputButton">글쓰기</button>
        </div>
   </div>


<div class="list">123</div>