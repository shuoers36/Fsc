<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
<title>今日校园</title>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="scripts/jquery.min.js"></script>
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <link rel="stylesheet" href="css/layout.css">
  <script src="scripts/bootstrap.min.js"></script>
  <style>
      #content-list {
        vertical-align: bottom;
        font-size: 100px;
      }
      .item img {
      	width: 100%;
      }
      a.carousel-control {
      	padding-top: 40px;
      }
      .carousel-indicators {
      	top: 40%;
      }
      #sstory {
      	font-size: .12em;
      	display: inline-block;
      }
      #sstory h5 {
      	font-size: 1.4em;
      	color: #19B5FE;
      	text-shadow: 2px 2px 1px #ccc;
      }
      #sstory p {
      	padding: 10px;
      }
      #sstory hr{
      	border: 1px solid #4ECDC4;
      }
      .story-item {
      	padding: 10px 10px 3px 10px;;
      	display: inline-block;
      	vertical-align: top;
      	width: 32%;
      	margin-left: 2px;
      	
      }
      #schoolnews {
      	display: inline-block;
      	font-size: .14em;: 
      }
      #schoolnews h5 {
      	font-size: 1.2em;
      	color: #F9BF3B;
      	text-shadow: 2px 2px 1px #ccc;
      	margin-bottom: 20px;
      }
       #schoolnews hr {
       	border: 1px solid #4ECDC4;
       }
      #schoolnews li {
      	list-style: none;
      	line-height: 2.3;
      }
      ul.newslist {
      	margin-top: 10px;
      } 
       ul.newslist a:hover{
       	text-decoration: none;
       }
  </style>
</head>
<body>
  <div id="container">
      <%@ include  file="header.jsp"%>
  </div>
 <div id="left-list">
      <jsp:include  page="menu.jsp"/>
 </div>
 <div id="content-list">
	<div id="myCarousel" class="carousel slide">
    <!-- 轮播（Carousel）指标 -->
    <ol class="carousel-indicators " >
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>
    <!-- 轮播（Carousel）项目 -->
    <div class="carousel-inner">
        <div class="item active">
            <img src="images/slide1.jpg" alt="">
        </div>
        <div class="item">
            <img src="images/slide2.jpg" alt="">
        </div>
        <div class="item">
            <img src="images/slide3.jpg" alt="">
        </div>
    </div>
    <!-- 轮播（Carousel）导航 -->
    <a class="carousel-control left" href="#myCarousel"
        data-slide="prev">&lsaquo;
    </a>
    <a class="carousel-control right" href="#myCarousel"
        data-slide="next">&rsaquo;
    </a>
</div> 
<div class="school-story col-md-6" id="sstory">
	<h5>校园生活</h5>
	<hr></hr>
	<div class="slist">
		<div class="story-item  panel panel-default">
			<img src="images/activity1.jpg" width="100%">
			<p>
				“西电小喇叭”微信平台与QQ空间粉丝量总计达3万人，日均浏览量1.5万次。换句话说，，
			</p>
		</div>
		<div class="story-item  panel panel-default">
			<img src="images/activity2.png" width="100%">
			<p>
				由乔小杉老师带领的西电代表队由4名男运动员组成，分别参加了男子乙组5个项目的比赛
			</p>
		</div>
		<div class="story-item  panel panel-default">
			<img src="images/activity3.png" width="100%">
			<p>
				西安电子科技大学2016级本科生开学典礼暨军训动员大会在南校区举行。一张张青春洋溢的面容，
			</p>
		</div>
	</div>
</div>  
	<div class="col-md-5 col-md-offset-1" id="schoolnews">
		<h5>校园新闻</h5>
		<hr></hr>
		<div class="panel panel">
		<ul class="newslist">
			<li><span style="color: rgb(255, 140, 60);" class="glyphicon glyphicon-star-empty"></span> <a href="#'">西安电子科技大学举行2016级研究生开学典礼</a></li>
			<li><span style="color: rgb(255, 140, 60);" class="glyphicon glyphicon-star-empty"></span> <a href="#'">校长郑晓静院士在2016级研究生开学典礼上的讲话</a></li>
			<li><span style="color: rgb(255, 140, 60);" class="glyphicon glyphicon-star-empty"></span> <a href="#'"> 西电召开2016年下半年工作会议安排部署重点工作
</a></li>
			<li><span style="color: rgb(255, 140, 60);" class="glyphicon glyphicon-star-empty"></span> <a href="#'">互联网+”创新创业赛陕西赛区复赛在西电举行</a></li>
</a></li>
		</ul>
		</div>
	</div>
 </div>
 <script>
 $(document).ready (function (){
 	var height = $("#content-list").offset().top;
 	$("#content-list").height($(document).height()-height-10);
 	$("#left-list").height($(document).height()-height-10);
});
 $('.carousel').carousel({
	  interval: 2000
	})
 </script>
</body>
</html>