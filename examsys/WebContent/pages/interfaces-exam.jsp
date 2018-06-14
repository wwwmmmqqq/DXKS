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
	  
	  /*加载考试列表*/
	  function loadMyExamList(page) {
		  $.post("loadMyExamList", {"page":page}, function(data) {
			  var examList = data.list;
			  var htm = "";
			  for(var i=0;i<examList.length;i++) {
				  htm += "试卷ID = <a href='javascript:loadPapersByExam("+examList[i].sid+", 1)'>" + examList[i].sid + "</a>";//考试标题
				  htm += "考试标题 = " + examList[i].title;//考试标题
				  //其他信息详见cn.examsys.bean.Exam.java文件
				  htm += "<br>";
			  }
			  $('#exam-box').html(htm);
		  });
	  }
	  
	  /*加载考试试卷列表*/
	  function loadPapersByExam(examSid, page) {
		  $.post("loadMyExamList", {
			  "exam.sid":examSid
			  ,"page":page
		  }, function(data) {
			  var paperList = data.list;
			  var htm = "";
			  for(var i=0;i<paperList.length;i++) {
				  htm += "试卷ID = <a href='javascript:loadQuestionListByPaper("+paperList[i].sid+")'>" + paperList[i].sid + "</a>";//考试ID
				  htm += "试卷名 = " + paperList[i].title;//考试名
				  //其他信息详见cn.examsys.bean.Paper.java文件
				  htm += "<br>";
			  }
			  $('#paper-box').html(htm);
		  });
	  }
	  
	  /*获取题目列表*/
	  function loadQuestionListByPaper(paperSid) {
		  $.post("loadQuestionList", {
			  "paper.sid":paperSid
		  }, function(data) {
			  var queList = data.list;
			  var htm = "";
			  for(var i=0;i<queList.length;i++) {
				  htm += "题目ID = " + queList[i].sid;//题目ID
				  htm += "题目标题= " + queList[i].title;//题目名
				  htm += "题目类型= " + queList[i].type;//题目类型
				  //其他信息详见cn.examsys.bean.Qeustion.java文件
				  htm += "<br>";
			  }
			  $('#que-box').html(htm);
		  });
	  }
	  
	  /*答题 题目id，选项id， 填空题答案，主观题答案*/
	  function todo(questionSid, optionSid, fillsAnswer, subjectiveAnswer) {
		  $.post("todo", {
			  "answer.questionRef":questionSid//题目ID
			  ,"answer.optionRef":optionSid//选项ID
			  ,"answer.fillsAnswer":fillsAnswer//填空题内容
			  ,"answer.subjectiveAnswer":subjectiveAnswer//主观题内容
		  }, function(data) {
			  if(data.result == 'fail') {
				  alert('做题失败');
			  } else {
				  alert('做题成功');
			  }
		  });
	  }
	  
	  function submitPaper(paperSid) {
		  $(submitPaperBtn).text("交卷中...");
		  $.post("todo", {
			  "paper.sid":paperSid
		  }, function (data) {
			  if(data.result == 'fail') {
				  $(submitPaperBtn).text("交卷失败");
			  } else {
				  $(submitPaperBtn).text("交卷成功 成绩ID=" + data.result);//成绩ID
			  }
		  });
	  }
	  
	  </script>
	  
	  <script type="text/javascript">
	  loadMyExamList(1);
	  </script>
	  
  </head>
  
  <body>
         【考试相关的接口】
  	当前用户：${session.user.userId} ${session.user.name} ${session.user.sex} ${session.user.collegeName}
  	<br>
  	----考试列表----
  	<div id="exam-box"></div>
  	
  	----试卷列表----
  	<div id="paper-box"></div>
  	
  	----题目列表----
  	<div id="que-box"></div>
  	
  	<button onclick="todo(2, 5, '填空啊啊啊', '主观题啊啊啊啊啊啊啊啊啊啊');">答题测试</button>
  	
  	<button id='submitPaperBtn' onclick="submitPaper(1)">交卷测试</button>
  	
  </body>
</html>