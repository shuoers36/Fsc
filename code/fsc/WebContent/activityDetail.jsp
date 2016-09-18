<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
  <title>班级活动</title>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="scripts/jquery.min.js"></script>
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <link rel="stylesheet" href="css/layout.css">
  <script src="scripts/bootstrap.min.js"></script>
  <style>
      #content-list {
        font-size: 2em;
      }
      .detail-panel {
      	background: #fff;
      	height: 80%;
      	text-align: center;
      	text-indent: 2em;
      	line-height: 180%;
      }
      .detail-panel img {
      	width: 20%;
      	margin-top: 50px;
      	margin-left: 5%;
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
     <div id="bread-nav">
    	<ol class="breadcrumb">
    		<li><i class="glyphicon glyphicon-home"></i> <a href="activity.jsp">班级活动</a></li>
    		<li class="active">活动详情</li>
    	</ol>
  	</div>
  	<div class="detail-panel col-md-10 col-md-offset-1">
  		<h3 class="activity-name"></h3>
  		<h4 class="activity-time"></h4>
  		<p class="activity-content"></p>
  		
   		<img class="activity-photo">
   	</div>
   		
  </div>
   <script>
   $(document).ready (function (){
       var height = $("#content-list").offset().top;
       $("#content-list").height($(document).height()-height-10);
       $("#left-list").height($(document).height()-height-10);
   });
   var activityId = <%=request.getParameter("activity_id") %>;
   window.onload = function () {     
 	  $.post("activity.do?type=query&page=1&activity_id="+activityId, function (data){
         $(".activity-name").html(data.uu.activity_name); 
         $(".activity-time").html(data.uu.activity_time); 
         $(".activity-content").html(data.uu.activity_content); 
         $(".activity-photo").attr("src",data.uu.photo_path);
         }); 
};
   </script>

</body>
</html>