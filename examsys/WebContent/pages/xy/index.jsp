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
  
  
  </head>
  
  <body>
  <!-- 	<a href="createItemBank?question.title=1+1=()&question.type=选择题&option.content=等于2&option.isAnswer=1&option.content=等于3&option.content=等于4&option.content=等于5&user.userId=123">lianjie</a> -->
  	<!-- <a href="createItemBank?question.title=1+1=()&question.type=选择题">lianjie</a> -->
  	<form action="createItemBank" method="post">
  	题目：<input type="text" name="question.title"/><br/>	
  	题目类型：<input type="text" name="question.type" id="questiontype"/><br/>
  	选项个数<input type="hidden" name="question.choiceCount" id="question.choiceCount"><br />
  	选项：<input type="text" name="option.content"/><br/>
  	是否为答案：<input type="text" name="option.isAnswer"/><br/>
  	选项：<input type="text" name="option.content"/><br/>
  	是否为答案：<input type="text" name="option.isAnswer"/><br/>
  	选项：<input type="text" name="option.content"/><br/>
  	是否为答案：<input type="text" name="option.isAnswer"/><br/>
  	选项：<input type="text" name="option.content"/><br/>
  	是否为答案：<input type="text" name="option.isAnswer"/><br/>
  	<input type="submit" value="tijiao">
  	</form>					
  </body>
  <script type="text/javascript">
 
   $(document).ready(function(){  
      var val = $("#questiontype").val(); //获取  
      alert(val)
      if(val=="判断题"){
    	  $("#question.choiceCount").val("2");
      }else if(val=="选择题"){
    	  $("#question.choiceCount").val("4");
      }else {
    	  $("#question.choiceCount").val("0");
      }
  });   
  </script>
</html>
