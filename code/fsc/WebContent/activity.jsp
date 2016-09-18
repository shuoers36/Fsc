<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
  <title>班级活动</title>
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
      #get-activity {
        display: inline-block;
        position: relative;
        vertical-align: top;
        margin-top: 30px;
        width: 27%;
        margin-left: 5%;
        background: #fff;
        box-shadow: 1px 1px 1px 1px #555;
        box-sizing: border-box;
        padding: 1em;
        text-align: center;
        font-size: 1.1em;
        border-radius: 3px;
      }
      #get-activity:before {
      	position: absolute;
      	top: 0%;
      	left: -10%;
      	content: "";
      	width: 0;
      	height: 0;
      	border: 10px solid transparent;
      	border-left-color: #ccc;
      }
      #get-activity li {
      	list-style: none;
      }
      #get-activity li:nth-child(3){
      	position: absolute;
      	top: 80%;
      	left: 40%;
      }
      #get-activity a:hover {
      	text-decoration: none;
      }
      #get-activity img {
      	width: 100%;
      }
      .pagination {
        position: fixed;
    	top: 80%;
    	left: 47%;
    	display: block; 
    	font-size: 1.5em; 
    }
    .add-act {
    	padding-left: 20px;
    }
    .add-act a {
    	color: #111;
    	text-shadow: 1px 1px 0px #166;
    }
    .add-act a:hover{
    	text-decoration: none;
    }
   .edit-act {
   	float: left;
   	color: #999;
   }
   
   .del-act {
   	float: right;
   	color: #999;
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
    
      <h4 class="add-act"><span class="glyphicon glyphicon-plus"></span> <a href="addActivity.jsp">添加新活动</a></h4>
      <c:forEach items="${activity2 }" var="node">          
      <ul id="get-activity">        
        <li class="hidden"><c:out value="${node.activity_id }"></c:out></li >
        <li><c:out value="${node.activity_time}"></c:out></li>
        <li><a href="activityDetail.jsp?type=query&activity_id=${node.activity_id}"><c:out value="${node.activity_name}"></c:out></a></li>
        <li><img src="${node.photo_path }"  ><a class="edit-act" href="editActivity.jsp?type=query&activity_id=${node.activity_id}">编辑</a><a class="del-act" href="activity.do?type=delete&activity_id=${node.activity_id}">删除</a></li>
     </ul>
    </c:forEach> 
    <ul class="pagination col-md-3 col-md-offset-4  col-sm-5 col-sm-offset-3">
      <li><a href="#">&laquo;</a></li>
      <li><a href="#">1</a></li>
      <li><a href="#">2</a></li>
      <li><a href="#">&raquo;</a></li>
    </ul>
     <form action="activity.do" method="post" id="activity-form"></form>
     </div>
<script>
   
    //dom加载过程中动态计算背景高度
    $(document).ready (function (){
        var height = $("#content-list").offset().top;
        $("#content-list").height($(document).height()-height-10);
        $("#left-list").height($(document).height()-height-10);
        if(window.location.href.indexOf("&")!== -1) {
        	var page = (window.location.href.split("&"))[2].substr(5);
        	if(parseInt(page)<=2 ){
            	$(".pagination").children().eq(page).addClass("active");   
                } 
                else {
                	$(".pagination li:last").addClass("active");   
                }
                topage= parseInt(page);
            }
            else {       
            	$(".pagination").children().eq(1).addClass("active");  
            	 topage = 1;
            }
        //权限控制
        if($("#role-name").html() !== "teacher") {
        	$(".add-act").hide();
        	$(".edit-act").hide();
        	$(".del-act").hide();
        }
      });
      window.onload = function () {     
    	  var cid = $("#mclass-id").html();
    	  $.post("activity.do?type=query&class_id="+cid+"&page="+topage, function (activity2){
             $("body").html(activity2); 
            }); 
  };
	//点击分页切换当前加载页
  	$(".pagination").click (function (e) {
    	e.preventDefault();
    	var querystrp = $(e.target).html();
    	if(isNaN(parseInt(querystrp))){
    		var currentPage= (window.location.href.split("&"))[2].substr(5);
       	 	var cpage = parseInt(currentPage);
       	 (querystrp == "«") ? querystrp = cpage-1 : querystrp = cpage+1;
   		 }
    		$("#activity-form").attr("action","activity.do?type=query&class_id=3&page="+querystrp).submit();
    }); 
	$(".del-act").click (function(e) {
		e.preventDefault();
		var str =$(this).parent().parent().children().first().text();
		$("#activity-form").attr("action","activity.do?type=delete&activity_id="+str).submit();
	});
</script>
</body>
</html>