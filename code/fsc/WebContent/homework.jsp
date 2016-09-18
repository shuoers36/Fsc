<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
<title>今日作业</title>
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
      	width: 90%;
      	height: 500px;
      	margin: 0 auto;
      	background: #fff;
      	box-shadow: 1px 1px 3px #444;
      	border-radius: 6px;
      	overflow: auto;
      }
      .homework-list li {
      	display: inline-block;
      	width: 100%;
      	line-height: 6em;
      }
      .homework-id {
      	display: none;
      	color: #fff;
      }
      .homework-class {
      	float: left;
      	font-size: 1.5em;
      	color: #81CFE0;
      	font-family: "STHeiti Light";
      	text-shadow: 1px 1px 0px #222;
      }
      .homework-time {
      	float: right;
      	margin-right: 35px;
      }
      .homework-content {
      	display: block;
      	margin-top: 3em;
      	margin-right: 35px;
      	font-size: 1.2em;
      	border-bottom: 1px solid #03C9A9;
      }
      .del-homework {
      	float: right;
      }
      .edit-homework {
      	float: right;
      	margin-right: 15px;
      }
      .add-homework {
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
	
	<button class="btn btn-primary add-homework" data-toggle="modal" data-target="#addModel">添加作业</button>
    <div id="wrapper">
    <ul class="homework-list">
      <c:forEach items="${homework2}" var="node"> 
        <li>
        <span class="homework-id"><c:out value="${node.homework_id}"></c:out></span>
        <span class="homework-class"><c:out value="${node.class_id}"></c:out>班</span>
        <span class="homework-time"><c:out value="${node.homework_time}"></c:out></span>
        <span class="homework-content"><c:out value="${node.homework_content}"></c:out><a class="del-homework" href="" onclick="delfunc(${node.homework_id})">删除</a><a class="edit-homework" href="" data-toggle="modal" data-target="#myModal">编辑</a></span>
       	
      </c:forEach> 
    </ul>     
  </div>
     <!--模态框   编辑  -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">编辑作业</h4>
            </div>
            <div class="modal-body">
            	 <form role="form" method="post" action="homework.do?type=edit">
  				   <div class="form-group">
                      <label for="editHomework_id">编号</label>
                      <input type="text" class="form-control"  name="homework_id" id="editHomework_id" readonly>
                  </div>
  				   <div class="form-group">
                      <label for="editClass_id">班级</label>
                      <input type="text" class="form-control"  name="class_id" id="editClass_id" readonly>
                  </div>
                  <div class="form-group">
       				<textarea rows="3"  name="homework_content" class="homework-content form-control" ></textarea>
    			</div>
                  <div class="modal-footer">
                      <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                      <button type="submit" class="btn btn-primary">提交更改</button>
                  </div>
                </form>
        </div><!-- /.modal-content -->
      </div><!-- /.modal --> 
    </div>
  </div>
    
   <form method="post" id="homeworkForm" name="homeworkForm"></form> 
    <!--模态框  添加 -->
	<div class="modal fade" id="addModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">添加作业</h4>
            </div>
            <div class="modal-body">
            	 <form role="form" method="post" action="homework.do?type=add">
  				   <div class="form-group">
                      <label for="addClass_id">班级</label>
                      <input type="text" class="form-control"  name="class_id" id="addClass_id" readonly>
                  </div>
                  <div class="form-group">
                      <label for="addSubject_name">学科</label>
                      <input type="text" class="form-control"  name="subject_name" id="addSubject_name" readonly>
                  </div>
                  <div class="form-group">
       				<textarea rows="3"  name="homework_content" class="homework-content form-control"></textarea>
    			</div>
                  <div class="modal-footer">
                      <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                      <button type="submit" class="btn btn-primary">提交更改</button>
                  </div>
                </form>
          </div><!-- /.modal-content -->
        </div><!-- /.modal --> 
      </div>
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
      var str=$("#msubject-name").html();
    	$.post("homework.do?type=queryteacher&subject_name="+str, function (homework2){
             $("body").html(homework2); 
            }); 
  };
  	function delfunc(homeworkid){
  		var str=$("#msubject-name").html();
  		$.post("homework.do?type=delete&homework_id="+homeworkid,function (){$.post("homework.do?type=queryteacher&subject_name="+str, function (homework2){
	    	 $("body").html(homework2); 
	      }); });
  		  
  	}
  	function editHomework(homeworkid1,classid,subjectname) {
  		$("#editHomework_id").val(3);
  		$("#editClass_id").html(classid);
  		$("#editSubject_name"),html(subjectname);
  	}
  	$(".edit-homework").click (function(e) {
        e.preventDefault();
          var homeworkid=$(this).parent().parent().children().first().text();
          var classid=$(this).parent().parent().children().eq(1).text();     
          $("#editHomework_id").val(homeworkid);
          $("#editClass_id").val(classid);
      });
  	$(".add-homework").click (function(e) {
        e.preventDefault();
          $("#addClass_id").val($("#mclass-id").html());
          $("#addSubject_name").val($("#msubject-name").html());
      });
</script>
</body>
</html>