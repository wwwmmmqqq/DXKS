<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
            <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/student.css" />
<link rel="stylesheet" href="css/ionicons.min.css" />
<link rel="stylesheet" href="css/font-awesome.min.css" />

</head>
<body>
		<header>
			<nav id="top-nav">
				<div id="main-nav-content">
					<a href="student-index.html" clas="logo">
						<img class="logo-img" src="img/logo.png" />
					</a>
					<div class="navbar-right">
						<ul>
							<li class="dropdown user user-menu">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">
									<i class="fa fa-user"></i>
									<span>wmq </span>
								</a>
							</li>
						</ul>
					</div>
				</div>
			</nav>
		</header>
		<div class="breadcrumb">
			<i class="fa fa-circle-o"></i> 位置：
			<a href="student-main.jsp">首页</a>
			<b>></b>
			<a href="/">在线考试</a>
		</div>
		<div class="exam-main-content">
			<div class="exam-left">
				<div class="left-up">
					<div class="pre-info-panel">
						<div class="info-title">
							<span>考试规则</span>
						</div>
						<div class="exam-info-body">
							<p>请在固定时间内完成答题</p>
							<p>超过总分60%达到及格</p>
							<p>题型一共分为选择题，判断题，填空题和简答题</p>
						</div>
					</div>
				</div>
				<div class="left-down">
					<div class="exam-time">
						<div class="info-title">
							<span>剩余时间</span>
						</div>
						<div class="rest-time">
							<span><input type="text" name="mss" id="mss" /></span>
						</div>
					</div>
				</div>
			</div>
			<div class="paper-title-se">
				<div class="title-se">
					<span >安全知识考试</span>
				</div>
				<button class="submit-exam btn btn-primary" data-toggle="modal" data-target="#examResult">提交试卷</button>
				<!-- 模态框（Modal） -->
<div class="modal fade" id="examResult" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
					提交成功
				</h4>
			</div>
			<div class="modal-body">
				<div class="result-title">
					<span>本次考试结果</span>
				</div>
				<div class="exam-result">
					<div class="score">
						<span>总分：</span>
						<span>85</span>
					</div>
					<div class="grade">
						<span>考试总排名：</span>
						<span>30</span>
						<span>本校排名：</span>
						<span>10</span>
					</div>
					<div id="right-rate">
						
					</div>
				</div>
				<button type="button" class="ok-btn btn btn-primary" data-dismiss="modal">我知道了
				</button>
			</div>
			<!--<div class="modal-footer">
			</div>-->
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
	</div> </div>
	
			<div id="paper-box">
			</div>
			<div class="all-question" id="all-question">
			</div>
		</div>
		
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/echarts.js"></script>
<script type="text/javascript" src="js/student-exam.js"></script>

<script type="text/javascript">
var paperSid=getParam("sid");
loadQuestionListByPaper(paperSid);
setTimeout(function(){
	$('#abc0').click();
}, 50);
/* 获取题目序号 */
function loadQuestionListByPaper(paperSid) {
	$.post("loadQuestionList", {
		  "paper.sid":paperSid
	  }, function(data) {
		  var queList = data.list;
		  var htm = "";
		  for(var i=0;i<queList.length;i++) {
			 htm+=getChoiceItem(i);
		  }
		  $('#all-question').html(htm);
		  
	  });
}

function getChoiceItem(n) {
	var html = "<a id='abc"+n+"' class='que-num que-num-color' onclick='queClicked(this, "+n+")'>"+(n+1)+"</a>";
	return html;
}

//获取url中的参数
function getParam(name) {
  var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i"); //匹配目标参数
  var result = window.location.search.substr(1).match(reg); //匹配目标参数
  if (result != null) 
  	return decodeURIComponent(result[2]);
  return null;
}

</script>
<script type="text/javascript">
loadQuestionListByPaper(paperSid);
/* oneChoice();  */
function loadQuestionListByPaper(paperSid){
	  $.post("loadQuestionList", {
		  "paper.sid":paperSid
	  }, function(data) {
		  var queList = data.list;
		  var htm = "";
		  for(var i=0;i<queList.length;i++){
			  htm+=getQueItem(i, queList[i]);
		  }
		  $('#paper-box').html(htm);
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
$(document).ready(function(){
	$('.option-item').click(function() {
		$(this).find('.opt-radio').click();
		$(this).find('.opt-radio').siblings().unbind();
	});
})
	

function getQueItem(n, obj) {
	
	var htm = 
		"<div class='exam-paper q-item q-"+n+"' id='q-"+n+"' style='display: none'>"
	+"					<div class='lable-question' >"
	+"						<img  src='img/pre-lable.png' id='lable-img-"+n+"' class='lable-question-img' onclick='markClick()'/>"
	+"					</div>"
	+"					<table class='question ' >"
	+"						<thead>"
	+"							<tr>"
	+"								<th id='no_"+n+"'>"+(n+1)+"</th>"
	+"								<th>(1分)</th>"
	+"								<th>"+obj.title+"</th>"
	+"							</tr>"
	+"						</thead>"
	+"						<tbody>"
	+"							<tr class='option-item'>"
	+"								<td></td>"
	+"								<td>A</td>"
	+"								<td >"
	+"									<input class='opt-radio' type='checkbox' />减毒疫苗在体内复制繁殖引起类似自然感染的临床症状；"
	+"								</td>"
	+"							</tr>"
	+"							<tr class='option-item'>"
	+"								<td></td>"
	+"								<td>A</td>"
	+"								<td >"
	+"									<input class='opt-radio' type='checkbox' />减毒疫苗在体内复制繁殖引起类似自然感染的临床症状；"
	+"								</td>"
	+"							</tr>"
	+"						</tbody>"
	+"					</table>"
	+"					<div class='pre-next-quetion'>"
	+"						<ul class='pager'>"
	+"							<li class='previous'>"
	+"								<a href='javascript:prePage()'>&larr; 上一题</a>"
	+"							</li>"
	+"							<li class='next'>"
	+"								<a href='javascript:nextPage()'>下一题 &rarr;</a>"
	+"							</li>"
	+"						</ul>"
	+"					</div>"
	+"				</div>";
	return htm;
}



</script>
</body>
</html>