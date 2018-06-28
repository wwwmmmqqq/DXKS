<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>页面跳转</title>
    <script type="text/javascript">
    if("${session.user.type}" == '学生') {
    	location.replace("pages/student/student-main.jsp");
    } else if ("${session.user.type}" == '教师') {
    	location.replace("pages/gy/history_teacher.jsp");
    } else if ("${session.user.type}" == '教务') {
    	location.replace("pages/lxh/staffs_student.jsp");
    } else if("${session.user.type}" == 'admin' 
    		|| "${session.user.type}" == '管理员') {
    	location.replace("pages/gy/admin.jsp");
    } else {
    	location.replace("pages/gy/login.jsp");
    }
    </script>
  </head>
  <body>
  </body>
</html>
