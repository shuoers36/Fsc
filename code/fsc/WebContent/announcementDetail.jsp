<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>公告详情</title>
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
  	#wrapper {
        position: relative;
        width: 90%;
        height: 500px;
        margin: 10px auto;
        padding: 2em;
        background: #fff;
        box-shadow: 1px 1px 3px #444;
        border-radius: 6px;
        overflow: auto;
      }
     .announce-title {
     	text-align: center;
     	color: #eee;
     	text-shadow: 1px 1px 1px #111;
     }
     .announce-content {
     	padding: 2em;
     	letter-spacing: .2em;
     	font-size: 1.2em;
     	line-height: 1.6;
     	text-indent: 2em;
     }
     .return {
     	position: absolute;
     	top: 80%;
     	right: 10%;
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
	<form action="announcementDetail.do" method="post"></form>     
       <c:forEach items="${announcement3}" var="node">  
        <h4 class="announce-title"><c:out value="${node.announcement_title }"></c:out></h4>       
        <p class="announce-content"><c:out value="${node.announcement_content}"></c:out></p>      
   </c:forEach>  
    <input type="button" class="btn btn-info return" onclick="window.location.href='<%=request.getContextPath() %>/announcement.do?method=all'"  value="返回"> 
	</div>
</div>
<script>
	$(document).ready (function (){
    	var height = $("#content-list").offset().top;
    	$("#content-list").height($(document).height()-height-10);
    	$("#left-list").height($(document).height()-height-10);
  	});
</script>
</body>
</html>