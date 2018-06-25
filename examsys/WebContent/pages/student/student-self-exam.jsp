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
<link href="css/jquery-confirm.css" rel="stylesheet" type="text/css" />
<link href="css/toastr.css" rel="stylesheet" type="text/css" />

</head>
<body>

		<header>

			<nav id="top-nav">
				<div id="main-nav-content">
					<a href="student-index.html" clas="logo">
						<img class="logo-img" src="<%=basePath%>img/logo.png" />
					</a>
						<div class="navbar-right">
						<ul class="user-info">
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
		<div class="main-content">
			<div class="breadcrumb">
				<i class="fa fa-circle-o"></i> 位置：
				<a href="student-index.jsp">首页</a>
				<b>></b>
				<a href="/">在线练习</a>
			</div>
			<section class="left-section">
				<div class="left-menu">
					<div class="user-panel">
						<div class="pull-left image">
							<img src="<%=basePath%>img/user.jpg" class="img-circle" alt="User Image" />
						</div>
						<div class="pull-left info">
							<p>Hello,${session.user.name}</p>
							<a href="#"><i class="fa fa-circle text-success"></i> Online</a>
						</div>
					</div>
				<ul class="sider-menu">
						<li onclick="javascript:window.location.href='student-main.jsp'">
							<span >
								在线考试
							</span>
						</li>
						<li class="active">
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

						<li data-toggle="modal" data-target="#myinfo" onclick="showInfo()">
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
								
										<input type="text" class="form-control" disabled="disabled" name="user.userId" value='${session.user.userId}'/>
									</td>
								</tr>
								<tr>
									<td>姓名：</td>
									<td>
										<input type="text" class="form-control" name="user.name"/>
									</td>
								</tr>
								<tr>
									<td>性别：</td>
									<td>
										<input type="text" class="form-control" name="user.sex"/>
									</td>
								</tr>
								<tr>
									<td>学校：</td>
									<td>
										<input type="text" class="form-control" name="user.collegeName"/>
									</td>
								</tr>
								<tr>
									<td>学院：</td>
									<td>
										<input type="text" class="form-control" name="user.permission"/>
									</td>
								</tr>
								<tr>
									<td>专业：</td>
									<td>
										<input type="text" class="form-control" name="user.profession"/>
									</td>
								</tr>
								<tr>
									<td>邮箱：</td>
									<td>
										<input type="text" class="form-control" name="user.email"/>
									</td>
								</tr>
								<tr>
									<td>电话：</td>
									<td>
										<input type="text" class="form-control" name="user.phone"/>
									</td>
								</tr>
								
								<tr>
									<td>身份证号：</td>
									<td>
										<input type="text" class="form-control" name="user.idcard"/>
									</td>
								</tr>
								
							</tbody>
						</table>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				
				<button type="button" id="modify-button"class="btn btn-primary" data-dismiss="modal">确认修改
				</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
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
							<ul>
								<li class="exam-title-active ">
									在线练习
								</li>
							</ul>
						</div>
					</div>
					<div class="selfexam">
						<div class="exam-choose">
							<label>请选择科目：</label>
							<select class="form-control object-select" >
								<option>请选择</option>
								<option>软件工程导论</option>
								<option>数据库概论</option>
								<option value="">计算机导论</option>
								<option value="">大学英语</option>
								<option value="">四级英语</option>
							</select>
							<label>请选择课程章节：</label>
							<select class="form-control union-select" >
								<option>请选择</option>
								<option>第一章</option>
								<option>第二章</option>
								<option value="">第三章</option>
								<option value="">第四章</option>
								<option value="">第五章</option>
							</select>
							<label>请选择题型：</label>
							<select class="form-control type-select" >
								<option>请选择</option>
								<option value="">填空题</option>
								<option value="">单选题</option>
								<option value="">多选题</option>
								<option value="">简答题</option>
							</select>
						</div>
						<div class="self-exam-content">
							<div class="self-exam-paper">
				<table class="question">
					<thead>
						<tr>
							<th>1.</th>
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
						<tr>
							<td></td>
							<td></td>
							<td><span>参考答案：</span>
								<span>A</span>
						</tr>
					</tbody>
				</table>
				<button class="que-label btn btn-primary">查看答案</button>
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
						</div>
					</div>
				</div>
			</section>
		</div>
		<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery-confirm.js"></script>
		<script type="text/javascript" src="js/com.js"></script>
		<script type="text/javascript" src="js/toastr.js"></script>
</body>

</html>