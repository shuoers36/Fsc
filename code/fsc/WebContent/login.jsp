 <%@ page contentType="text/html; charset=utf-8" language="java" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE html>
<html>
<head>
  <title>login</title>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="scripts/jquery.min.js"></script>
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <script src="scripts/bootstrap.min.js"></script>
  
  <style>
  html {
  	height:100%;  
  }
  input,ul {
    margin: 0;
    padding: 0;
  }
  body {
    margin: 0;
    width: 100%;
    min-width: 100%;
    height: 100%;
    font-size: .625em;
    font-family: Verdana;
    overflow: hidden;
  }
  .container {
    width: 100%;
    height: 650px;
    min-height:100%;
    background: url(images/background.jpg) top center;
    background-size: cover;  
    padding: 0;
    margin: 0;
    
  }
  #logo {
    color: #fff;
    margin-top: 30px;
    margin-left: 30px;
    font-size: 6em;
    opacity: .5;
  }
  .btn.btn-primary {
    background: transparent;
    border-color: #fff;
    color: #fff;
    width: 11em;
    height: 40px;
    text-align: center;
    letter-spacing: .3em;
    font-size: 2.5em;
  }
  #login-button {
    text-align: center;
    margin-top: 160px;
  }
  #fsc {
    font-size: 9em;
    color: #fff;
    font-family: Courier ;
    text-align: center;
    margin-top: -45px;
    text-shadow: 2px 2px 10px #fff;
  }
  #shadow {
    height: 100%;
    width: 100%;
  }
  #login-form {
    position: absolute;
    top: 52%;
    left: 50%;
    width: 400px;
    height: 300px;
    margin-left: -200px;
    margin-top: -200px;
    border: 1px solid #fff;
    display: none;
    padding-top: 45px;
  }
  #login-form label {
    font-size: 2.3em;

  }
  button[type="submit"] {
    float: right;
    width: 8em;
    margin: 1.3em 2.5em;
  }
  button[type="submit"]:hover {
  	box-shadow: 2px 2px 2px #444;
  }
  #close-form {
    font-size: 3em;
    color: #fff;
    float: right;
    margin-top: -60px;
    text-shadow: 3px 3px 4px #111;
  }
  #register {
    position: absolute;
    bottom: 28%;
    left: 55%;
    font-size: 2.7em;  
    width: 5.5em; 
     text-decoration: none;
     color: #0cc;
  }
  #register:hover {
    text-shadow: 2px 2px 3px #888;
  }
  .u-form {
  	margin-top: 30px;
  }
  #info {
  	color: #900;
  	font-size: 2em;
  }
  #uuu {
  float: left;
  }
  #ppp {
  float: left;
  }
  </style>
</head>
<body>
<div class="container">
  <div id="shadow">
    <div class="row" >
            <div class="col-lg-4 lead" id="logo">
              Xidian-16 
            </div>
            <div id="fsc" class="col-lg-12">
              Hwadee-FSC
            </div>
             
            <div id="login-button" class="col-lg-12">
              <button type="button" class="btn btn-primary">点此登录</button>
            </div>
            <div class="col-lg-10" id="login-form">
            <form class="form-horizontal" role="form" action="login.do" method="post">
            <span id="close-form">X</span>
         <div class="form-group u-form">
            <label for="username" class="col-lg-3 control-label" id="uuu">用户名</label>
            <div class="col-sm-8">
               <input type="text" class="form-control" id="username" name="username"
                  placeholder="请输入用户名" required>
            </div>
         </div>
         <div class="form-group u-form">
            <label for="password" class="col-lg-3 control-label" id="ppp">密&nbsp;&nbsp;码 </label>
            <div class="col-sm-8">
               <input type="password" class="form-control" id="password" name="password"
                  placeholder="请输入密码" required>
            </div>
         </div>

         <div class="form-group u-form">
            <div class="col-sm-offset-2 col-sm-10">
             <span id="info"><c:out value="${info}" /></span><button type="submit" class="btn btn-default">提交</button>
            </div>
         </div>
        </form>
      </div>
      <div>
        <a href="register.html" id="register">新用户注册</a>
      </div>
    </div>
  </div>
</div>
<script>
  var showForm = function () {	  
	  $("#login-button").hide();
	  $("#login-form").fadeIn(1000);
	  $("#shadow").css("background","rgba(50,50,50,.5)"); 
	
  }  
  var state = {
		  url: "login.jsp"
  };
  $("#login-button").click (showForm);
  $("#close-form").click (function() {
	  history.pushState(state,null,state.url);
	  $("#info").text("");
	  $("#login-form").fadeOut();
      $("#shadow").css("background","transparent"); 
      $("#login-button").fadeIn();
  });
  console.log($("#info").text());
  $(document).ready( function(){
	  if($("#info").text()) {
		  showForm();  
	  }	  
  });
  $("#username").focus( function(){
	  $("#info").text("");
  });
  $("#password").focus( function(){
	  $("#info").text("");
  });
</script>
</body>
</html>


