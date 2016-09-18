<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 
<!DOCTYPE html>
<html>
<head>
<title>留言</title>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="scripts/jquery.min.js"></script>
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <link rel="stylesheet" href="css/layout.css">
  <script src="scripts/bootstrap.min.js"></script>
	<style>
	  #content-list {
        font-size: 2.8em;
      }
      .send-receive {
      	box-sizing: border-box;
      	overflow: auto;
      	height: 600px;
      }
      .message-sere {
      	margin-top: 3px;
      	padding-left: 0;
      	
      }
      .message-sere li {
      	margin-top: 2px;
      	border-radius: 3px;
      	overflow: hidden;
      }
      .message-name {
      	display: block;
      	float: left;
      	color: #03C9A9;
      }
      .message-time {
      	display: block;
      	float: right;
      }
      .message-title {
      	display: block;
      	margin-top: 20px;
      	text-align: center;
      }
      .message-title:hover {
      	text-decoration: none;
      }
      .del-message {
      	float: right;
      }
      .addlink {
      	display: block;
      	margin: 10px 15px
      }
      #receive-title {
      	background: #87D37C;
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
<input type="button" class="btn btn-info addlink" onclick="window.location.href='<%=request.getContextPath() %>/messageInsert.jsp'"  value="新建留言">
<form action="message.do" method="post" class="col-md-12" id="message-form">
	<div class="list-group col-md-6 col-sm-6" class="send-receive">
		<a class="list-group-item active">已发送</a> 
		<ul  class="message-sere">         
            <c:forEach items="${nulist}" var="node">
      			<li class="list-group-item">
      			<span class="message-name">To: <c:out value="${node.addressee_name}"></c:out></span>
        		<span class="message-time"><c:out value="${node.timeToString}"></c:out></span>
        		<a class="message-title" href="<%=request.getContextPath() %>/message.do?type=detail&detail_id=${node.message_id}"><c:out value="${node.message_title}"></c:out></a>
        		<input type="button" class="del-message btn-link" onclick="window.location.href='<%=request.getContextPath() %>/message.do?type=delete&message_id=${node.message_id}'"  value="删除">
      			</li>
   			</c:forEach>  
   	 	</ul>   
    </div>
    
   <div class="list-group col-md-6 col-sm-6" class="send-receive">
		<a class="list-group-item active" id="receive-title">已接收</a>  
    	<ul class="message-sere">
            <c:forEach items="${nulist1}" var="node">
       <li class="list-group-item">
        <span class="message-name">From:<c:out value="${node.addresser_name}"></c:out></span>
        <span class="message-time"><c:out value="${node.timeToString}"></c:out></span>
        <a class="message-title" href="<%=request.getContextPath() %>/message.do?type=detail&detail_id=${node.message_id}"><c:out value="${node.message_title}"></c:out></a>
        <input type="button" class="del-message btn-link" onclick="window.location.href='<%=request.getContextPath() %>/message.do?type=delete&message_id=${node.message_id}'"  value="删除">
      </li>
   </c:forEach>  
    </ul>
    </div>
</form>


</div>

<script type="text/javascript">
	$(document).ready (function (){
    	var height = $("#content-list").offset().top;
    	$("#content-list").height($(document).height()-height-10);
    	$("#left-list").height($(document).height()-height-10);
  });
  
 window.onload = function (){
	 var str1= $("#muser-name").html();
	 $.post("message.do?type=query&user_name="+str1, function (nlist){
  	 $("body").html(nlist); 
    });   
 };
 
/* function mfSubmit(id){
	
	document.getElementById("message_id").value = id;
	
	document.getElementById("myform").submit();
} */

</script>



</body>
</html>