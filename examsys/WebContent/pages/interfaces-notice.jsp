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
	  function loadNoticeCount() {
		/**获取我的消息数量*/
	  	$.post("loadNoticeCount", null, function(data) {
	  		$('#box').html("消息数量：" + data.result);
	  	});
	  }
	  
	  function loadNoticeList(page) {
		  /**获取通知列表*/
		  $.post("loadNoticeList", {
			  "page":page//第几页
		  }, function(data) {
			  var list = data.list;//列表
			  var html = "";
			  for(var i=0;i<list.length;i++) {
				  html += "通知的id = <a href='javascript:readNotice("+list[i].sid+")'>" + list[i].sid +"</a>";//获取到通知的id
				  html += "，通知的类型 = " + list[i].type;//获取到通知的类型
				  html += "，通知的标题 = " + list[i].title ;//获取到通知的标题
				  html += "，通知的内容 = " + list[i].content;//获取到通知的内容
				  html += "<br>";
			  }
			  $('#notice-box').html(html);
		  });
	  }
	  
	  function readNotice(noticeSid) {
		  /**接口：标记某个通知已读*/
		  $.post("readNotice", {
			  "sid":noticeSid
		  }, function(data) {
			  if(data.result == 'success') {
				  location.reload();
			  }
		  });
	  }
	  </script>
	  
	  
	  <!-- 测试接口 -->
	  <script type="text/javascript">
	  loadNoticeCount();//测试获取消息数量
	  loadNoticeList(1);//测试获取推送列表
	  </script>
	  
  </head>
  
  <body>
   	【通知相关的接口】
  	当前用户：${session.user.userId} ${session.user.name} ${session.user.sex} ${session.user.collegeName}
  	<div id='box'></div>
  	<div id="notice-box"></div>
  </body>
</html>