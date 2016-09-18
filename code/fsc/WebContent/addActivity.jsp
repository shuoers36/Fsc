<%@ page contentType="text/html; charset=utf-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE html>
<html>
<head>
  <title>添加活动</title>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="scripts/jquery.min.js"></script>
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <link rel="stylesheet" href="css/layout.css">
  <script src="scripts/bootstrap.min.js"></script>
  <script src="scripts/bootstrap.min.js"></script>
  <style>
      #content-list {
        font-size: 2em;
      }
      #add-form {
        left: 17%;
        padding: 0;
        height: 500px;
        box-shadow: 1px 1px 3px 1px #aaa;
        background: rgba(230,230,230,.3);
      }
      .panel-body {
        padding-left: 25%;
        padding-top: 5px;
        
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
      .activity-content {
      	width: 30em;
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
    <li class="active">添加活动</li>
    </ol>
  </div>
  
   <div class="col-lg-8 col-xs-8 panel panel-default" id="add-form">
   <div class="panel-heading ">添加活动</div>
   <div class="panel-body col-lg-12 col-xs-12">
   
   <form role="form" method="post" action="addActivity.do?type=add" enctype="multipart/form-data">
    <div class="form-group">
        <input type="text" class="form-control add-element hidden" name="activity_id" id="activity_id" readonly>
        <input type="text" class="form-control add-element hidden" name="class_id" id="class_id" readonly>
    </div>
    <div class="form-group">
        <label for="activity_name">活动标题</label>
        <input type="text" class="form-control add-element" placeholder="请输入活动标题" name="activity_name" id="activity_name">
    </div>
    <div class="form-group">
       <textarea rows="3"  name="activity_content" class="activity-content"></textarea>
    </div>
    
	文件：<input type="file" name="myfile" /><br />
	
    <button type="submit" class="btn btn-success btn-default button-style">提交</button>
    <a href="activity.jsp"><button type="button" class="btn btn-info btn-default button-style">返回</button></a>
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
        $("#class_id").val($("#mclass-id").html());
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