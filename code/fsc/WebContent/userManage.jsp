<%@ page contentType="text/html; charset=utf-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE html>
<html>
<head>
  <title>用户管理</title>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="scripts/jquery.min.js"></script>
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <link rel="stylesheet" href="css/layout.css">
  <script src="scripts/bootstrap.min.js"></script>
  
  <style>
    #user-manage {
   	border-right: 3px outset #fff;
    }
    table {
    font-size: 2.3em;
    color: #444;
    }
    table .item {
      background: #ccc;
    }
    table td a:first-child {
      margin-right: 1em;
    }
    table td a+a {
      margin-left: 1em;
    }
    table td {
      width:  20%;
    }  
    #query {
      margin-left: 70px;
      margin-bottom: .4em;
      font-size: 2.4em;
      color: #444;     
      display: inline-block;
    }
    #search-name {
      margin-bottom: 0;
      display: none;
    }
    .pagination {
    	position: fixed;
    	top: 80%;
    	left: 47%; 
    	display: block; 
    	font-size: 3em; 
    }
    .modal-body {
      font-size: 2em;
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
      <div id="user_manager">
   <form id="query" class="form-inline ">
      <label for="queryname" class="control-label">用户名</label>
    <input type="text" name="queryname" class="form-control"  id="queryname">
      <button type="button" class="btn btn-primary form-control" id="search">搜索</button> 
      <a class="btn btn-primary form-control" href="addUser.jsp">添加新用户</a>    
  </form>
    <table class="table table-bordered table-condensed table-responsive" id="search-name">
      <tr id="getuname">
        <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td><a href="" class="edit-user" data-toggle="modal" data-target="#myModal">修改</a>|<a href="" class="del-user">删除</a></td>
      </tr>
    </table>
    <div class="table-responsive">
    <table class="table table-bordered table-condensed" id="search-all">
        <thead>
            <tr class="item">
                <th>ID</th>
                <th>用户名</th>
                <th>密码</th>
                <th>类型</th>
                <th>管理操作</th>
            </tr>
        </thead>
        <tbody id="lis">
            <c:forEach items="${nulist}" var="node">  
      <tr>
        <td><c:out value="${node.id}"></c:out></td>
        <td><c:out value="${node.userName}"></c:out></td>
        <td><c:out value="${node.password}"></c:out></td>
        <td><c:out value="${node.role_name}"></c:out></td>
        <td><a  class="edit-user " href=""  data-toggle="modal" data-target="#myModal">修改</a>|<a href="" class="del-user">删除</a></td>
      </tr>
   </c:forEach>  
        </tbody>
    </table>
</div> 
	<!--模态框  -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">编辑用户</h4>
            </div>
            <div class="modal-body">
            	 <form role="form" method="post" action="usermanage.do?type=edit">
  				        <div class="form-group">
                      <label for="editUser_id">用户Id</label>
                      <input type="text" class="form-control"  name="User_id" id="editUser_id" readonly>
                  </div>
                  <div class="form-group">
        		          <label for="name">用户名</label>
                      <input type="text" class="form-control" placeholder="请输入用户名" name="User_name">
                  </div>
                  <div class="form-group">
                      <label for="password">密<span class="pwd-spacing"></span>码</label>
                      <input type="password" class="form-control add-element"  placeholder="请输入用户密码" name="User_password">
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
    <form method="post" id="userForm" name="userForm"></form> 
   	<ul class="pagination col-md-4 col-md-offset-4  col-sm-5 col-sm-offset-3">
   		<li><a href="#">&laquo;</a></li>
   		<li><a href="#">1</a></li>
   		<li><a href="#">2</a></li>
   		<li><a href="#">3</a></li>
   		<li><a href="#">4</a></li>
   		<li><a href="#">5</a></li>
   		<li><a href="#">&raquo;</a></li>
   	</ul>
   </div>
 </div>
 <script src="scripts/clickLoad.js"></script>
 <script>
   
    //dom加载过程中动态计算背景高度
     $(document).ready (function (){
        var height = $("#content-list").offset().top;
        $("#content-list").height($(document).height()-height-10);
        $("#left-list").height($(document).height()-height-10);
        if(window.location.href.indexOf("&")!== -1) {
        	var page = (window.location.href.split("&"))[1].substr(5);
            if(parseInt(page)< 6 ){
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
    	
    	$.post("usermanage.do?type=query&page="+topage, function (nlist){
    	    	 $("body").html(nlist); 
    	      }); 
	};
   //点击用户列表的删除，删除该用户
       $(".del-user").click(function (event) {
        event.preventDefault();
        var querystr=$(this).parent().parent().children().first().text();
    	
    	$.post("usermanage.do?type=delete&&User_id="+querystr,function (){$.post("usermanage.do?type=query&page="+topage, function (nlist){
	    	 $("body").html(nlist); 
	      }); });
      }); 
    	
   /*  ajax查询单个用户
                  判断Json对象是否为空
     function isEmptyObject(e) {
      var t;
      for (t in e)
        return !1;
      return !0;
    } */
    
    //查询单个用户，点击按钮或者按下回车
    $("#search").click(function searchName(){
      var querystr2=$("#queryname").val();
      $.ajax({ url: "usermanage.do", data:"type=query&User_name="+querystr2,type: "post",dataType: "json",context: $("#getuname"), success: function(data){
       var auser = data.uu;
       console.log(auser);
      if (auser.id !== 0){
       $(this).children().eq(0).html(auser.id);
       $(this).children().eq(1).html(auser.userName);
       $(this).children().eq(2).html(auser.password);
       $(this).children().eq(3).html(auser.role_name);
       $("#search-name").show();
     }
      else {
        $(this).html("该用户不存在");
      }
     } 
   });     
  });
      $("#queryname").keydown(function (e){
        if(e.keyCode == 13) {
           e.preventDefault();
           console.log("ss");
           $("#search").click();
        }
      });
    //修改单个用户信息
    $(".edit-user").click (function(e) {
      e.preventDefault();
        var querystr=$(this).parent().parent().children().first().text();
        $("#editUser_id").val(querystr);
    });
    //点击分页切换当前加载页
    $(".pagination").click (function (e) {
      e.preventDefault();
      var querystrp = $(e.target).html();
      if(isNaN(parseInt(querystrp))){
    	 var currentPage= (window.location.href.split("&"))[1].substr(5);
    	 var cpage = parseInt(currentPage);
    	 (querystrp == "«") ? querystrp = cpage-1 : querystrp = cpage+1;
      }
      $("#userForm").attr("action","usermanage.do?type=query&page="+querystrp).submit();
      }); 
    
 </script>
</body>
</html>