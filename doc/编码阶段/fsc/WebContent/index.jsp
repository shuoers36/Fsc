<%@ page contentType="text/html; charset=utf-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>index</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="scripts/jquery.min.js"></script>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="scripts/bootstrap.min.js"></script>
<style>
body, h2, input, div, span {
	margin: 0;
	padding: 0;
}

html {
	width: 100%;
	height: 100%;
	overflow: hidden;
}

body {
	margin: 0 auto;
	width: 100%;
	background: #334;
	font-size: .625em;
}

#nav {
	width: 100%;
	height: 8em;
	background: #555;
}

#nav h2 {
	display: inline-block;
	margin-top: 15px;
	margin-left: 50px;
	color: #ddd;
	font-size: 4em;
	text-shadow: 2px 2px 10px #fff;
}

#nav h3 {
	color: #ddd;
	font-size: 2.6em;
	float: right;
	margin-right: 6em;
}

#nav a {
	display: inline-block;
	text-decoration: none;
	font-size: 2.6em;
	color: #aaa;
	float: right;
	margin-right: -6.5em;
	margin-top: 1em;
}

#left-list {
	border: 1px solid #eee;
	width: 18%;
	height: 100%;
	float: left;
}

#content-list {
	float: left;
	width: 82%;
	background: #fff;
	height: 900px;
}

#content-list form {
	margin-top: 20px;
}

#left-list li {
	background: transparent;
	color: #fff;
	font-size: 2em;
	line-height: 2em;
	padding-left: 30px;
}

#left-list li a {
	color: #fff;
	text-decoration: none;
}

#left-list li:last-child {
	border: 1px solid #fff;
}

table {
	font-size: 3em;
	color: #444;
}

#queryid {
	font-size: 3em;
	color: #444;
}
</style>
</head>
<body>
	<div id="container">
		<div id="nav">
			<h2>Xidian-16</h2>
			<h3>管理员</h3>
			<a>注销</a>
		</div>
	</div>
	<div id="left-list">
		<ul class="list-group">
			<li class="list-group-item"><a href="#user_manage">用户管理</a></li>
			<li class="list-group-item"><span class="badge">新</span> 公告管理
			</li>
			<li class="list-group-item">班级管理</li>
		</ul>
	</div>
	<div id="content-list">
		<div id="user_manager">
			<form action="usermanage.do?type=delete&User_id=33" method="post">
				<input class="btn btn-primary" type="submit" value="删除">
			</form>

			<form
				action="usermanage.do?type=add&User_id=33&User_name=vv&User_password=888"
				method="post">
				<input class="btn btn-primary" type="submit" value="添加">
			</form>

			<form
				action="usermanage.do?type=edit&User_id=33&User_name=kk&User_password=222"
				method="post">
				<input class="btn btn-primary" type="submit" value="编辑">
			</form>

			<form action="usermanage.do?type=query&User_id=33" method="post"
				id="queryid">
				<input class="btn btn-primary" type="submit" value="查询单个用户">

			</form>
			<form action="usermanage.do?type=query" method="post" id="queryid">
				<input class="btn btn-primary" type="submit" value="查询">

			</form>
			<h1>${uu.getPassword()}${uu.getId()}</h1>
			<table border="1">
				<c:forEach items="${nlist}" var="node">
					<tr>
						<td><c:out value="${node.getId()}"></c:out></td>
						<td><c:out value="${node.getUserName()}"></c:out></td>
						<td><c:out value="${node.getPassword()}"></c:out></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>