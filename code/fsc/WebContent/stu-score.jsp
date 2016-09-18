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
      #search-all td {
      	width: 33%;
      }
      .table-responsive h4 {
      	margin-left: 20px;
      }
      #search-all thead {
      	background: #888;
      	color: #fff;
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
   <h4 class="teach-class"></h4> 
    <table class="table table-bordered table-condensed" id="search-all">
        <thead>
            <tr class="item">
                <th>学科</th>
                <th>分数</th>
                <th>时间</th>
            </tr>
        </thead>
        <tbody id="lis">
            <c:forEach items="${score1}" var="node">  
      <tr>
        <td><c:out value="${node.subject_name}"></c:out></td>
        <td><c:out value="${node.score}"></c:out></td>
        <td><c:out value="${node.score_time}"></c:out></td>
      </tr>
   </c:forEach>  
        </tbody>
    </table>
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
    	var str = $("#mstudent-id").html();
    	var str2 = $("#mstudent-id").html();
    	$(".teach-class").html("学号:"+str2);
    	$.post("score.do?Student_id="+str, function (score1){
    	    	 $("body").html(score1); 
    	    }); 
	};
</script>
</body>
</html>