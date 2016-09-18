<%@ page contentType="text/html; charset=utf-8" language="java" %>
<ul class="list-group">
    <li class="list-group-item menu"><a href="school.jsp" >学校简介</a></li>
    <li class="list-group-item menu" id="user-manage"><a href="userManage.jsp" >用户管理</a></li>
    <li class="list-group-item menu">
        <span class="badge">新</span>
        <a href="activity.jsp" >学生活动</a>
    </li>
    <li class="list-group-item menu"><a href="attendance.jsp">学生考勤</a></li>
    <li class="list-group-item menu" ><a href="class.jsp">班级管理</a></li>
    <li class="list-group-item menu"><a href="score.jsp" id="score-menu">学生成绩</a></li>
    <li class="list-group-item menu"><a href="homework.jsp" id="homework-menu">作业管理</a></li>
    <li class="list-group-item menu"><a href="message.jsp" >留言交流</a></li>
    <li class="list-group-item menu"><a href="announcementindex.jsp" >公告消息</a></li>
    <li class="list-group-item menu"><a href="honor.jsp" >奖惩记录</a></li>
    <li class="list-group-item menu"><a href="comment.jsp" id="comment-menu">评语记录</a></li>
</ul> 

<script>
	var menu = document.getElementsByClassName("menu");
	var roleName = document.getElementById("role-name");
	var scoreMenu = document.getElementById("score-menu");
	var homeworkMenu = document.getElementById("homework-menu");
	var commentMenu = document.getElementById("comment-menu");
	var show = "display: block";
	var hide = "display: none";
	if(roleName.innerHTML == "manage") {
		var arr = [0,1,4,7,8];
		for(var key in arr) {
			menu[arr[key]].style.cssText = show;
		}
	}
	if(roleName.innerHTML == "teacher") {
		var arr = [0,2,5,6,7,8,10];
		for(var key in arr) {
			menu[arr[key]].style.cssText = show;
		}
		
		
	}
	
	if(roleName.innerHTML == "student") {
		var arr = [0,2,3,5,6,7,8,9,10];
		for(var key in arr) {
			menu[arr[key]].style.cssText = show;
		}
		scoreMenu.setAttribute("href","stu-score.jsp");
		homeworkMenu.setAttribute("href","stu-homework.jsp");
		commentMenu.setAttribute("href","stuComment.jsp");
	}
	if(roleName.innerHTML == "parent") {
		var arr = [0,2,3,5,6,7,8,9,10];
		for(var key in arr) {
			menu[arr[key]].style.cssText = show;
		}
		scoreMenu.setAttribute("href","stu-score.jsp");
		homeworkMenu.setAttribute("href","stu-homework.jsp");
		commentMenu.setAttribute("href","stuComment.jsp");
	}
	if(roleName.innerHTML == "leader") {
		var arr = [0,7,8];
		for(var key in arr) {
			menu[arr[key]].style.cssText = show;
		}
	
	}
</script>