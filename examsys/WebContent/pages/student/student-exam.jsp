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
<link href="css/jquery-confirm.css" rel="stylesheet" type="text/css" />

</head>
<body>
		<header>
			<nav id="top-nav">
				<div id="main-nav-content">
					<a href="student-index.html" class="logo">
						<img class="logo-img" src="img/logo.png" />
					</a>
					<div class="navbar-right">
						<ul>
							<li class="dropdown user user-menu">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">
									<i class="fa fa-user"></i>
									<span>${session.user.name}</span>
								</a>
							</li>
								<div class="dropdown-content">
		    			<a href="javascript:setPassword()">修改密码</a>
		    			<a >退出系统</a>
		    		</div>
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
				<button id="submitPaperBtn" class="submit-exam btn btn-primary" data-toggle="modal" data-target="#examResult">提交试卷</button>
				<!-- 模态框（Modal） -->
<div class="modal fade" id="examResult" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
					交卷提示
				</h4>
			</div>
			<div class="modal-body">
				<div class="result-title">
					<span>本次考试结果</span>
				</div>
				<div class="exam-result">
					<div class="score">
						<span>总分：</span>
						<span id="scoreResult">85</span>
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
	</div> 
	</div>
	
	<div id="paper-box">
		<s:iterator id="item" value="#request.queList" status="st">
			<div class="exam-paper q-item" id="q-${st.index}">
				<div class="lable-question">
					<img src="img/pre-lable.png" id="lable-img-${st.index}" class="lable-question-img" onclick="markClick()" />
				</div>
				<div class="question">
					<div id="no_${st.index}">
						${st.index+1}. ${item.title} 
						${(item.type=="Single")?"(单选题)":""}
						${(item.type=="Multiple")?"(多选题)":""}
						${(item.type=="TrueOrFalse")?"(判断题)":""}
						${(item.type=="Fills")?"(填空题)":""}
						${(item.type=="Subjective")?"(解答题)":""}
					</div>
					<s:iterator id="optItem" value="#item.options" status="st1">
						<%request.setAttribute("optionLabel", (char)(((org.apache.struts2.views.jsp.IteratorStatus)request.getAttribute("st1")).getIndex()+'A')); %>
						<div class="option-item">
							<s:if test="#item.type == 'Single'">
								${optionLabel}. 
								<input class="opt-together" type="radio" name="single${item.sid}"
									 onchange="doit(${item.sid}, ${optItem.sid}, this)" />
								${optItem.content}
							</s:if>
							<s:elseif test="#item.type == 'Multiple'">
								${optionLabel}.
								<input class="opt-together" type="checkbox"
									 onchange="doit(${item.sid}, ${optItem.sid}, this)" />
								${optItem.content}
							</s:elseif>
							<s:elseif test="#item.type== 'Fills'">
								<div>${st1.index+1}. ${optItem.content}</div>
								<input type="text" class="opt-input"
									 onchange="doit(${item.sid}, ${optItem.sid}, this)">
							</s:elseif>
							<s:elseif test="#item.type == 'TrueOrFalse'">
								<div>${st1.index+1}. ${optItem.content}</div>
								<input class="opt-together" type="radio" name="tf${optItem.sid}"
									 onchange="doit(${item.sid}, ${optItem.sid}, this, 1)">正确 
								<input class="opt-together" type="radio" name="tf${optItem.sid}"
									 onchange="doit(${item.sid}, ${optItem.sid}, this, 0)">错误
							</s:elseif>
							<s:elseif test="#item.type == 'Subjective'">
								<div>${st1.index+1}. ${optItem.content}</div>
								<textarea rows="4" cols="25" placeHolder="填写答案" style="padding:3px;width: 80%;height: 104px;"
									 onchange="doit(${item.sid}, ${optItem.sid}, this)"></textarea>
							</s:elseif>
						</div>
					</s:iterator>
				</div>
				<div class="pre-next-quetion">
					<ul class="pager">
						<li class="previous">
							<a href="javascript:prePage()">&larr; 上一题</a>
						</li>
						<li class="next">
							<a href="javascript:nextPage()">下一题 &rarr;</a>
						</li>
					</ul>
				</div>
			</div>
		</s:iterator>
	</div>
	<div class="all-question" id="all-question">
		<s:iterator id="item" value="#request.queList" status="st">
			<a id='abc${st.index}' class='que-num que-num-color' onclick='queClicked(this, ${st.index})'>${st.index+1}</a>
		</s:iterator>
	</div>
</div>
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/echarts.js"></script>
<script type="text/javascript" src="js/student-exam.js"></script>
<script type="text/javascript" src="js/jquery-confirm.js"></script>
<script type="text/javascript" src="js/com.js"></script>


<script type="text/javascript">
var paperSid=${request.paper.sid};
window.onload = function() {
	var now = "${session.Time}";//服务器当前时间
	var examEnd = "2018-06-25 10:00:00";//这趟考试结束时间
	//开始倒计时
	startTimeCounting(now, examEnd);
};
//获取url中的参数
//去掉了！
/* function getParam(name) {
  var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i"); //匹配目标参数
  var result = window.location.search.substr(1).match(reg); //匹配目标参数
  if (result != null) 
  	return decodeURIComponent(result[2]);
  return null;
} */
</script>
<script type="text/javascript">
//loadQuestionListByPaper(paperSid);
setTimeout(function() {
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


$("#submitPaperBtn").click(function() {
	submitPaper(paperSid);
});

function submitPaper(paperSid) {
	  $("#submitPaperBtn").text("交卷中...");
	  $.post("submitPaper", {
		  "paper.sid":paperSid
	  }, function (data) {
		  if(data.result == 'fail') {
			  //$("#examResult").text("交卷失败");
			  $(".exam-result").html("交卷失败，该试卷已被提交过！");
			  $("#submitPaperBtn").html("提交试卷");
		  } else {
			  //$("#examResult").text("交卷成功 成绩ID=" + data.result);//成绩ID
			  $(".exam-result").text("${session.user.name}本次考试最终得分：" + data.result + "分");
			  $("#submitPaperBtn").html("已交卷");
			  $("#submitPaperBtn").attr("disabled", "disabled");
		  }
		  
	  });
}

$(document).ready(function(){
	$('.option-item').click(function() {
		$(this).find('.opt-together').click();
	});
});
</script>
<script type="text/javascript">
//loadQuestionListByPaper(paperSid);
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
function todo(questionSid, optionSid, fillsAnswer, subjectiveAnswer, trueOrFalse) {
	$.post("todo", {
	  "answer.questionRef":questionSid//题目ID
	  ,"answer.optionRef":optionSid//选项ID
	  ,"answer.trueOrFalse":trueOrFalse//判断题答案
	  ,"answer.fillsAnswer":fillsAnswer//填空题内容
	  ,"answer.subjectiveAnswer":subjectiveAnswer//主观题内容
  }, function(data) {
	  if(data.result == 'fail') {
		 /*  alert('做题失败'); */
	  } else {
		  /* alert('做题成功'); */
	  }
  });
}

function doit(questionId, optId, inputObj, trueOrFalse) {
	if(inputObj.type == 'checkbox') {
		trueOrFalse = inputObj.checked?1:0;
	}
	todo(questionId, optId, inputObj.value, inputObj.value, trueOrFalse);
	$('#abc'+currentItemId).addClass('has-que-num ');
}

$(document).ready(function(){
	$('.option-item').click(function() {
		$(this).find('.opt-together').click();
	});
});
	

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