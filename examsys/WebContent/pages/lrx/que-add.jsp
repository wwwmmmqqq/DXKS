<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>添加题目</title>
  </head>
  
  <body>
  	<div><textarea id="title" rows="6" cols="30" placeholder="题目"></textarea></div>
  	<div><input id="diff" type="number" placeholder="难度(1-4)"></div>
  	<div><input id="know" type="text" placeholder="知识点"></div>
  	<div><button>添加题目</button></div>
  </body>
</html>
