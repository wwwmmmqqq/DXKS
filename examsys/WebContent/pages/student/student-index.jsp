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
<title>首页-考试</title>
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
						<img class="logo-img" src="<%=basePath%>img/logo.png" />
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
		<div class="main-content">
			<div class="breadcrumb">
				<i class="fa fa-circle-o"></i> 位置：
				<a href="student-main.jsp">首页</a>
				<b>></b>
				<a >在线考试</a>
			</div>
			<section class="left-section">
				<div class="left-menu">
					<div class="user-panel">
						<div class="pull-left image">
							<img src="<%=basePath%>img/user.jpg" class="img-circle" alt="User Image" />
						</div>
						<div class="pull-left info">
							<p>Hello, wmq</p>
							<a href="#"><i class="fa fa-circle text-success"></i> Online</a>
						</div>
					</div>
							<ul class="sider-menu">
						<li class="active">
							<span >
								在线考试
							</span>
						</li>
						<li onclick="javascript:window.location.href='student-self-exam.jsp'">
							<span>
								在线练习
							</span>
						</li>
						<li  onclick="javascript:window.location.href='student-all-exam.jsp'">
							<span>
								我的考试
							</span>
						</li>
						<li  onclick="javascript:window.location.href='student-exam-score.jsp'">
							<span>
								历史成绩
							</span>
						</li>

						<li data-toggle="modal" data-target="#myinfo">
							<span>
								我的信息
							</span>
						</li>
					</ul>
					<!-- 模态框（Modal） -->
