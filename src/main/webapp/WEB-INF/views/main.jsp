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
	padding-bottom: 8em;
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
         <a href="recipe/board"><img src ="<%=NcpObjectStorageService.STORAGE_PHOTO_PATH%>food.png" class="img-fluid"></a>
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
        <div class="back"></div>
      </div>
  </div>
  <div class="swiper-pagination"></div>
</div>

</body>
</html>