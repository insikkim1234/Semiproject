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
    <style>
        .carousel {
            position: relative
        }
        .carousel.pointer-event {
            -ms-touch-action: pan-y;
            touch-action: pan-y
        }
        .carousel-inner {
            position: relative;
            width: 100%;
            overflow: hidden
        }
        .carousel-inner::after {
            display: block;
            clear: both;
            content: ""
        }
        .carousel-item {
            position: relative;
            display: none;
            float: left;
            width: 100%;
            margin-right: -100%;
            -webkit-backface-visibility: hidden;
            backface-visibility: hidden;
            transition: -webkit-transform .2s ease-in-out;
            transition: transform .2s ease-in-out;
            transition: transform .2s ease-in-out, -webkit-transform .2s ease-in-out
        }
        @media ( prefers-reduced-motion :reduce) {
            .carousel-item {
                transition: none
            }
        }
        .carousel-item-next, .carousel-item-prev, .carousel-item.active {
            display: block
        }
        .active.carousel-item-right, .carousel-item-next:not (.carousel-item-left
	){
            -webkit-transform: translateX(100%);
            transform: translateX(100%)
        }
        .active.carousel-item-left, .carousel-item-prev:not (.carousel-item-right
	){
            -webkit-transform: translateX(-100%);
            transform: translateX(-100%)
        }
        .carousel-fade .carousel-item {
            opacity: 0;
            transition-property: opacity;
            -webkit-transform: none;
            transform: none
        }
        .carousel-fade .carousel-item-next.carousel-item-left, .carousel-fade .carousel-item-prev.carousel-item-right,
        .carousel-fade .carousel-item.active {
            z-index: 1;
            opacity: 1
        }
        .carousel-fade .active.carousel-item-left, .carousel-fade .active.carousel-item-right
        {
            z-index: 0;
            opacity: 0;
            transition: opacity 0s .6s
        }
        @media ( prefers-reduced-motion :reduce) {
            .carousel-fade .active.carousel-item-left, .carousel-fade .active.carousel-item-right
            {
                transition: none
            }
        }
        .carousel-control-next, .carousel-control-prev {
            position: absolute;
            top: 0;
            bottom: 0;
            z-index: 1;
            display: -ms-flexbox;
            display: flex;
            -ms-flex-align: center;
            align-items: center;
            -ms-flex-pack: center;
            justify-content: center;
            width: 15%;
            color: #fff;
            text-align: center;
            opacity: .5;
            transition: opacity .15s ease
        }
        @media ( prefers-reduced-motion :reduce) {
            .carousel-control-next, .carousel-control-prev {
                transition: none
            }
        }
        .carousel-control-next:focus, .carousel-control-next:hover,
        .carousel-control-prev:focus, .carousel-control-prev:hover {
            color: #fff;
            text-decoration: none;
            outline: 0;
            opacity: .9
        }
        .carousel-control-prev {
            left: 0
        }
        .carousel-control-next {
            right: 0
        }
        .carousel-control-next-icon, .carousel-control-prev-icon {
            display: inline-block;
            width: 20px;
            height: 20px;
            background: no-repeat 50%/100% 100%
        }
        .carousel-control-prev-icon {
            background-image:
                    url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' fill='%23fff' width='8' height='8' viewBox='0 0 8 8'%3e%3cpath d='M5.25 0l-4 4 4 4 1.5-1.5L4.25 4l2.5-2.5L5.25 0z'/%3e%3c/svg%3e")
        }
        .carousel-control-next-icon {
            background-image:
                    url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' fill='%23fff' width='8' height='8' viewBox='0 0 8 8'%3e%3cpath d='M2.75 0l-1.5 1.5L3.75 4l-2.5 2.5L2.75 8l4-4-4-4z'/%3e%3c/svg%3e")
        }
        .carousel-indicators {
            position: absolute;
            right: 0;
            bottom: 0;
            left: 0;
            z-index: 15;
            display: -ms-flexbox;
            display: flex;
            -ms-flex-pack: center;
            justify-content: center;
            padding-left: 0;
            margin-right: 15%;
            margin-left: 15%;
            list-style: none
        }
        .carousel-indicators li {
            box-sizing: content-box;
            -ms-flex: 0 1 auto;
            flex: 0 1 auto;
            width: 30px;
            height: 3px;
            margin-right: 3px;
            margin-left: 3px;
            text-indent: -999px;
            cursor: pointer;
            background-color: #fff;
            background-clip: padding-box;
            border-top: 10px solid transparent;
            border-bottom: 10px solid transparent;
            opacity: .5;
            transition: opacity .6s ease
        }

        @media ( prefers-reduced-motion :reduce) {
            .carousel-indicators li {
                transition: none
            }
        }
        .carousel-indicators .active {
            opacity: 1
        }
        .carousel-caption {
            position: absolute;
            right: 15%;
            bottom: 20px;
            left: 15%;
            z-index: 10;
            padding-top: 20px;
            padding-bottom: 20px;
            color: #fff;
            text-align: center
        }
        #demo {
            width: 100%;
            height: 700px;
            text-align: center;
        }
        .carousel-inner>div {
            width: 100%;
        }
        .carousel-inner div:nth-child(1) {
            background-color: #FFFFFF;
        }
        .carousel-inner div:nth-child(2) {
            background-color: #FFFFFF;
        }
        .carousel-inner div:nth-child(3) {
            background-color: #FFFFFF;
        }
    </style>
</head>
<body>
<div id="demo" class="carousel slide" data-ride="carousel">

    <!-- Indicators -->
    <ul class="carousel-indicators">
        <li data-target="#demo" data-slide-to="0" class="active"></li>
        <li data-target="#demo" data-slide-to="1"></li>
        <li data-target="#demo" data-slide-to="2"></li>
    </ul>

    <!-- The slideshow -->
    <div class="carousel-inner">
        <div class="carousel-item active" style="width: 100%">
           <a href="board/list"><img src="${root}/resources/photo/community.png/" alt="커뮤니티" width="1240" height="700"></a>
        </div>
        <div class="carousel-item">
            <a href="recipe/board"><img src="${root}/resources/photo/recipebook.png/" alt="레시피북" width="1240" height="700"></a>
        </div>
        <div class="carousel-item">
            <a href="mboard"><img src="${root}/resources/photo/fleamarket.png/" alt="벼룩시장" width="1240" height="700"></a>
        </div>
    </div>


    <!-- Left and right controls -->
    <a class="carousel-control-prev" href="#demo" data-slide="prev"> <span
            class="carousel-control-prev-icon"></span>
    </a> <a class="carousel-control-next" href="#demo" data-slide="next">
    <span class="carousel-control-next-icon"></span>
</a>
</div>

</body>
</html>