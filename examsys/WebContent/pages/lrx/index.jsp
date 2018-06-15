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
  
  <%-- <script type="text/javascript">
  $(document).ready(function() {
	 
	 /*
	  这里调用了  ../LrxAjaxAction!loadStuList 接口
	  返回学生对象列表
	 */
	 
	 $.post("loadStuList", { "stu.name":'asdf' }, function(data) {
		  
		  var list = data.list;//拿到学生列表
		  
		  //遍历学生
		  for(var i=0;i<list.length;i++) {
			  
			  var item = list[i];//第i个学生
			  
			  //对应数据库字段
			  $("#container").html( $("#container").html() + item.name + "<br>");
			  
		  }
		  
	  });
	  
	 
	 
  });
  </script> --%>
  
  <script type="text/javascript">
	  $.post("updateStuInfos", {
		  "params[0]":'aaa',
		  "params[1]":'bbb',
		  "params[2]":'ccc',
		  "params[5]":'ddd'
	  }, function(data) {
		  alert(data.result);
	  });
  </script>
  </head>
  
  <body>
  	
  	<div id='container'></div>
  	
  	<a href="pagination.jsp">分页demo</a>
  	
  	<a href="pagination-plus.jsp">分页 demo+</a>
  	
  </body>
  
</html>
