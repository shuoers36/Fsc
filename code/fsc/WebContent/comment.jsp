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
        font-size: 1.8em;
      }
      #wrapper {
      	width: 90%;
      	height: 500px;
      	margin: 0 auto;
      	background: #fff;
      	box-shadow: 1px 1px 3px #444;
      	border-radius: 6px;
      	overflow: auto;
      }
      .comment-list li {
      	display: inline-block;
      	width: 100%;
      	line-height: 4em;
      }
  
      .student-id {
      	float: left;
      	font-size: 1.5em;
      	color: #81CFE0;
      	font-family: "STHeiti Light";
      	text-shadow: 1px 1px 0px #222;
      }
      .message-time {
      	float: right;
      	margin-right: 35px;
      	font-size: 1.2em;
      }
      .message_content {
      	display: block;
      	margin-top: 3em;
      	margin-right: 35px;
      	font-size: 1.2em;
      	border-bottom: 1px solid #03C9A9;
      }
      .del-comment {
      	float: right;
      }
      .edit-comment {
      	float: right;
      	margin-right: 15px;
      }
      .add-comment {
      	float: right;
      	margin: 20px 60px;
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
  	
  	<button class="btn btn-primary add-comment" data-toggle="modal" data-target="#addModel">添加评语</button>
    <div id="wrapper">
    <ul class="comment-list">
      <c:forEach items="${uu}" var="node"> 
        <li>
        <span class="student-id">
        	<c:out value="${node.student_id}"></c:out>
        	<c:out value="${node.student_name}"></c:out>
        </span>
        <span class="message-time"><c:out value="${node.message_time}"></c:out></span>
        <span class="message_content"><c:out value="${node.message_content}"></c:out><a class="del-comment" href="" onclick="delfunc(${node.comment_id})">删除</a></span>
       	
      </c:forEach> 
    </ul>  
      
  </div>
   
   <form method="post" id="homeworkForm" name="homeworkForm"></form> 
    <!--模态框  添加 -->
	<div class="modal fade" id="addModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">添加评语</h4>
            </div>
            <div class="modal-body">
            	 <form role="form" method="post" action="Comment.do?type=add">
  				   <div class="form-group">
                      <label for="Teacher_name">教师姓名</label>
                      <input type="text" class="form-control"  name="Teacher_name" id="Teacher_name">
                  </div>
                  <div class="form-group">
                      <label for="Student_id">学生学号</label>
                      <input type="text" class="form-control"  name="Student_id" id="Student_id">
                  </div>
                  <div class="form-group">
       				<textarea rows="3"  name="Comment_content" class="Comment_content form-control"></textarea>
    			</div>
                  <div class="modal-footer">
                      <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                      <button type="submit" class="btn btn-primary">提交</button>
                  </div>
                </form>
          </div><!-- /.modal-content -->
        </div><!-- /.modal --> 
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
	      	var str1 = $("#mclass-id").html();
	    	$.post("Comment.do?type=query&Class_id="+str1, function (uu){
	             $("body").html(uu); 
	            }); 
	  };
	  function delfunc (comment_id){
		  var str1 = $("#mclass-id");
		  
		  $.post("Comment.do?type=delete&Comment_id="+comment_id,function (){$.post("Comment.do?type=query&Class_id="+str1, function (uu){
		    	 $("body").html(uu); 
		      }); });
	  }
	  str2 =$("#muser-name").text();
	  $("#Teacher_name").val(str2);
	</script>
</body>
</html>