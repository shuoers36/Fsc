
<%@ page contentType="text/html; charset=utf-8" language="java"%>
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
input, ul {
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
	font-family: Courier;
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
	width: 7em;
	background: transparent;
	border: 1px solid #fff;
}

#close-form {
	font-size: 3em;
	color: #fff;
	float: right;
	margin-top: -30px;
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
</style>
</head>
<body>
	<div class="container">
		<div id="shadow">
			<div class="row">
				<div class="col-lg-4 lead" id="logo">Xidian-16</div>
				<div id="fsc" class="col-lg-12">Hwadee-FSC</div>
				<div id="login-button" class="col-lg-12">
					<button type="button" class="btn btn-primary">点此登录</button>
				</div>
				<div class="col-lg-10" id="login-form">
					<form class="form-horizontal" role="form" action="login.do"
						method="post">
						<span id="close-form">X</span>
						<div class="form-group">
							<label for="firstname" class="col-lg-3 control-label">用户名</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" id="firstname"
									placeholder="请输入用户名" name="userName">
							</div>
						</div>
						<div class="form-group">
							<label for="lastname" class="col-lg-3 control-label">密&nbsp;&nbsp;码 </label>
							<div class="col-lg-8">
								<input type="text" class="form-control" id="lastname"
									placeholder="请输入密码" name="passWord">
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<div class="checkbox">
									<label> <input type="checkbox"> 记住登录状态
									</label>
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<button type="submit" class="btn btn-default">提交</button>
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
		$("#login-button").click(function() {
			$(this).hide();
			$("#login-form").fadeIn(1000);
			$("#shadow").css("background", "rgba(50,50,50,.5)");
		});
		$("#close-form").click(function() {
			$("#login-form").fadeOut();
			$("#shadow").css("background", "transparent");
			$("#login-button").fadeIn();
		});
	</script>
</body>
</html>


