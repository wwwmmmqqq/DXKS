<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <script type="text/javascript" src="../../js/jquery-3.2.1.min.js"></script>
  
  <script type="text/javascript">
  
  </script>
  </head>
  
  <body>
  	<form action="loginAction" method="post">
  		<div>name<input type="text" name="userId"  placeholder="请输入学号"/></div>
  		<div>password<input type="text" name="psw" placeholder="请输入密码"/></div>
  	</form>
  </body>
  
</html>
