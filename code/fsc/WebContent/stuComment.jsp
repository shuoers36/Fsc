<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
<title>评语</title>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="scripts/jquery.min.js"></script>
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <link rel="stylesheet" href="css/layout.css">
  <script src="scripts/bootstrap.min.js"></script>
  <style>
  	#content-list {
		font-size: 2.4em;
		}
    #wrapper {
        height: 500px;
        margin-top: 10px;
        background: #fff;
        box-shadow: 1px 1px 3px #444;
        border-radius: 6px;
        overflow: auto;
      }
     .comment-list li {
        	display: inline-block;
        	padding-top: 35px;
        	width: 100%;
        	line-height: 6em;
        	border-bottom: 1px solid #81CFE0;
        	text-align: center;
        	line-height: 1.2em;
      }
      .teacher-name {
      	display: block;
      	float: left;
      	color: #81CFE0;
      }
      .message-time {
      	display: block;
      	float: right;
      	margin: 0px 15px;
      }
      .message-content {
      	display: block;
      	margin-top: 30px;
      	text-align: left;
      	text-indent: 2em;
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
        <div id="wrapper" class="col-md-10 col-md-offset-1">
        <ul class="comment-list col-md-10 col-md-offset-1">
            <c:forEach items="${uu}" var="node">  
      <li>
        <span class="teacher-name"><c:out value="${node.teacher_name}"></c:out></span>
        <span class="message-time"><c:out value="${node.message_time}"></c:out></span>
        <span class="message-content"><c:out value="${node.message_content}"></c:out></span>
        

      </li>
   	</c:forEach>  
  </ul>
</div>
    
 </div>   
<script>
//dom加载过程中动态计算背景高度
$(document).ready (function (){
    var height = $("#content-list").offset().top;
    $("#content-list").height($(document).height()-height-10);
    $("#left-list").height($(document).height()-height-10);
  });
window.onload = function () {     
  var str = $("#mstudent-id").html();
	$.post("Comment.do?type=queryid&Student_id="+str, function (uu){
         $("body").html(uu); 
        }); 
};
</script>
</body>
</html>