<div class="modal fade" id="myinfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
					个人信息
				</h4>
			</div>
			<div class="modal-body">
				<form id="my-info">
					<div >
						<table class="info-body">
							<tbody>
								<tr class="basic-info">
									<td>学号：</td>
									<td>
										<input type="text" class="form-control"/>
									</td>
								</tr>
								<tr>
									<td>姓名：</td>
									<td>
										<input type="text" class="form-control"/>
									</td>
								</tr>
								<tr>
									<td>性别：</td>
									<td>
										<input type="text" class="form-control"/>
									</td>
								</tr>
								<tr>
									<td>邮箱：</td>
									<td>
										<input type="text" class="form-control"/>
									</td>
								</tr>
								<tr>
									<td>电话：</td>
									<td>
										<input type="text" class="form-control"/>
									</td>
								</tr>
								<tr>
									<td>密码：</td>
									<td>
										<input type="text" class="form-control"/>
									</td>
								</tr>
								<tr>
									<td>身份证号：</td>
									<td>
										<input type="text" class="form-control"/>
									</td>
								</tr>
								<tr>
									<td>注册日期：</td>
									<td>
										<input type="text" class="form-control"/>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
				<button type="button" id="modify-button"class="btn btn-primary" data-dismiss="modal">确认修改
				</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
				</div>
				</div>
			</section>
			
			<section class="right-section">
				<div class="right-content">
					<div class="exam-head">
						<div class="exam-title">
							<span>待参加的考试</span>
						</div>
						<div class="searchbox">
							<form id="">

								<div id="search-button">
									<input type="submit" class=" search-button btn btn-primary" value="确认" />
									<!--<i class="fa fa-search-plus"></i>-->
								</div>
								<div id="search-input">
									<input type="text" class="search-input form-control" placeholder="请输入搜索的关键字" />
								</div>
							</form>
						</div>
					</div>
					<ul class="paper-item">
						<li>
							<div class="icon paper-picture"></div>
							<div class="paper-intro">
								<div class="paper-title">
									<span>软件工程导论期末测试卷A卷</span>
								</div>
								<div class="paper-body">
									<span>总分：100分</span>
									<span>及格：60分</span>
									<span>限时：120分钟</span>
									<span>考试时间：2018/06/01-2018/06/03</span>
								</div>
							</div>
							<div class="exam-button">
								<button class="btn btn-primary" data-toggle="modal" data-target="#start-exam">开始考试</button>
								<div class="modal fade" id="start-exam" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title rule-title" id="myModalLabel">
					考前须知
				</h4>
			</div>
			<div class="modal-body">
				<div class="exam-rule">
						<p>
							开考信号发出后方可答题。考生必须用现行规范的语言文字答题。
						</p>
						<p>
							如不遵守考试规则，不服从考试工作人员管理，有违纪、作弊等行为，教育考试机构将按照《国家教育考试违规处理办法》及有关规定进行处理，并将记入国家教育考试诚信档案。
						</p>
				</div>
				<div class="agree-rule">
					<input type="checkbox"  name="agree-checkebox"/>
					<span>我已仔细阅读并同意</span>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" id="start-exam-btn" class="btn btn-primary" data-dismiss="modal" >开始考试
				</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>
							</div>
						</li>
					</ul>
					<ul class="paper-item">
						<li>
							<div class="icon paper-picture"></div>
							<div class="paper-intro">
								<div class="paper-title">
									<span>软件工程导论期末测试卷A卷</span>
								</div>
								<div class="paper-body">
									<span>总分：100分</span>
									<span>及格：60分</span>
									<span>限时：120分钟</span>
									<span>考试时间：2018/06/01-2018/06/03</span>
								</div>
							</div>
							<div class="exam-button">
								<button class="btn btn-primary">开始考试</button>
							</div>
						</li>
					</ul>
					<ul class="paper-item">
						<li>
							<div class="icon paper-picture"></div>
							<div class="paper-intro">
								<div class="paper-title">
									<span>软件工程导论期末测试卷A卷</span>
								</div>
								<div class="paper-body">
									<span>总分：100分</span>
									<span>及格：60分</span>
									<span>限时：120分钟</span>
									<span>考试时间：2018/06/01-2018/06/03</span>
								</div>
							</div>
							<div class="exam-button">
								<button class="btn btn-primary">开始考试</button>
							</div>
						</li>
					</ul>
					<ul class="paper-item">
						<li>
							<div class="icon paper-picture"></div>
							<div class="paper-intro">
								<div class="paper-title">
									<span>软件工程导论期末测试卷A卷</span>
								</div>
								<div class="paper-body">
									<span>总分：100分</span>
									<span>及格：60分</span>
									<span>限时：120分钟</span>
									<span>考试时间：2018/06/01-2018/06/03</span>
								</div>
							</div>
							<div class="exam-button">
								<button class="btn btn-primary">开始考试</button>
							</div>
						</li>
					</ul>
					<ul class="paper-item">
						<li>
							<div class="icon paper-picture"></div>
							<div class="paper-intro">
								<div class="paper-title">
									<span>软件工程导论期末测试卷A卷</span>
								</div>
								<div class="paper-body">
									<span>总分：100分</span>
									<span>及格：60分</span>
									<span>限时：120分钟</span>
									<span>考试时间：2018/06/01-2018/06/03</span>
								</div>
							</div>
							<div class="exam-button">
								<button class="btn btn-primary">开始考试</button>
							</div>
						</li>
					</ul>
					<ul class="exam-page pagination pagination-sm">
						<li>
							<a href="#">&laquo;</a>
						</li>
						<li>
							<a href="#">1</a>
						</li>
						<li>
							<a href="#">2</a>
						</li>
						<li>
							<a href="#">3</a>
						</li>
						<li>
							<a href="#">4</a>
						</li>
						<li>
							<a href="#">5</a>
						</li>
						<li>
							<a href="#">&raquo;</a>
						</li>
						<li>
							<input type="text" class="form-control page-input" />
							<button class=" btn btn-primary fa fa-search sure-search-btn"></button>
						</li>
					</ul>
				</div>

			</section>

		</div>
		<footer>
	<div class="footer-section">
	</div>
</footer>
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript">
agreeClick();
function agreeClick(){
	if($('.agree-rule').find('input[name="agree-checkebox"]').checked==true){
		$('#start-exam-btn').disabled=false;
		$('#start-exam-btn').onclick="javascript:window.location.href='student-exam.jsp'"
		
	}else{
		
		$('#start-exam-btn').disabled=true;
	}
	
}
</script>
</body>

</html>