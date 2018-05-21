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
  
  $(document).ready(function() {
	 
	 /*
	  这里调用了  ../LrxAjaxAction!loadStuList 接口
	  返回学生对象列表
	 */
	 
	 $.post("loadStuList", {"stu.StudentID":66}, function(data) {
		  var list = data.stuLi;//拿到学生列表
		  
		  //遍历学生
		  for(var i=0;i<list.length;i++) {
			  
			  var item = list[i];//第i个学生
			  
			  //对应数据库字段
			  $("#ajax-demo").html( $("#ajax-demo").html() + item.studentName + "<br>");
			  
		  }
		  
	  });
	  
  });
  
  </script>
  </head>
  
  <body>
  	
  	<div id='ajax-demo'></div>
  	
  	<!-- 调用接口 ，跳转页面，获取到数据 -->
  	<a href="loadStuListPage">DemoTest</a>
  	
  </body>
  
</html>
