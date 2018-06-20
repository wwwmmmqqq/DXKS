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
	  //获取URL中的参数
	  function getParam(name) {
		  var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");//匹配目标参数
		  var result = window.location.search.substr(1).match(reg);//匹配目标参数
		  if (result != null)
		  	return decodeURIComponent(result[2]);
		  return null;
	  }
	  alert(getParam("12"));
	  </script>
	  
	  <script type="text/javascript">
	  
	  /*加载考次列表*/
	  function loadMyExamList(page) {
		  $.post("loadMyExamList", {"page":page}, function(data) {
			  var examList = data.list;
			  var htm = "";
			  for(var i=0;i<examList.length;i++) {
				  htm += "试卷ID = <a href='javascript:loadPapersByExam("+examList[i].sid+")'>" + examList[i].sid + "</a>";//考试标题
				  htm += "考试标题 = " + examList[i].title;//考试标题
				  //其他信息详见cn.examsys.bean.Exam.java文件
				  htm += "<br>";
			  }
			  $('#exam-box').html(htm);
		  });
	  }
	  
	  var currentPage = 1;
	  /*加载考试试卷列表*/
	  function loadPapersByExam(examSid) {
		  $.post("loadMyExamList", {
			  "exam.sid":examSid
			  ,"page":currentPage
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
	  
	  
	  function constituteByHand(qids, examStart, examEnd, examName) {
		  //手动组卷接口
		  $.post("createPaperHand", {
			  "examStart":examStart //考试开始
			  ,"examEnd":examEnd //考试结束
			  ,"examName":examStart //考试名字
			  ,"qids[0]":qids[0]//第一题ID
			  ,"qids[1]":qids[1]//第二题ID
			  ,"qids[2]":qids[2]//第三题ID
			  ,"qids[3]":qids[3]//到总题目数量 的ID 
		  }, function(data) {
			  if("fail" == data.result) {
				  alert("失败");
			  } else {
				  var paperSid = data.result;//返回试卷的ID
				  
			  }
		  });
	  }
	  
	  
	  
	  function createPaperAuto(examRef, subjectRef, name, examStart, examEnd) {
		  $.post("createPaperAuto", {
			  "paper.examRef":examRef //考试ID
				, "paper.name":name //试卷标题名
				, "paper.examStart":examStart //考试开始时间
				, "paper.examEnd":examEnd //考试结束时间
				//单选题的参数
				, "single.count": //题目数量
				, "single.diff1Percent": //难度为1的百分百
				, "single.diff2Percent": //难度为2的百分百
				, "single.diff3Percent": //难度为3的百分百
				, "single.diff4Percent": //难度为4的百分百
				, "single.diff1Point": //难度为1的分数
				, "single.diff2Point": //难度为2的分数
				, "single.diff3Point": //难度为3的分数
				, "single.diff4Point": //难度为4的分数
					//判断题的参数
				, "trueOrFalse":
					//判断题的参数
				, "multiple":
					//判断题的参数
				, "fills":
					//判断题的参数
				, "subjective":
				  
		  }, function(data) {
			  if(data.result == 'fail') {
				  alert("组卷失败");
			  }
		  });
	  }
	  </script>
	  
	  <script type="text/javascript">
	  //传入题目的ID数组
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