<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>新建留言</title>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="scripts/jquery.min.js"></script>
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <link rel="stylesheet" href="css/layout.css">
  <script src="scripts/bootstrap.min.js"></script>
  <style>
  	#content-list {
  		font-size: 2.3em;
  	}
  	#add-form {
  		padding: 0; 
  	}
    input.add-element {
      	display: inline;
      	width: 50%;
     }
     span.pwd-spacing {
      	display: inline-block;
      	width: 1em;
     }
     #panel-head {
     	background: rgba(54, 215, 183,.6);
     	color: #fff;
     	margin: 0;
     }
     .button-style {
     	margin-left: 35px;
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
 	
 	<div class="col-md-8 col-md-offset-2  col-xs-8 panel panel-default" id="add-form">
   <div class="panel-heading " id="panel-head">新建消息</div>
   <div class="panel-body col-lg-12 col-xs-12">
   <form role="form" method="post" action="message.do?type=insert" id="message-form">
    <div class="form-group">
        <label for="addressee_name">收件人 </label>
         <input type="text" class="form-control add-element" placeholder="请输入收件人的用户名" name="addressee_name" id="addressee_name" required>
    </div>
    <div class="form-group">
        <label for="message_title">主<span class="pwd-spacing"></span>题</label> 
         <input type="text" class="form-control add-element"  placeholder="请输入信息主题" name="message_title" id="message_title" required>
    </div>
    <div class="form-group">
       		<textarea rows="15"  name="message_content" class="message_content form-control"></textarea>
		</div>

    <button type="submit" class="btn btn-success btn-default button-style">提交</button>
    <a href="message.jsp"><button type="button" class="btn btn-info btn-default button-style">返回</button></a>
  </form>
  </div> 
</div>
 	
</div>
<script>
$(document).ready (function (){
	var height = $("#content-list").offset().top;
	$("#content-list").height($(document).height()-height-10);
	$("#left-list").height($(document).height()-height-10);
});

window.onload = function (){
	var str = $("#muser-name").html();
	$("#message-form").attr("action","message.do?type=insert&user_name="+str);
}
</script>
</body>
</html>