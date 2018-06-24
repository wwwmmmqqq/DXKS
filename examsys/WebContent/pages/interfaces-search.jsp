<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	  <meta charset="utf-8">
	  <script type="text/javascript" src="../js/jquery-3.2.1.min.js"></script>
	  <script type="text/javascript">
	  function searchQuestions() {
		  $.post("searchQuestions", {
			  "keys[0]":"title",//搜索的字段1
			  "values[0]":"题目标题"//搜索的关键字1
		  }, function(data) {
			  alert(data.result);
			  alert(data.list);
		  });
		  
		  $.post("registUser", {
			  "user.userId":"asdfasdf",//
			  "user.psw":"xclgkjadslfj",//
			  "user.email":"xclgkjadslfj"//
		  }, function(data) {
			  alert(data.result);//success fail exist
		  });
	  }
	  searchQuestions();
	  </script>
	  
  </head>
  
  <body>
  	<div id='box'></div>
  </body>
</html>