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
			  "values[0]":"题目标题1",//搜索的关键字1
			  "keys[1]":"time",//搜索的字段2
			  "values[1]":"2018-06-22"//搜索的关键字2 
			  //.....
		  }, function(data) {
			  alert(data.result);
			  alert(data.list);
		  });
	  }
	  searchQuestions();
	  </script>
	  
  </head>
  
  <body>
  	<div id='box'></div>
  </body>
</html>