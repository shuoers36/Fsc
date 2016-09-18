<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
<title>学生成绩</title>
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
      table {
        font-size: 1.2em;
        color: #444;
      }
      table .item {
        background: #888;
      	color: #fff;
      }
      table td a:first-child {
        margin-right: 1em;
      }
      table td a+a {
        margin-left: 1em;
      }
      table td {
        width:  25%;
      }  
      .teach-class {
      	float: left;
      	margin-left: 20px;
      }
      .teach-subject {
      	text-align: center;
      }
      .pagination {
    	float: none;
    	position: absolute;
    	top: 80%;
    	left: 50%;
    	display: block; 
    	font-size: 1.5em; 
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


<div class="table-responsive">
   <h4 class="teach-class"></h4> <h4 class="teach-subject"></h4> 
    <table class="table table-bordered table-condensed" id="search-all">
        <thead>
            <tr class="item">
                <th>姓名</th>
                <th>分数</th>
                <th>添加时间</th>
            </tr>
        </thead>
        <tbody id="lis">
            <c:forEach items="${score2}" var="node">  
      <tr>
        <td><c:out value="${node.student_name}"></c:out></td>
        <td><c:out value="${node.score}"></c:out></td>
        <td><c:out value="${node.score_time}"></c:out></td>
      </tr>
   </c:forEach>  
        </tbody>
    </table>
</div> 

<form method="post" id="scoreForm" name="scoreForm"></form> 
   	<ul class="pagination col-md-3 col-md-offset-4  col-sm-5 col-sm-offset-3">
   		<li><a href="#">&laquo;</a></li>
   		<li><a href="#">1</a></li>
   		<li><a href="#">2</a></li>
   		<li><a href="#">&raquo;</a></li>
   	</ul>
</div>
<script>
   
    //dom加载过程中动态计算背景高度
    $(document).ready (function (){
        var height = $("#content-list").offset().top;
        $("#content-list").height($(document).height()-height-10);
        $("#left-list").height($(document).height()-height-10);
        if(window.location.href.indexOf("&")!== -1) {
        	var page = (window.location.href.split("&"))[2].substr(5);
            if(parseInt(page)< 3 ){
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
      });
	window.onload = function () {   	
    	var str1 = $("#mclass-id").html();
    	$(".teach-class").html(str1);
    	var str2 = $("#msubject-name").html();
    	$(".teach-subject").html(str2);
		$.post("scoreByTeacher.do?Class_id="+str1+"&Subject_name="+str2+"&page="+topage, function (score2){
    	    	 $("body").html(score2); 
    	    }); 
	};
	$(".pagination").click (function (e) {
	      e.preventDefault();
	      var str1 = $("#mclass-id").html();
	      var str2 = $("#msubject-name").html();
	      var querystrp = $(e.target).html();
	      if(isNaN(parseInt(querystrp))){
	    	 var currentPage= (window.location.href.split("&"))[2].substr(5);
	    	 var cpage = parseInt(currentPage);
	    	 (querystrp == "«") ? querystrp = cpage-1 : querystrp = cpage+1;
	      }
	      $("#scoreForm").attr("action","scoreByTeacher.do?Class_id="+str1+"&Subject_name="+str2+"&page="+querystrp).submit();
	      }); 
	
	//修改单个分数
	$(".edit-score").click (function(e) {
      e.preventDefault();
        var querystr=$(this).parent().parent().children().first().text();
        $("#editUser_id").val(querystr);
    });
</script>
</body>
</html>