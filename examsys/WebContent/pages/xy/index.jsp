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
  	 用户查看题库
  	<a href="showItemAction?question.sid=58">lianjie</a>
  	<!--添加题库：
  	<form action="editItemBankByUser" method="post">
  	<input type="hidden" name="question.sid" value="61"/>
  	题目：<input type="text" name="question.title"/><br/>	
  	题目类型：<input type="text" name="question.type" id="questiontype"/><br/>
  	选项个数<input type="hidden" name="question.choiceCount" id="choiceCount"><br />
  	<input type="hidden" name="option[0].sid" value="62"/>
  	选项：<input type="text" name="option[0].content"/><br/>
  	是否为答案：<input type="text" name="option[0].isAnswer"/><br/>   后面一定要加"[]"
  	
  	
  	<input type="submit" value="tijiao" onclick="f()">
  	</form>		 -->			 
 	
 	按类型查看题目
 	<%-- <form action="showItemBankListByType" method="post">
 		查询类型：
 		<select name="question.type">
 			<option value ="选择题">选择题</option>
  			<option value ="填空题">填空题</option>
  			<option value="主观题">主观题</option>
 		</select>
 		<input type="submit" value="tijiao">
 	</form> --%>
  </body>
  <script type="text/javascript">
  var f= function()
  {
    	var val = $("#questiontype").val(); //获取  
    	alert(val);
        if(val=="判断题"){
      	  $("#choiceCount").val("2");
        }else if(val=="选择题"){
      	  $("#choiceCount").val("4");		 //是2个Option对象
        }else {
      	  $("#choiceCount").val("1");       //是一个Option对象
        }
        var val1 = $("#choiceCount").val(); //获取 
        alert(val1);
  }
  
  </script>
</html>
