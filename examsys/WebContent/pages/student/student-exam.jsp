<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			<a href="student-index.jsp">首页</a>
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
				<!-- <div class="exam-paper q-item q-1" id="q-1">
					<div class="lable-question" >
						<img  src="img/pre-lable.png" id="lable-img-1" class="lable-question-img" onclick="markClick()"/>
					</div>
					<table class="question" >
						<thead>
							<tr>
								<th id="no_1">1</th>
								<th>(1分)</th>
								<th>下列哪项不属于因为疫苗的本质因素而引起的不良反应：</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td></td>
								<td>A</td>
								<td>
									<input type="radio" />减毒疫苗在体内复制繁殖引起类似自然感染的临床症状；
								</td>
							</tr>
							<tr>
								<td></td>
								<td>B</td>
								<td>
									<input type="radio" />疫苗生产过程中残留的微量的动物血清引起少数人过敏；
								</td>
							</tr>
							<tr>
								<td></td>
								<td>C</td>
								<td>
									<input type="radio" />疫苗运输过程中保存温度过低导致疫苗变质，接种后出现不良反应。
								</td>
							</tr>
							<tr>
								<td></td>
								<td>D</td>
								<td>
									<input type="radio" />疫苗添加剂引起的过敏反应。
								</td>
							</tr>
						</tbody>
					</table>
					<div class="pre-next-quetion">
						<ul class="pager">
							<li class="previous">
								<a href="#">&larr; 上一题</a>
							</li>
							<li class="next">
								<a href="#">下一题 &rarr;</a>
							</li>
						</ul>
					</div>
				</div> -->
				
				
			</div>
			<div class="all-question" id="all-question">
			</div>
		</div>
		
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/echarts.js"></script>
<script type="text/javascript" src="js/student-exam.js"></script>

<script type="text/javascript">
callback();
function callback() {
	var htm = "";
	for(var i=0;i<50;i++) {
		htm += getChoiceItem(i+1);
	}
	$('#all-question').html(htm);
}

$("#abc1").click();

function getChoiceItem(n) {
	var html = "<a id='abc"+n+"' class='que-num que-num-color' onclick='queClicked(this, "+n+")'>"+n+"</a>";
	return html;
}
</script>
<script type="text/javascript">
callback1();
oneChoice();
function callback1() {
	var htm = "";
	for(var i=0;i<50;i++) {
		htm += getQueItem(i+1);
	}
	$('#paper-box').html(htm);
}
$('#abc1').click();
function getQueItem(n) {
	
	var htm = 
		"<div class='exam-paper q-item q-"+n+"' id='q-"+n+"' style='display: none'>"
	+"					<div class='lable-question' >"
	+"						<img  src='img/pre-lable.png' id='lable-img-"+n+"' class='lable-question-img' onclick='markClick()'/>"
	+"					</div>"
	+"					<table class='question ' >"
	+"						<thead>"
	+"							<tr>"
	+"								<th id='no_"+n+"'>"+n+"</th>"
	+"								<th>(1分)</th>"
	+"								<th>下列哪项不属于因为疫苗的本质因素而引起的不良反应：</th>"
	+"							</tr>"
	+"						</thead>"
	+"						<tbody>"
	+"							<tr >"
	+"								<td></td>"
	+"								<td>A</td>"
	+"								<td >"
	+"									<input type='checkbox' />减毒疫苗在体内复制繁殖引起类似自然感染的临床症状；"
	+"								</td>"
	+"							</tr>"
	+"							<tr >"
	+"								<td></td>"
	+"								<td>B</td>"
	+"								<td >"
	+"									<input  type='checkbox' />疫苗生产过程中残留的微量的动物血清引起少数人过敏；"
	+"								</td>"
	+"							</tr>"
	+"							<tr >"
	+"								<td></td>"
	+"								<td>C</td>"
	+"								<td >"
	+"									<input type='checkbox' />疫苗运输过程中保存温度过低导致疫苗变质，接种后出现不良反应。"
	+"								</td>"
	+"							</tr>"
	+"							<tr >"
	+"								<td></td>"
	+"								<td>D</td>"
	+"								<td >"
	+"									<input type='checkbox' />疫苗添加剂引起的过敏反应。"
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
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/echarts.js"></script>
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
			<a href="student-index.jsp">首页</a>
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
							<span>66:66</span>
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
	</div>
			</div>
			<div class="exam-paper q-1" id="q-1">
				<!--<button class="que-label btn btn-primary">标记此题</button>-->
				<div class="lable-question" >
					<img  src="img/pre-lable.png" id="lable-img-1" class="lable-question-img" onclick="markClick()"/>
				</div>
				<table class="question" >
					<thead>
						<tr>
							<th id="no_1">1</th>
							<th>(1分)</th>
							<th>下列哪项不属于因为疫苗的本质因素而引起的不良反应：</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td></td>
							<td>A</td>
							<td>
								<input type="radio" />减毒疫苗在体内复制繁殖引起类似自然感染的临床症状；
							</td>
						</tr>
						<tr>
							<td></td>
							<td>B</td>
							<td>
								<input type="radio" />疫苗生产过程中残留的微量的动物血清引起少数人过敏；
							</td>
						</tr>
						<tr>
							<td></td>
							<td>C</td>
							<td>
								<input type="radio" />疫苗运输过程中保存温度过低导致疫苗变质，接种后出现不良反应。
							</td>
						</tr>
						<tr>
							<td></td>
							<td>D</td>
							<td>
								<input type="radio" />疫苗添加剂引起的过敏反应。
							</td>
						</tr>
					</tbody>
				</table>
				<div class="pre-next-quetion">
					<ul class="pager">
						<li class="previous">
							<a href="#">&larr; 上一题</a>
						</li>
						<li class="next">
							<a href="#">下一题 &rarr;</a>
						</li>
					</ul>
				</div>
			</div>
			<div class="all-question" id="all-question">
				<a class="que-num has-que-num">1</a>
				<a class="que-num" onclick="func(this, 2)">2</a>
				<a class="que-num" onclick="func(this, 3)">3</a>
				<a class="que-num" onclick="func(this, 4)">4</a>
				<a class="que-num" onclick="func(this, 5)">5</a>
				<a class="que-num">6</a>
				<a class="que-num">7</a>
				<a class="que-num">8</a>
				<a class="que-num">9</a>
			</div>
		</div>
		
		
		<script>
		
 function lableChange(obj){
	 var lablea=$("#all-question a");
	 var tablein=$(".question thead tr th:nth-child(1)")
	 /* alert(tablein.text()); */
	 for(i=0;i<=lablea.length;i++) {
		/*  alert(lablea[i].innerHTML);  */
		console.log(lablea[i].innerHTML);
		if(lablea[i].innerHTML==tablein.text()){
			$(lablea[i]).addClass('has-labled');
		}
	 }
	 alert(obj) 
	 if(obj.getAttribute("src",2)=="img/pre-lable.png"){
		 obj.src="img/lable.png";
	 } else{	
			 obj.src="img/pre-lable.png"; 
	}
 }
		</script>
		
</body>
>>>>>>> lrx
</html>