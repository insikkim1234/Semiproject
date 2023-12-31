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
   
   
   div.box {
      width: 270px;
      height: 270px;
      text-align: center;
      border: 2px solid #11B560;
      border-radius: 20px;
      float: left;
      margin-right: 30px;
      margin-top: 30px;
   }
   
   div.box figure img {
      width: 180px;
      height: 180px;
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
   
   .user_img {
    width: 28px;
    height: 28px;
    border-radius: 50%;
    margin: 0 4px -2px 0;
    vertical-align: text-bottom;
   }
   
   .bg-body-tertiary {
    --bs-bg-opacity: 1;
    
   }
   
   @media (min-width: 576px)
   .container, .container-sm {
       max-width: 540px;
   }
   
   .text-body-secondary {
    --bs-text-opacity: 1;
   
   }
   .custom-img {
        height: 250px; /* 원하는 높이(px 등)로 조정 */
    }
    
   
    .pageWrap {
    display: flex;
    justify-content: center; /* 수평 가운데 정렬 */
    align-items: center; /* 수직 가운데 정렬 */
    flex-wrap: wrap;
    gap: 10px;
    color: #c12c2f;
    margin-bottom: 20px; */ /* 필요한 경우 여유 공간 조정 */
    /* 추가적인 스타일을 필요에 따라 적용하세요 */
   }

   .pageNation {
    display: inline-block;
    margin: 5px;
    color: #c12c2f;
    /* 추가적인 스타일을 필요에 따라 적용하세요 */
   }
   
   .card-text {
 	height: 35px;
   }
   
   .d-flex justify-content-between align-items-center {
   height: 10px;
   }
   
   .pageNumber {
	font-size: 22px;
	color: #c12c2f;
	margin-right: 5px; /* 페이지 번호 사이의 간격 조정 */
	
   
	}
   
   .col-lg-4 col-md-6 {
   margin-bottom: 40px; /* 원하는 간격으로 조정해보세요 */
   }
   
   .custom-card-margin {
  margin-bottom: 20px; /* 원하는 간격으로 조정 */
   }
  
  .btn-3d {
	position: relative;
	display: inline-block;
	font-size: 16px;
	color: #c12c2f;
	border-radius: 6px;
	text-align: center;
	transition: top .01s linear;
	text-shadow: 0 1px 0 rgba(0,0,0,0.15);
	top: -9px;
    padding: 0 10px;
    border: 0;
    margin-right: 10px; /* 버튼 사이의 간격 조정 */
}
.btn-3d.red:hover {
	background-color: #ECD260;
	color: #c12c2f;
}

.btn-3d:active {
	top: 0px;
}

.pageNation>.pageNumber:hover{
	color: #000;
}
   
</style>

<script type="text/javascript">

function successCallback(res) {
    // Ajax 성공 시 반환된 pageInfo 객체를 받아온다고 가정
    let pageInfo = res.pageInfo;
    updatePageNavigation(pageInfo);
}
      
function updatePageNavigation(pageInfo) {
    let pageWrap = document.querySelector('.pageWrap');
    let paginationHTML = `<div class="pageNation">`;

    if (pageInfo.currentPage > 1) {
        paginationHTML += `<a href="/semi/recipe/board?page=1" class="btn-3d red">처음</a>`;
    }

    if (pageInfo.currentPage > 1) {
        paginationHTML += `<a href="/semi/recipe/board?page=\${pageInfo.currentPage - 1}" class="btn-3d red">이전</a>`;
    }

    for (let page = pageInfo.startNav; page <= pageInfo.endNav; page++) {
        paginationHTML += `<a href="/semi/recipe/board?page=\${page}" class="pageNumber">\${page}</a>`;
    }

    if (pageInfo.currentPage < pageInfo.maxPage) {
        paginationHTML += `<a href="/semi/recipe/board?page=\${pageInfo.currentPage + 1}" class="btn-3d red">다음</a>`;
    }

    if (pageInfo.currentPage < pageInfo.maxPage) {
        paginationHTML += `<a href="/semi/recipe/board?page=\${pageInfo.maxPage}" class="btn-3d red">마지막</a>`;
    }

    paginationHTML += `</div>`;
    pageWrap.innerHTML = paginationHTML;
}


let searchword="";

let isGrid = true;
   
$(function(){
    grid(); //처음 시작시 그리드모양

    var word = document.getElementById("word");

    word.addEventListener("keyup", function (event) {
      if (event.keyCode === 13) {
          document.getElementById("btnsearch").click();
        }
    });

    $("#btnsearch").click(function() {
        searchword=$("#word").val();
        if (isGrid) {
            grid();
        }
        else {
            list();
        }
    });

    $(".simplegrid").css("color","#c12c2f");

    $(".simplegrid").click(function(){
     $(this).css("color","#c12c2f");
     $(".simplelist").css("color","black");
     grid();
    });

    $(".simplelist").click(function(){
     $(this).css("color","#c12c2f");
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
      isGrid = true;
      $.ajax({
         type:"get",
         dataType:"json",
         url:"./view",
         data:{"word":searchword,"page":${page}},
         success:function(res){
            let datas=res.data;
            let totalCount=res.totalCount;
            console.log(totalCount);
            showTotalCount(totalCount);

            let s = `<div class="album pt-5 pb-4" style="border-bottom: 3px solid #ecd260">
            <div class="container"><div class="row row-cols-3">`;
            
            $.each(datas,function(idx,item){
      
               s+=
                  `
                 <div class="col-lg-4 col-md-6">
                   <div class="card yellow_dashed custom-card-margin">
                     <a href="./board/\${item.recipeIdx}">
                       <img src="<%=NcpObjectStorageService.STORAGE_PHOTO_PATH%>\${item.recipePhoto}" class="card-img-top custom-img">
                     </a>
                     <div class="card-body">
                       <p class="card-text"><b>\${item.recipeTitle}</b></p>
                       <div class="d-flex justify-content-between align-items-center">
                      	 <div class="recipe-writer d-flex align-items-center">
                      	<img class="user_img" src="<%=NcpObjectStorageService.STORAGE_PROFILE_PHOTO_PATH%>\${item.recipeUserSeq}" onerror="this.src='<%=request.getContextPath()%>/resources/photo/tomato.png';">
                       		<p class="m-0 ms-0">\${item.recipeUserNickName}</p>
                  		 </div>
                  		<small class="text-body-secondary" style="padding-top: 15px; padding-bottom: 17px;">조회수&nbsp;\${item.recipeViewCount}</small>

                         </div>         
                          </div>
                        </div>
                      </div>
                      `;
                  });

                  s += `</div></div></div><br>`; // 그리드를 닫아주는 부분
                  $(".list").html(s);
                  
                  successCallback(res);
                  //updatePageNavigation(pageInfo);
               
                }
              });
            }
   
   function dateFormat(date) {
       let month = date.getMonth() + 1;
       let day = date.getDate();
       let hour = date.getHours();
       let minute = date.getMinutes();
       let second = date.getSeconds();

       month = month >= 10 ? month : '0' + month;
       day = day >= 10 ? day : '0' + day;
       hour = hour >= 10 ? hour : '0' + hour;
       minute = minute >= 10 ? minute : '0' + minute;
       second = second >= 10 ? second : '0' + second;

       return date.getFullYear() + '-' + month + '-' + day;
	}

   
   function list()
   {
      isGrid = false;
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
            <div class="blist">
            <table class="table">
               <thead>
            <tr class="text-center">
               <th width="10">번호</th>    
               <th width="40">사진</th>     
               <th width="250">제목</th>   
               <th width="90">작성자</th>   
               <th width="80">작성일</th>   
               <th width="50">조회</th>    
            </tr>
            </thead>
            <tbody class="text-center">
            
            `;
            $.each(datas,function(idx,item){
            	let createTime = new Date(item.recipeCreatedAt);
            	
            	createTime = dateFormat(createTime)
               s+=
               `
                     <tr><td>\${item.recipeIdx}</td>
                     <td>
                        <a href="./board/\${item.recipeIdx}">
                          <img class="recipe_img"src="<%=NcpObjectStorageService.STORAGE_PHOTO_PATH%>\${item.recipePhoto}">
                       </a>
                    </td>
                    <td>\${item.recipeTitle}</td>
                    <td>\${item.recipeUserNickName}</td>
                    <td>` +createTime + `</td> 
                    <td>\${item.recipeViewCount}</td></tr>
               `;
            });
            s+="</tbody></table></div></div>";
            $(".list").html(s);
            //첫번째 content만 일단 보이도록
            $("div.content").eq(0).css("display","block");
            
         }
      });
      }
</script>

<div class="mw_1000">
   <div class="fw_500 cBlack mt-5">
		<a href="${pageContext.request.contextPath}">HOME</a><span class="fs_18 mx-1">></span>
		<a href="${pageContext.request.contextPath}/recipe/board">레시피북</a>
   </div>
   <!-- <div class="fs_40 fw_600 cGreen text_left mt-3">뭐 먹을까?</div> -->
   <div class="wrapper mt-3">
		<div class="focus">
		    뭐 먹을까?
		</div>
		<div class="mask">
		   <div class="text">뭐 먹을까?</div>
  		</div>
	</div>
   <form action="#" class="d-flex m-0 justify-content-end mt-3 rboard_form">
   <div class="simpleicon" style="margin-right: 10px;">
            <i class="bi bi-grid simplegrid"></i>
            <span style="margin-right: 5px;"></span> 
            <i class="bi bi-list-ul simplelist"></i>
    </div>
      <input class="form-control me-2 mb-0" type="text" id="word" placeholder="검색할 레시피 입력" style="width: 200px; border:2px solid #c63702;">
      <button type="button" class="btn-3d red fw_600 ml-2"  id="btnsearch">검색</button>
   </form>
   <div class="fs_17 bg_green row mt-3 mw_1000 br_10">
      <div class="col py-3 fw_600">
         <div class="recipetotalcount">
         레시피
      </div>
      </div>
      <div class="col text-end recipe_insert">
            <button type="button" class="btn custom-btn btn-12 fw_600 mt-2" id="InputButton"><span>Click!</span><span>레시피 등록</span></button>
        </div>
   </div>


<div class="list"></div>
<div class="pageWrap"></div>
</div>