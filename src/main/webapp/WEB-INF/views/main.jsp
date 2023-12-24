<%@page import="naver.storage.NcpObjectStorageService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="root" value="<%=request.getContextPath()%>"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Bootstrap Example</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
     <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<style>
        .swiper01 {
  position:relative;
  overflow:hidden;
}

img {
  width:550px;
}

.bar_wrap {
  position:absolute;
  bottom:20px;
  left:50%;
  transform:translateX(-50%);
  z-index:10;
}

.bar {
  width:400px;
  height:15px;
  background:#c12c2f;
  position:relative;
}

.back1 {
  display:inline-block;
  width:0%;
  height:100%;
  background:#ECD260;
  position:absolute;
  top:0;
  left:0;
}

.animation {
  animation:3s start linear;
}


@keyframes start {
  0% {
    width:0%
  }
  100% {
    width:100%
  }
}

.main_swiper>.swiper-wrapper{
	height: auto;
}

.main_swiper>.swiper-wrapper>.swiper-slide{
	padding-bottom: 7em;
}

div.main_effect {
 font-size:30px;
 font-family:'Signika', sans-serif;
 user-select:none;
 letter-spacing: 3;
 font-weight: 600;
}

div.main_effect span { display:inline-block; animation:float .2s ease-in-out infinite; }
 @keyframes float {
  0%,100%{ transform:none; }
  33%{ transform:translateY(-1px) rotate(-2deg); }
  66%{ transform:translateY(1px) rotate(2deg); }
}
div.main_effect:hover span { animation:bounce .6s; }
@keyframes bounce {
  0%,100%{ transform:translate(0); }
  25%{ transform:rotateX(20deg) translateY(2px) rotate(-3deg); }
  50%{ transform:translateY(-20px) rotate(3deg) scale(1.1);  }
}

