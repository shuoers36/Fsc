<%@ page contentType="text/html; charset=utf-8" language="java" %>
  <div id="nav">
      <h2><a href="school.jsp">Xidian-16</a></h2>
      <span id="role-name">${sessionScope.sessiontest.role_name}</span>
      <span id="mclass-id">${sessionScope.sessiontest.class_id}</span>
      <span id="msubject-name">${sessionScope.sessiontest.subject_name}</span>
      <span id="mstudent-id">${sessionScope.sessiontest.student_id}</span>
       <span id="mstudent-name">${sessionScope.sessiontest.student_name}</span>
      <h3 id="muser-name">${sessionScope.sessiontest.user_name}</h3>
      <form method="post" action="logout.do"><input type="submit" value="注销" class="btn-link"></form>
  </div>
  