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
  function loadData(page) {
	 /*
	    接口 loadStuListPageCount 
	    参数  page 表示第几页
	    返回  list //学生对象列表
	 */
	  $.post("loadStuList", { "page":page }, function(data) {
		  
		  var list = data.list;//拿到学生列表
		  
		  //清空data-container里面的内容
		  $("#data-container").html('');
		  
		  //遍历学生
		  for(var i=0;i<list.length;i++) {
			  
			  var item = list[i];//第i个学生
			  //对应数据库字段
			  $("#data-container").html($("#data-container").html() + item.name + "<br>");
		  }
		  
	  });
  }
  
  $(document).ready(function() {
	 /*
	    接口 loadStuListPageCount 
	    返回 result ：页面
	 */
	 
	 var pagination_html = "";
	 $.post("loadStuListPageCount", null, function(data) {
		 
		 alert("一共：" + data.result + "页");
		 
		 for(var i=1;i<=4;i++) {
		 	pagination_html += "<div class='page' onclick='loadData("+i+")'>"+i+"</div>";
		 }
		 
		 $('#pagination-box').html(pagination_html);
	 });
	 
	 //加载第一页的数据
	 loadData(1);
	 
  });
  
  
  </script>
  
  <style type="text/css">
  .page {cursor:pointer;width: 20px;height: 20px;float: left;border: 1px solid;text-align: center;}
  </style>
  
  </head>
  
  <body>
  
  	<div id='data-container' style="min-height: 300px"></div>
  	
  	<div id="pagination-box"></div>
  	
  </body>
  
</html>
