<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  
  <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
  
  </head>
  
  <body>
  
  <s:iterator id="item" value="#request.stuLi" status="st">
  	第 ${st.index} 条 ${item.studentID}
  	${item.studentName} <br/>
  </s:iterator>
  
  </body>
</html>
