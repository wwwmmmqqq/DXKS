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
		<meta charset="UTF-8">
		<link rel="stylesheet" href="css/teacher_read.css" />
		<link rel="stylesheet" href="css/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css" />
		<link rel="stylesheet" href="css/ionicons.min.css" />
		<script type="text/javascript" src="js/admin.js"></script>
		<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
		<script type="text/javascript" src="js/bootstrap.min.js"></script>
		<script src="https://cdn.bootcss.com/popper.js/1.12.5/umd/popper.min.js"></script>
		<title></title>
	</head>

	<body>
		<div class="all">

			<!--上方导航栏-->
			<header class="header">
				<nav class="navbar navbar-static-top" role="navigation">
					<a class="logo" href="#"><img class="logo" src="img/logo.png"></a>
					<div class="banner">
						<div class="dropdown users">
							<button class="dropbtn">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">
								<i class="fa fa-user"></i>
								<span>teacher <i class="caret"></i></span>
							</a>
						</button>
							<div class="dropdown-content">
								<a href="#" data-toggle="modal" data-target="#myModal-information">个人中心</a>
								<a href="#" onclick="myFunction()" value="退出系统">退出系统</a>
							</div>
						</div>
						<div class="dropdown task">
						</div>
						<div class="dropdown task">
							<button class="dropbtn envolope">
							<i class="fa fa-envelope envelope"></i>	
							<span class="label-success success1"></span>
						</button>
							<div class="dropdown-content">
								<a href="#" data-toggle="modal" data-target="#myModal-email">邀请通知</a>
								<a href="#" data-toggle="modal" data-target="#myModal_read">阅卷通知</a>
							</div>
						</div>
					</div>
				</nav>
			</header>

			<!--侧面导航栏-->
			<div class="left">
				<nav class="navbar bg-light">
					<div class="user-panel">
						<div class="image">
							<img class="user1" src="img/1098.jpg" alt="User Image">
						</div>
						<div class="info">
							<p>Hello, teacher</p>
						</div>

					</div>
					<div class="light_bottom">
						<ul class="side_nav">
							<a href="showItemBankListByUserJump?page=1"><li class="side_nav1 ">题库管理</li></a>
							<a href="history_teacher.jsp">
								<li class="side_nav1 ">查看成绩</li>
							</a>
							<a href="teacher_read_jump.jsp"><li class="side_nav1 now">批阅试卷</li></a>
						</ul>
					</div>
				</nav>
			</div>
	
				<!--模态框-->
			<!--模态框查看个人信息-->
			<div class="modal fade" id="myModal-information">
				<div class="modal-dialog">
					<div class="modal-content">

						<!-- 模态框头部 -->
						<div class="modal-header">
							<h4 class="modal-title">个人信息</h4>
							<button type="button" class="close close1" data-dismiss="modal">&times;</button>
						</div>

						<!-- 模态框主体 -->
						<div class="modal-body">
							<table>
								<tbody>
									<tr>
										<td>
											姓名
											<div class="tb_information">慕雪</div>
										</td>
									</tr>
									<tr>
										<td>
											工号
											<div class="tb_information">17001</div>
										</td>
									</tr>
									<tr>
										<td>
											密码
											<div class="tb_information">123456</div>
										</td>
									</tr>
									<tr>
										<td>
											学校
											<div class="tb_information">萍乡学院</div>
										</td>
									</tr>
									<tr>
										<td>
											学院
											<div class="tb_information">信计学院</div>
										</td>
									</tr>
									<tr>
										<td>
											性别
											<div class="tb_information">女</div>
										</td>
									</tr>
									<tr>
										<td>
											联系方式
											<div class="tb_information">1770313147</div>
										</td>
									</tr>
									<tr>
										<td>
											邮箱
											<div class="tb_information">1770313147@qq.com</div>
										</td>
									</tr>
								</tbody>
							</table>

						</div>

						<!-- 模态框底部 -->
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary back-information" data-dismiss="modal">关闭</button>
						</div>
					</div>
				</div>
			</div>

			<!--模态框查看通知-->
			<div class="modal fade" id="myModal-email">
				<div class="modal-dialog">
					<div class="modal-content">

						<div class="modal-header">
							<h4 class="modal-title">通知</h4>
							<button type="button" class="close close1" data-dismiss="modal">&times;</button>
						</div>

						<div class="modal-body">
							<div class="email">
								来自xx学校xx学院xx老师的邀请
								<button class="btn btn-primary accept">接受</button>
								<button class="btn btn-danger refuse" data-toggle="modal" data-target="#myModal_email_refuse">拒绝</button>
							</div>
							<div class="email">
								来自xx学校xx学院xx老师的邀请
								<button class="btn btn-primary accept">接受</button>
								<button class="btn btn-danger refuse">拒绝</button>
							</div>
							<div class="email">
								来自xx学校xx学院xx老师的邀请
								<button class="btn btn-primary accept">接受</button>
								<button class="btn btn-danger refuse">拒绝</button>
							</div>
							<div class="email">
								来自xx学校xx学院xx老师的邀请
								<button class="btn btn-primary accept">接受</button>
								<button class="btn btn-danger refuse">拒绝</button>
							</div>
						</div>

						<div class="modal-footer">
							<button type="button" class="btn btn-secondary back-email" data-dismiss="modal">关闭</button>
						</div>
					</div>
				</div>
			</div>

			<!--邀请组卷拒绝模态框-->
			<div class="modal fade" id="myModal_email_refuse">
				<div class="modal-dialog modal-sm">
					<div class="modal-content">

						<!-- 模态框头部 -->
						<div class="modal-header">
							<h4 class="modal-title">拒绝理由</h4>
							<button type="button" class="close close1" data-dismiss="modal">&times;</button>
						</div>

						<!-- 模态框主体 -->
						<div class="modal-body">
							<textarea rows="5" cols="30" placeholder="请输入拒绝理由">
		         	
		         </textarea>
						</div>

						<!-- 模态框底部 -->
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary back" data-dismiss="modal">关闭</button>
							<button type="button" class="btn btn-primary add">提交</button>
						</div>

					</div>
				</div>
			</div>

			<!--模态框阅卷邀请通知-->
			<div class="modal fade" id="myModal_read">
				<div class="modal-dialog">
					<div class="modal-content">

						<div class="modal-header">
							<h4 class="modal-title">通知</h4>
							<button type="button" class="close close1" data-dismiss="modal">&times;</button>
						</div>

						<div class="modal-body">
							<div class="email">
								来自xx学校xx学院xx老师的邀请
								<button class="btn btn-primary accept" id="accept" onclick="window.location='teacher_read.jsp'">接受</button>
								<button class="btn btn-danger refuse" data-toggle="modal" data-target="#myModal_read_refuse">拒绝</button>
							</div>
							<div class="email">
								来自xx学校xx学院xx老师的邀请
								<button class="btn btn-primary accept">接受</button>
								<button class="btn btn-danger refuse">拒绝</button>
							</div>
							<div class="email">
								来自xx学校xx学院xx老师的邀请
								<button class="btn btn-primary accept">接受</button>
								<button class="btn btn-danger refuse">拒绝</button>
							</div>
							<div class="email">
								来自xx学校xx学院xx老师的邀请
								<button class="btn btn-primary accept">接受</button>
								<button class="btn btn-danger refuse">拒绝</button>
							</div>
						</div>

						<div class="modal-footer">
							<button type="button" class="btn btn-secondary back-email" data-dismiss="modal">关闭</button>
						</div>
					</div>
				</div>
			</div>

			<!--拒绝阅卷模态框-->
			<div class="modal fade" id="myModal_read_refuse">
				<div class="modal-dialog modal-sm">
					<div class="modal-content">

						<!-- 模态框头部 -->
						<div class="modal-header">
							<h4 class="modal-title">拒绝理由</h4>
							<button type="button" class="close close1" data-dismiss="modal">&times;</button>
						</div>

						<!-- 模态框主体 -->
						<div class="modal-body">
							<textarea rows="5" cols="30" placeholder="请输入拒绝理由">
		         	
		         </textarea>
						</div>

						<!-- 模态框底部 -->
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary back" data-dismiss="modal">关闭</button>
							<button type="button" class="btn btn-primary add">提交</button>
						</div>

					</div>
				</div>
			</div>
	
	
	</body>

	<script type="text/javascript" src="js/search.js"></script>
	
	</script>
</html>