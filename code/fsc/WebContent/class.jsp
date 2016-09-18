<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
<title>班级管理</title>
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
      .class-list li {
        display: inline-block;
        width: 100%;
        line-height: 3em;
        padding-top: 30px;
      }
      .class-id {
        float: left;
        color: #81CFE0;
        font-size: 1.4em;
        text-shadow: 1px 1px 0px #222;
      }
      .class-class {
        margin-left: 150px;
        font-size: 1.5em;
        color: #81CFE0;
        font-family: "STHeiti Light";
        text-shadow: 1px 1px 0px #222;
      }
      .class-time {
        float: right;
        margin-right: 165px;
        font-size: 1.3em;
        color: #81CFE0;
        text-shadow: 1px 1px 0px #222;
      }
      .class-content {
        display: block;
        margin-top: 3em;
        margin-right: 35px;
        font-size: 1.2em;
        border-bottom: 1px solid #03C9A9;
        
      }
      .del-class {
        float: right;
        margin-top: -50px;
      }
      .add-class {
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
  <button class="btn btn-primary add-class" data-toggle="modal" data-target="#addModel">添加班级</button>
    <div id="wrapper">
    <ul class="class-list">
      <li>
      	<span class="class-id">编号</span>
        <span class="class-class">班号</span>
        <span class="class-time">年级</span>
      </li>
      <c:forEach items="${class1}" var="node"> 
        <li>
        <span class="class-id"><c:out value="${node.class_id}"></c:out></span>
        <span class="class-class"><c:out value="${node.class_num}"></c:out>班</span>
        <span class="class-time"><c:out value="${node.grade}"></c:out></span>
        <span class="class-content"><a class="del-class" href="" onclick="delfunc(${node.class_id})">删除</a></span>
        
      </c:forEach> 
    </ul>     
  </div>
    
   <form method="post" id="classForm" name="classForm"></form> 
  <!--模态框  添加 -->
  <div class="modal fade" id="addModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">新建班级</h4>
            </div>
            <div class="modal-body">
               <form role="form" method="post" action="class.do?type=add">
             <div class="form-group">
                      <label for="addClass_id">编号</label>
                      <input type="text" class="form-control"  name="class_id" id="addClass_id">
                  </div>
                  <div class="form-group">
                      <label for="addClass_num">班号</label>
                      <input type="text" class="form-control"  name="class_num" id="addClass_num">
                  </div>
                 <div class="form-group">
                      <label for="addSubject_name">年级</label>
                      <input type="text" class="form-control"  name="grade" id="addGrade">
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
      $.post("class.do?type=query", function (class1){
             $("body").html(class1); 
            }); 
  };
    function delfunc(classid){
      $.post("class.do?type=delete&class_id="+classid,function (){$.post("class.do?type=query", function (class1){
         $("body").html(class1); 
        }); });
        
    }
    function editclass(classid1,classid,subjectname) {
      $("#editclass_id").val(3);
      $("#editClass_id").html(classid);
      $("#editSubject_name"),html(subjectname);
    }
    
   
</script>
</body>
</html>