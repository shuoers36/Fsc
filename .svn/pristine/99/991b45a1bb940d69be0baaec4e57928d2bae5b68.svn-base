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
      .activity_content {
      	margin-top: 20px;
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
    		<li class="active">编辑活动</li>
    	</ol>
  	</div>
  	<div class="panel panel-info col-md-10 col-md-offset-1">
  		<div class="panel-body">
  		<form role="form" method="post" action="activity.do?type=edit">
  		<input type="text" class="form-control"  name="activity_id" id="activity_id" readonly>
  		<div class="form-group">
       		<textarea rows="15"  name="activity_content" class="activity_content form-control"></textarea>
		</div>
    		<button type="submit" class="btn btn-success btn-default button-style">提交</button>
    		<a href="activity.jsp"><button type="button" class="btn btn-info btn-default button-style">返回</button></a>
  		</form>
   	</div>
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
 		 $("#activity_id").val(data.uu.activity_id); 
         $(".activity_content").html(data.uu.activity_content); 
 			
         }); 
};
   </script>

</body>
</html>