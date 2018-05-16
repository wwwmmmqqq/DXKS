<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
  <head>
    <title>Demo</title>
    
    <!-- 公共的 JQuery 引用  = 上级目录的上级目录的js目录-->
    <link rel="stylesheet" type="text/css" href="../../js/jquery-3.2.1.min.js" />
  </head>
  
  <body>
  
	  <div class="demo-box" style="width: 680px;margin: auto;">
	  	
	  </div>
  
  </body>
  
</html>
