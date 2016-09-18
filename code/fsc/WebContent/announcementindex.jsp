<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 
<!DOCTYPE html>
<html>
<head>
<title>公告</title>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="scripts/jquery.min.js"></script>
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <link rel="stylesheet" href="css/layout.css">
  <script src="scripts/bootstrap.min.js"></script>
	<style>
		#content-list {
			   font-size: 2.2em;
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
      .add-announcement {
      	margin: 10px 0 5px 50px;
      }
    	.announcement-list li {
        	display: inline-block;
        	width: 100%;
        	line-height: 6em;
        	border-bottom: 1px solid #81CFE0;
        	text-align: center;
      }
      .announcement-time {
      	display: block;
      	float: left;
      }
      .announcement-title {
      	display: inline;
      	vertical-align: bottom;
      	margin-bottom: -10px;
      }
      .del-announcement {
      	display: block;
      	float: right;
      	margin: 30px 15px;
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
 <button class="btn btn-primary add-announcement" data-toggle="modal" data-target="#addModel">发布新公告</button>
	
<div id="wrapper">
    <form method="post" action="announcement.do">
    <ul class="announcement-list">
      <c:forEach items="${announcement2}" var="node"> 
        <li>  
        <span class="announcement-time"><c:out value="${node.timeToString}"></c:out></span>  
        <a class="announcement-title" href='<%=request.getContextPath() %>/announcementDetail.do?announcement_id=${node.announcement_id}'><c:out value="${node.announcement_title}"></c:out></a>
         <input type="button" class="btn btn-warning btn-sm del-announcement" name="announcement_delid" value="删除"  onclick="window.location.href='<%=request.getContextPath()%>/announcement.do?method=delete&announcement_delid=${node.announcement_id}'">      
      </c:forEach> 
    </ul> 
    </form>    
 </div>
  
   <form method="post" id="announcementForm" name="announcement"></form> 
    <!--模态框  添加 -->
  <div class="modal fade" id="addModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">添加公告</h4>
            </div>
            <div class="modal-body">
               <form role="form" method="post" action="announcement.do?method=insert">
             <div class="form-group">
                      <label for="announcement_title">标题</label>
                      <input type="text" class="form-control"  name="announcement_title" id="announcement_title" placeholder="请输入标题"  required>
                  </div>
                  <div class="form-group">
                  <label for="announcement_content">内容</label>
              <textarea rows="3"  name="announcement_content" class="announcement_content form-control"placeholder="请输入内容"  required></textarea>
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
  $(document).ready (function (){
        var height = $("#content-list").offset().top;
        $("#content-list").height($(document).height()-height-10);
        $("#left-list").height($(document).height()-height-10);
        if($("#role-name").html() !== "manage" &&  $("#role-name").html() !== "leader") {
        	$(".add-announcement").hide();
        	$(".del-announcement").hide();
        }
      });
    window.onload = function () {     
      $.post("announcement.do?method=all", function (announcement2){
             $("body").html(announcement2); 
            }); 
  };
	function mfSubmit(id){	
		document.getElementById("announcement_id").value = id;	
		document.getElementById("myform").submit();
	}
 </script>
	
</body>
</html>


