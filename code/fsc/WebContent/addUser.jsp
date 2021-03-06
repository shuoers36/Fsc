<%@ page contentType="text/html; charset=utf-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE html>
<html>
<head>
  <title>添加用户</title>
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
      #add-form {
        left: 17%;
        padding: 0;
        height: 520px;
        box-shadow: 1px 1px 3px 1px #aaa;
        background: rgba(230,230,230,.3);
      }
      .panel-body {
      	padding-left: 25%;
      	padding-top: 100px;
      	
      }
      input.add-element {
      	display: inline;
      	width: 50%;
      	margin-left: 2em;
      }
      span.pwd-spacing {
      	display: inline-block;
      	width: 1em;
      }
      #add-type {
      	display: inline-block;
      	font-weight: 700;
      	margin-right: 2em;
      }
      .button-style {
      	width: 6em;
      	margin-left: 5em;
      	margin-top: 1em;
      }
      div.form-group {
      	line-height: 4em;
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
		<li><i class="glyphicon glyphicon-home"></i> <a href="userManage.jsp">用户管理</a></li>
		<li class="active">添加用户</li>
		</ol>
	</div>
   <div class="col-lg-8 col-xs-8 panel panel-default" id="add-form">
   <div class="panel-heading ">添加用户</div>
   <div class="panel-body col-lg-12 col-xs-12">
   <form role="form" method="post" action="usermanage.do?type=add">
    <div class="form-group">
        <label for="User_name">用户名</label>
        <input type="text" class="form-control add-element" placeholder="请输入用户名" name="User_name" id="User_name">
    </div>
    <div class="form-group">
        <label for="User_password">密<span class="pwd-spacing"></span>码</label>
        <input type="password" class="form-control add-element"  placeholder="请输入用户密码" name="User_password" id="User_password">
    </div>
    <div class="radio">
    	<span id="add-type">类<span class="pwd-spacing"></span>型：</span>
    	<label>
    		<input type="radio" name="role"  value="teacher">教师
    	</label>
    	<label>
    		<input type="radio" name="role" value="leader">领导
    	</label>
    	<label>
    		<input type="radio" name="role" value="student">学生
    	</label>
    </div>
	<div class="form-group hidden" id="classshow">
        <label for="Class_id">班<span class="pwd-spacing"></span>号</label>
        <input type="text" class="form-control add-element"  placeholder="请输入班级" name="Class-id" id="Class_id">
    </div>
    <div class="form-group  hidden" id="subjectshow">
        <label for="Subject_name">学<span class="pwd-spacing"></span>科</label>
        <input type="text" class="form-control add-element"  placeholder="请输入学科" name="Subject-name" id="Subject_name">
    </div>
    <button type="submit" class="btn btn-success btn-default button-style">提交</button>
    <a href="userManage.jsp"><button type="button" class="btn btn-info btn-default button-style">返回</button></a>
  </form>
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
    $(function(){
    	  $(":radio").click(function(){
    	   if($(this).val()=="student") {
    		   $("#classshow").removeClass("hidden");  
    		   $("#subjectshow").addClass("hidden");  
    	   }
    	  });
    	 });
    $(":radio").click(function(){
 	   if($(this).val()=="teacher") {
 		   $("#classshow").removeClass("hidden");  
 		  $("#subjectshow").removeClass("hidden");  
 	   }
 	  });
    
    $(":radio").click(function(){
  	   if($(this).val()=="leader") {
  		   $("#classshow").addClass("hidden");  
  		  $("#subjectshow").addClass("hidden");  
  	   }
  	  });
  
   /*  ajax查询单个用户
                  判断Json对象是否为空
     function isEmptyObject(e) {
      var t;
      for (t in e)
        return !1;
      return !0;
    } */
    
  
 </script>
</body>
</html>