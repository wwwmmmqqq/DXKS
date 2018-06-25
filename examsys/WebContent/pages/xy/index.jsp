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
	$.post("createExamPlan",
			 {	"exam.title":"1",   //用户名
		 		"user.userId":"34"				//用户类型
		 	},function(data){
		 		alert(data.result);    //message为user返回信息
			 }
		)
  </script>
  
  </head>
  
  <body>
  
   <script type="text/javascript">
       /* //全选、全反选
        function doSelectAll(){
            // jquery 1.6 前
            //$("input[name=selectedRow]").attr("checked", $("#selAll").is(":checked"));
            //prop jquery 1.6+建议使用
            $("input[name=selectedRow]").prop("checked", $("#selAll").is(":checked"));        
        } */
 
    function doExportExcel(){
          window.open("export.action");
      }
    </script>


                    <div>
           <input type="button" value="导出" class="s_button" onclick="doExportExcel()"/>&nbsp;
                        </div>       
  
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
  	
  	<!-- <form action="createItemBank" method="post">
  	<input type="hidden" name="question.sid" />
  	题目：<input type="text" name="question.title" value="huahuahau"/><br/>	
  	题目类型：<input type="text" name="question.type" id="questiontype"/><br/>
  	选项个数<input type="text" name="question.choiceCount" id="choiceCount"><br />
  	<input type="hidden" name="option[0].sid" />
  	选项：<input type="text" name="option[0].content" /><br/>
  	是否为答案：<input type="text" name="option[0].isAnswer"/><br/>   后面一定要加"[]"
  		<input type="hidden" name="option[1].sid" value="52"/>
  	选项：<input type="text" name="option[1].content" /><br/>
  	是否为答案：<input type="text" name="option[1].isAnswer" /><br/> 
  		<input type="hidden" name="option[2].sid" value="53"/>
  	选项：<input type="text" name="option[2].content" /><br/>
  	是否为答案：<input type="text" name="option[2].isAnswer" /><br/> 
  		<input type="hidden" name="option[3].sid" value="54"/>
  	选项：<input type="text" name="option[3].content" /><br/>
  	是否为答案：<input type="text" name="option[3].isAnswer"/><br/> 
  	
  	
  	<input type="submit" value="tijiao" onclick="f()">
  <input onclick="f()">
  	</form>					   -->
  </body>
   <script type="text/javascript">
 /*  var f= function()
  {
    	var val = $("#questiontype").val(); //获取  
    	alert(val);
        if(val=="TrueOrFalse"){
      	  $("#choiceCount").val("2");
        }else if(val=="Single"){
      	  $("#choiceCount").val("4");		 //是2个Option对象
        }else {
      	  $("#choiceCount").val("1");       //是一个Option对象
        }
        var val1 = $("#choiceCount").val(); //获取 
        alert(val1);
  }   */
  	
  </script> 
</html>
