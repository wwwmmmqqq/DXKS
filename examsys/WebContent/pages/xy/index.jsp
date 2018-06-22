<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html; charset=UTF-8"%>
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
	/**
		修改试卷接口---先查看再修改
		参数：paper.sid
		返回值：paper
	*/
	$.post("deleteExamPlan",
			 {	"exam.sid":"1",   //用户名
		},function(data){
			alert(data.result);    //result为user返回信息
		 })	
  </script>
  
  </head>
  
  <body>
  
  
  
  	 用户查看题库
  <!-- 	<a href="showItemAction?question.sid=58">lianjie</a> -->
  	<!-- 修改题库&&添加：
  	<form action="editItemBankByUser" method="post">
  	<input type="hidden" name="question.sid" value="56"/>
  	题目：<input type="text" name="question.title" value="huahuahau"/><br/>	
  	题目类型：<input type="text" name="question.type" id="questiontype"/><br/>
  	选项个数<input type="hidden" name="question.choiceCount" id="choiceCount"><br />
  	<input type="hidden" name="option[0].sid" value="51"/>
  	选项：<input type="text" name="option[0].content" value="balalala"/><br/>
  	是否为答案：<input type="text" name="option[0].isAnswer" value="0"/><br/>   后面一定要加"[]"
  		<input type="hidden" name="option[1].sid" value="52"/>
  	选项：<input type="text" name="option[1].content" value="balalala"/><br/>
  	是否为答案：<input type="text" name="option[1].isAnswer" value="0"/><br/> 
  		<input type="hidden" name="option[2].sid" value="53"/>
  	选项：<input type="text" name="option[2].content" value="balalala"/><br/>
  	是否为答案：<input type="text" name="option[2].isAnswer" value="0"/><br/> 
  		<input type="hidden" name="option[3].sid" value="54"/>
  	选项：<input type="text" name="option[3].content" value="balalala"/><br/>
  	是否为答案：<input type="text" name="option[3].isAnswer" value="0"/><br/> 
  	
  	
  	<input type="submit" value="tijiao" onclick="f()">
  	</form>					  -->
 	
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
 	
 	删除题库
 	<!-- <form action="deleteItemBank" method="post">
  	<input type="hidden" name="question.sid" value="56"/>
  	题目：<input type="text" name="question.title" value="huahuahau"/><br/>	
  	题目类型：<input type="text" name="question.type" id="questiontype"/><br/>
  	选项个数<input type="hidden" name="question.choiceCount" id="choiceCount"><br />
  	<input type="hidden" name="option[0].sid" value="51"/>
  	选项：<input type="text" name="option[0].content" value="balalala"/><br/>
  	是否为答案：<input type="text" name="option[0].isAnswer" value="0"/><br/>   后面一定要加"[]"
  		<input type="hidden" name="option[1].sid" value="52"/>
  	选项：<input type="text" name="option[1].content" value="balalala"/><br/>
  	是否为答案：<input type="text" name="option[1].isAnswer" value="0"/><br/> 
  		<input type="hidden" name="option[2].sid" value="53"/>
  	选项：<input type="text" name="option[2].content" value="balalala"/><br/>
  	是否为答案：<input type="text" name="option[2].isAnswer" value="0"/><br/> 
  		<input type="hidden" name="option[3].sid" value="54"/>
  	选项：<input type="text" name="option[3].content" value="balalala"/><br/>
  	是否为答案：<input type="text" name="option[3].isAnswer" value="0"/><br/> 
  	<input type="submit" value="tijiao" onclick="f()">
  	</form> -->
  	
  	
  </body>
  <%-- <script type="text/javascript">
 /*  var f= function()
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
  } */ 
  	
  </script> --%>
</html>
