<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
<title>消息详情</title>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="scripts/jquery.min.js"></script>
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <link rel="stylesheet" href="css/layout.css">
  <script src="scripts/bootstrap.min.js"></script>
  <style>
  	#content-list {
  		font-size: 2.3em;
  	}
  	.return-message {
  		display: block;
  		float: right;
  		margin-right: 20px;
  		width: 6em;
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
	<form id="myform1" action="message.do" method="post">
	<table class="table table-bordered table-condensed">
        <caption>留言内容</caption>
        <thead>
            <tr>
            	<th>ID</th>
                <th>主题</th>
                <th>发件人</th>
                <th>收件人</th>
                <th>内容</th>
                <th>日期</th></tr>
        </thead>
        <tbody id="liss">
    <c:forEach items="${nwlist}" var="node">
      <tr>
        <td><c:out value="${node.message_id}"></c:out></td> 
        <td><c:out value="${node.message_title}"></c:out></td>
        <td><c:out value="${node.addresser_name}"></c:out></td>
        <td><c:out value="${node.addressee_name}"></c:out></td>
        <td><c:out value="${node.message_content}"></c:out></td>
        <td><c:out value="${node.timeToString}"></c:out></td>
      </tr>  
    </c:forEach> 
        </tbody>
    </table>
</form>
<input type="button" class="btn btn-info return-message" onclick="window.location.href='<%=request.getContextPath() %>/message.jsp'"  value="返回">
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