div.main_effect span{ color:#212529; text-shadow:1px 1px #212529, 2px 2px #ffc107, 3px 3px #ffc107, 4px 4px #ffc107;}

div.main_effect span:nth-child(2){ animation-delay:.05s; }
div.main_effect span:nth-child(3){ animation-delay:.1s; }
div.main_effect span:nth-child(4){ animation-delay:.15s; }
div.main_effect span:nth-child(5){ animation-delay:.2s; }
div.main_effect span:nth-child(6){ animation-delay:.25s; }
div.main_effect span:nth-child(7){ animation-delay:.3s; }
div.main_effect span:nth-child(8){ animation-delay:.35s; }
div.main_effect span:nth-child(9){ animation-delay:.4s; }
div.main_effect span:nth-child(10){ animation-delay:.45s; }
div.main_effect span:nth-child(11){ animation-delay:.5s; }
div.main_effect span:nth-child(12){ animation-delay:.55s; }
div.main_effect span:nth-child(13){ animation-delay:.6s; }

.book {
  --color: #c12c2f;
  --duration: 6.8s;
  width: 32px;
  height: 12px;
  position: relative;
  margin: 32px 0 0 0;
  zoom: 1.5; }
  .book .bookinner {
    width: 32px;
    height: 12px;
    position: relative;
    transform-origin: 2px 2px;
    transform: rotateZ(-90deg);
    animation: book var(--duration) ease infinite; }
    .book .bookinner .bookleft,
    .book .bookinner .bookright {
      width: 60px;
      height: 4px;
      top: 0;
      border-radius: 2px;
      background: var(--color);
      position: absolute; }
      .book .bookinner .bookleft:before,
      .book .bookinner .bookright:before {
        content: '';
        width: 48px;
        height: 4px;
        border-radius: 2px;
        background: inherit;
        position: absolute;
        top: -10px;
        left: 6px; }
    .book .bookinner .bookleft {
      right: 28px;
      transform-origin: 58px 2px;
      transform: rotateZ(90deg);
      animation: left var(--duration) ease infinite; }
    .book .bookinner .bookright {
      left: 28px;
      transform-origin: 2px 2px;
      transform: rotateZ(-90deg);
      animation: right var(--duration) ease infinite; }
    .book .bookinner .bookmiddle {
      width: 32px;
      height: 12px;
      border: 4px solid var(--color);
      border-top: 0;
      border-radius: 0 0 9px 9px;
      transform: translateY(2px); }
  .book ul.book_ul {
    margin: 0;
    padding: 0;
    list-style: none;
    position: absolute;
    left: 50%;
    top: 0; }
    .book ul.book_ul li {
      height: 4px;
      border-radius: 2px;
      transform-origin: 100% 2px;
      width: 48px;
      right: 0;
      top: -10px;
      position: absolute;
      background: var(--color);
      transform: rotateZ(0deg) translateX(-18px);
      animation-duration: var(--duration);
      animation-timing-function: ease;
      animation-iteration-count: infinite; }
      .book ul.book_ul li:nth-child(0) {
        animation-name: page-0; }
      .book ul.book_ul li:nth-child(1) {
        animation-name: page-1; }
      .book ul.book_ul li:nth-child(2) {
        animation-name: page-2; }
      .book ul.book_ul li:nth-child(3) {
        animation-name: page-3; }
      .book ul.book_ul li:nth-child(4) {
        animation-name: page-4; }
      .book ul.book_ul li:nth-child(5) {
        animation-name: page-5; }
      .book ul.book_ul li:nth-child(6) {
        animation-name: page-6; }
      .book ul.book_ul li:nth-child(7) {
        animation-name: page-7; }
      .book ul.book_ul li:nth-child(8) {
        animation-name: page-8; }
      .book ul.book_ul li:nth-child(9) {
        animation-name: page-9; }
      .book ul.book_ul li:nth-child(10) {
        animation-name: page-10; }
      .book ul.book_ul li:nth-child(11) {
        animation-name: page-11; }
      .book ul.book_ul li:nth-child(12) {
        animation-name: page-12; }
      .book ul.book_ul li:nth-child(13) {
        animation-name: page-13; }
      .book ul.book_ul li:nth-child(14) {
        animation-name: page-14; }
      .book ul.book_ul li:nth-child(15) {
        animation-name: page-15; }
      .book ul.book_ul li:nth-child(16) {
        animation-name: page-16; }
      .book ul.book_ul li:nth-child(17) {
        animation-name: page-17; }
      .book ul.book_ul li:nth-child(18) {
        animation-name: page-18; }

@keyframes page-0 {
  4% {
    transform: rotateZ(0deg) translateX(-18px); }
  13%,
  54% {
    transform: rotateZ(180deg) translateX(-18px); }
  63% {
    transform: rotateZ(0deg) translateX(-18px); } }

@keyframes page-1 {
  5.86% {
    transform: rotateZ(0deg) translateX(-18px); }
  14.74%,
  55.86% {
    transform: rotateZ(180deg) translateX(-18px); }
  64.74% {
    transform: rotateZ(0deg) translateX(-18px); } }

@keyframes page-2 {
  7.72% {
    transform: rotateZ(0deg) translateX(-18px); }
  16.48%,
  57.72% {
    transform: rotateZ(180deg) translateX(-18px); }
  66.48% {
    transform: rotateZ(0deg) translateX(-18px); } }

@keyframes page-3 {
  9.58% {
    transform: rotateZ(0deg) translateX(-18px); }
  18.22%,
  59.58% {
    transform: rotateZ(180deg) translateX(-18px); }
  68.22% {
    transform: rotateZ(0deg) translateX(-18px); } }

@keyframes page-4 {
  11.44% {
    transform: rotateZ(0deg) translateX(-18px); }
  19.96%,
  61.44% {
    transform: rotateZ(180deg) translateX(-18px); }
  69.96% {
    transform: rotateZ(0deg) translateX(-18px); } }

@keyframes page-5 {
  13.3% {
    transform: rotateZ(0deg) translateX(-18px); }
  21.7%,
  63.3% {
    transform: rotateZ(180deg) translateX(-18px); }
  71.7% {
    transform: rotateZ(0deg) translateX(-18px); } }

@keyframes page-6 {
  15.16% {
    transform: rotateZ(0deg) translateX(-18px); }
  23.44%,
  65.16% {
    transform: rotateZ(180deg) translateX(-18px); }
  73.44% {
    transform: rotateZ(0deg) translateX(-18px); } }

@keyframes page-7 {
  17.02% {
    transform: rotateZ(0deg) translateX(-18px); }
  25.18%,
  67.02% {
    transform: rotateZ(180deg) translateX(-18px); }
  75.18% {
    transform: rotateZ(0deg) translateX(-18px); } }

@keyframes page-8 {
  18.88% {
    transform: rotateZ(0deg) translateX(-18px); }
  26.92%,
  68.88% {
    transform: rotateZ(180deg) translateX(-18px); }
  76.92% {
    transform: rotateZ(0deg) translateX(-18px); } }

@keyframes page-9 {
  20.74% {
    transform: rotateZ(0deg) translateX(-18px); }
  28.66%,
  70.74% {
    transform: rotateZ(180deg) translateX(-18px); }
  78.66% {
    transform: rotateZ(0deg) translateX(-18px); } }

@keyframes page-10 {
  22.6% {
    transform: rotateZ(0deg) translateX(-18px); }
  30.4%,
  72.6% {
    transform: rotateZ(180deg) translateX(-18px); }
  80.4% {
    transform: rotateZ(0deg) translateX(-18px); } }

@keyframes page-11 {
  24.46% {
    transform: rotateZ(0deg) translateX(-18px); }
  32.14%,
  74.46% {
    transform: rotateZ(180deg) translateX(-18px); }
  82.14% {
    transform: rotateZ(0deg) translateX(-18px); } }

@keyframes page-12 {
  26.32% {
    transform: rotateZ(0deg) translateX(-18px); }
  33.88%,
  76.32% {
    transform: rotateZ(180deg) translateX(-18px); }
  83.88% {
    transform: rotateZ(0deg) translateX(-18px); } }

@keyframes page-13 {
  28.18% {
    transform: rotateZ(0deg) translateX(-18px); }
  35.62%,
  78.18% {
    transform: rotateZ(180deg) translateX(-18px); }
  85.62% {
    transform: rotateZ(0deg) translateX(-18px); } }

@keyframes page-14 {
  30.04% {
    transform: rotateZ(0deg) translateX(-18px); }
  37.36%,
  80.04% {
    transform: rotateZ(180deg) translateX(-18px); }
  87.36% {
    transform: rotateZ(0deg) translateX(-18px); } }

@keyframes page-15 {
  31.9% {
    transform: rotateZ(0deg) translateX(-18px); }
  39.1%,
  81.9% {
    transform: rotateZ(180deg) translateX(-18px); }
  89.1% {
    transform: rotateZ(0deg) translateX(-18px); } }

@keyframes page-16 {
  33.76% {
    transform: rotateZ(0deg) translateX(-18px); }
  40.84%,
  83.76% {
    transform: rotateZ(180deg) translateX(-18px); }
  90.84% {
    transform: rotateZ(0deg) translateX(-18px); } }

@keyframes page-17 {
  35.62% {
    transform: rotateZ(0deg) translateX(-18px); }
  42.58%,
  85.62% {
    transform: rotateZ(180deg) translateX(-18px); }
  92.58% {
    transform: rotateZ(0deg) translateX(-18px); } }

@keyframes page-18 {
  37.48% {
    transform: rotateZ(0deg) translateX(-18px); }
  44.32%,
  87.48% {
    transform: rotateZ(180deg) translateX(-18px); }
  94.32% {
    transform: rotateZ(0deg) translateX(-18px); } }

@keyframes left {
  4% {
    transform: rotateZ(90deg); }
  10%,
  40% {
    transform: rotateZ(0deg); }
  46%,
  54% {
    transform: rotateZ(90deg); }
  60%,
  90% {
    transform: rotateZ(0deg); }
  96% {
    transform: rotateZ(90deg); } }

@keyframes right {
  4% {
    transform: rotateZ(-90deg); }
  10%,
  40% {
    transform: rotateZ(0deg); }
  46%,
  54% {
    transform: rotateZ(-90deg); }
  60%,
  90% {
    transform: rotateZ(0deg); }
  96% {
    transform: rotateZ(-90deg); } }

@keyframes book {
  4% {
    transform: rotateZ(-90deg); }
  10%,
  40% {
    transform: rotateZ(0deg);
    transform-origin: 2px 2px; }
  40.01%,
  59.99% {
    transform-origin: 30px 2px; }
  46%,
  54% {
    transform: rotateZ(90deg); }
  60%,
  90% {
    transform: rotateZ(0deg);
    transform-origin: 2px 2px; }
  96% {
    transform: rotateZ(-90deg); } }

.border_box {
  box-sizing: border-box;
  -webkit-font-smoothing: antialiased; 
  background: #ecd260;
    border-radius: 50%;
    width: 29vw;
    aspect-ratio: 1 / 1;  
  border:9px solid #c12c2f;
}

.border_box * {
  box-sizing: inherit; }
  
*:before, *:after {
  box-sizing: inherit;   
 }

.awesome_recipe{
	position: absolute;
    bottom: 32%;
}
</style>
</head>
<script type="text/javascript">
var Back = $('.back1')

var swiperMain = new Swiper(".swiper01", {
 slidesPerView: 1,
 autoplay: {
    delay: 3000,
		disableOnInteraction:false,
         },
      speed: 500,
      loop: true,
      spaceBetween: 30,
    });

$(document).ready(function () {
    var Back = $('.back1');

    var swiperMain = new Swiper(".swiper01", {
        slidesPerView: 1,
        autoplay: {
            delay: 3000,
            disableOnInteraction: false,
        },
        speed: 500,
        loop: true,
        spaceBetween: 30,
    });

    Back.addClass('animation');

    swiperMain.on('slideChange', function () {
        Back.removeClass('animation');
        console.log(Back.offset());
        Back.addClass('animation');
    });
});
</script>
<body>
<div class="swiper-card swiper-default swiper01 main_swiper">
    <div class="swiper-wrapper">
        <div class="item swiper-slide d-flex align-items-center justify-content-center mt-5">
         <div class="border_box d-flex justify-content-center align-items-center">
         	<!-- <div class="awesome_recipe">AWESOME RECIPE</div> -->
         	<div data-shadow='EATING ALONE' class="form_title awesome_recipe">EATING ALONE</div>
         <a href="recipe/board">
         	<%-- <img src ="<%=NcpObjectStorageService.STORAGE_PHOTO_PATH%>food.png" class="img-fluid"> --%>
         	
	         	<div class="book">
				  <div class="bookinner">
				    <div class="bookleft"></div>
				    <div class="bookmiddle"></div>
				    <div class="bookright"></div>
				  </div>
				  <ul class="book_ul">
				    <li></li>
				    <li></li>
				    <li></li>
				    <li></li>
				    <li></li>
				    <li></li>
				    <li></li>
				    <li></li>
				    <li></li>
				    <li></li>
				    <li></li>
				    <li></li>
				    <li></li>
				    <li></li>
				    <li></li>
				    <li></li>
				    <li></li>
				    <li></li>
				  </ul>
				 </div>
         		</a>
         </div>
        </div>
        <div class="item swiper-slide d-flex align-items-center justify-content-center mt-5">
          <a href="board/list"><img src ="<%=NcpObjectStorageService.STORAGE_PHOTO_PATH%>comu.png" class="img-fluid"></a>
        </div>
        <div class="item swiper-slide d-flex align-items-center justify-content-center mt-5">
          <div class="item_inner">
             <div class="img_content">
                 <a href="mboard"><img src ="<%=NcpObjectStorageService.STORAGE_PHOTO_PATH%>flea.png"  class="img-fluid"></a>
             </div>
            </div>
        </div>
    </div>
  <div class="bar_wrap">
      <!-- <p>프로 자취러 진화중..</p> -->
      <div class="main_effect mb-2 text-center fw_600"><span>프</span><span>로</span><span>&nbsp;</span><span>자</span><span>취</span><span>러</span><span>&nbsp;</span><span>진</span><span>화</span><span>중</span><span>.</span><span>.</span><span>!</span></div>
      <div class="bar">
        <div class="back1"></div>
      </div>
  </div>
  <div class="swiper-pagination"></div>
</div>

</body>
</html>