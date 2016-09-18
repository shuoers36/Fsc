<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html >
<html>
<head>
<title>奖惩记录</title>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="scripts/jquery.min.js"></script>
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <link rel="stylesheet" href="css/layout.css">
  <script src="scripts/bootstrap.min.js"></script>
  <style>
  	#content-list {
  		font-size: 3em;
  	}
  	#wrapper {
        width: 90%;
        height: 500px;
        margin: 10px auto;
        background: linear-gradient(to left bottom,transparent 50%, rgba(0,0,0,.4) 0) no-repeat 100% 0 / 2em 2em;
        box-shadow: 1px 1px 3px #444;
        border-radius: 6px;
        overflow: auto;
        text-align: center;
      }
     .honor-title {
     	text-align: center;
     	color: #fff;
     	text-shadow: 2px 2px 1px #D35400;
     }
     .honor-li {
     	list-style: none;
     }
    .honor-content {
    	display: inline-block;
    	float: left;
    	margin-top: 15px;
    }
    .honor-time {
    	display: inline-block;
    	float: right;
    	margin-top: 15px;
    	color: #65C6BB;
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
      <div id="wrapper">
      <h4 class="honor-title">奖罚记录</h4>
      	<div class="col-md-8 col-md-offset-2">
      	<ul class="honor-list">
        <c:forEach items="${honor1}" var="node">  
        		<li class="honor-li">
        			<span class="honor-content col-md-6 col-sm-6"><span class="glyphicon glyphicon-thumbs-up"></span> <c:out value="${node.honor_content}"></c:out></span>
      				<span class="honor-time col-md-6 col-sm-6"><c:out value="${node.timeToString}"></c:out></span>
      			</li>
   		</c:forEach>
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
	window.onload = function () {     
  		var str1 = $("#mstudent-id").html();
		$.post("honor.do?Student_id="+str1, function (honor1){
         $("body").html(honor1); 
        }); 
	};
</script>
</body>
</html>