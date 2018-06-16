<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
		<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
		<meta name="description" content="Developed By M Abdur Rokib Promy">
		<meta name="keywords" content="Admin, Bootstrap 3, Template, Theme, Responsive">
		<!-- bootstrap 3.0.2 -->
		<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
		<!-- font Awesome -->
		<link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" />
		<!-- Ionicons -->
		<link href="css/ionicons.min.css" rel="stylesheet" type="text/css" />
         
		<link href='http://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
		<!-- Theme style -->
		<link href="css/lxhstyle.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="js/jquery-3.2.1.min.js" ></script>
		<script type="text/javascript" src="js/bootstrap.min.js" ></script>
	</head>

	<body>
		<section class="navgationandhead">
			<!-- head start -->
			<div class="logo">
				<img src="img/logo.png" />
			</div>

			<div class="banner">
				<div class="dropdown users">
					<button class="dropbtn">
					    			<a href="#" class="dropdown-toggle" data-toggle="dropdown">
					    				<i class="fa fa-user"></i>
					    				<span>Jane Doe <i class="caret"></i></span>
					    			</a>    		
					    	    </button>
					<div class="dropdown-content">
						<a href="#" data-toggle="modal" data-target="#myModal-information">个人中心</a>
						<a href="#">退出系统</a>
					</div>
				</div>
				<div class="dropdown task">
					<button class="dropbtn">
					    			<a href="#" class="dropdown-toggle" data-toggle="dropdown">
					    				<i class="fa fa-tasks"></i>
					    			</a>
					    	    </button>
					<div class="dropdown-content">
						<a href="#" data-toggle="modal" data-target="#myModal-invite-teacher">邀请老师出卷</a>
						<a href="#" data-toggle="modal" data-target="#myModal-invite-school">邀请学校考试</a>
					</div>
				</div>

				<div class="dropdown notice">
					<button class="dropbtn">
					    			    			<a href="#" class="dropdown-toggle" data-toggle="dropdown">
					    			    				<i class="fa fa-envelope"></i>
					    			    				<span class="label label-success noticelabel">4</span>
					    			    			</a>
					    			    	    </button>
					<div class="dropdown-content">
						<a href="#" data-toggle="modal" data-target="#myModal-invite-notice">邀请通知</a>
						<a href="#" data-toggle="modal" data-target="#myModal-exam-notice">考试通知</a>
					</div>
				</div>

			</div>
			<!-- head end -->

			<!-- sidebar start -->
			<nav class="navbar bg-light">
				<div class="user-panel">
					<div class="image">
						<img class="user1" src="img/1098.jpg" alt="User Image">
					</div>
					<div class="info">
						<p>Hello, 教务周</p>
					</div>
				</div>
				<div class="light_bottom">
					<ul class="side_nav">
						<li class="side_nav1">
							<a href="staffs_student.html">学生信息管理</a>
						</li>
						<li class="side_nav1">
							<a href="staffs_teacher.html">教师信息管理</a>
						</li>
						<li class="side_nav1">
							<a href="jwindex.html">试卷管理 </a>
						</li>
						<li class="side_nav1">
							<a href="jwhandzujuan.html">手动组卷</a>
						</li>
						<li class="side_nav1">
							<a href="jwintelzujuan.html">智能组卷</a>
						</li>
						<li class="side_nav1">
							<a href="history_staffs.html">历史成绩</a>
						</li>
						<li class="side_nav1">
							<a href="test.html">考次计划</a>
						</li>
					</ul>
				</div>
			</nav>
			<!-- sidebar end -->
			<!-- container start -->
			<div class="cant">
				<div class="bred">
					<!--breadcrumbs start -->
					<ul class="breadcrumb mybread">
						<li>
							<a href="#"><i class="fa fa-home"></i> Home</a>
						</li>
						<!--<li>
		    					<a href="#">Dashboard</a>
		    				</li>-->
						<li class="active">智能组卷</li>
					</ul>
					<!--breadcrumbs end -->
				</div>
				<section class="papermanage">
					<!-- 智能组卷 start-->
						<div class="autocompose">
							<table class="table table-hover mytable">
								<thead>
									<tr>
										<th>题型</th>
										<th>题库题量</th>
										<th>设置题量</th>
										<th>难度系数</th>
										<th>题量</th>
										<th>每题分值</th>
										<th>未分配量</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td  id="qtype">单选题</td>
										<td  id="leamount">？道可选</td>
										<td  id="qmount"><input type="text" />道</td>
										<td>
											<div class="nandu">
												<span>简单<input type="text"/>%</span>
												<span>一般<input type="text"/>%</span>
												<span>难&nbsp;<input type="text"/>%</span>
												<span>较难<input type="text"/>%</span>
											</div>
										</td>
										<td>
											<div>
												<span>选择？道题</span>
												<span>选择？道题</span>
												<span>选择？道题</span>
												<span>选择？道题</span>
											</div>
										</td>
										<td  id="eachq">每题<input type="text"/>分</td>
										<td  id="leamark">剩余？分未分配</td>
									</tr>
									<tr>
										<td id="qtype">多选题</td>
										<td id="leamount">？道可选</td>
										<td id="qmount"><input type="text"/>道</td>
										<td>
											<div class="">
												<span>简单<input type="text"/>%</span>
												<span>一般<input type="text"/>%</span>
												<span>难 &nbsp; <input type="text"/>%</span>
												<span>较难<input type="text"/>%</span>
											</div>
										</td>
										<td>
											<div>
												<span>选择？道题</span>
												<span>选择？道题</span>
												<span>选择？道题</span>
												<span>选择？道题</span>
											</div>
										</td>
										<td  id="eachq">每题<input type="text" />分</td>
										<td  id="leamark">剩余？分未分配</td>
									</tr>
									<tr>
										<td id="qtype">填空题</td>
										<td id="leamount">？道可选</td>
										<td id="qmount"><input type="text" />道</td>
										<td>
											<div class="">
												<span>简单<input type="text"/>%</span>
												<span>一般<input type="text"/>%</span>
												<span>难 &nbsp; <input type="text"/>%</span>
												<span>较难<input type="text"/>%</span>
											</div>
										</td>
										<td>
											<div>
												<span>选择？道题</span>
												<span>选择？道题</span>
												<span>选择？道题</span>
												<span>选择？道题</span>
											</div>
										</td>
										<td id="eachq">每题<input type="text"/>分</td>
										<td id="leamark">剩余？分未分配</td>
									</tr>
									<tr>
										<td  id="qtype">判断题</td>
										<td  id="leamount">？道可选</td>
										<td  id="qmount"><input type="text"/>道</td>
										<td>
											<div class="">
												<span>简单<input type="text"/>%</span>
												<span>一般<input type="text"/>%</span>
												<span>难 &nbsp; <input type="text"/>%</span>
												<span>较难<input type="text"/>%</span>
											</div>
										</td>
										<td>
											<div>
												<span>选择？道题</span>
												<span>选择？道题</span>
												<span>选择？道题</span>
												<span>选择？道题</span>
											</div>
										</td>
										<td>
											<div>
												<span>每题<input type="text"/>分</span>
												<span>每题<input type="text"/>分</span>
												<span>每题<input type="text"/>分</span>
												<span>每题<input type="text"/>分</span>
											</div>
										</td>
										<td  id="leamark">剩余？分未分配</td>
									</tr>
									<tr>
										<td id="qtype">解答题</td>
										<td id="leamount">？道可选</td>
										<td id="qmount"><input type="text"/>道</td>
										<td>
											<div class="">
												<span>简单<input type="text"/>%</span>
												<span>一般<input type="text"/>%</span>
												<span>难 &nbsp; <input type="text"/>%</span>
												<span>较难<input type="text"/>%</span>
											</div>
										</td>
										<td>
											<div>
												<span>选择？道题</span>
												<span>选择？道题</span>
												<span>选择？道题</span>
												<span>选择？道题</span>
											</div>
										</td>
										<td>
											<div>
												<span>每题<input type="text" />分</span>
												<span>每题<input type="text" />分</span>
												<span>每题<input type="text" />分</span>
												<span>每题<input type="text" />分</span>
											</div>
										</td>
										<td id="leamark">剩余？分未分配</td>
									</tr>
							
								</tbody>
							</table>
						
							<p style="text-align: center;"><button type="submit" class="btn btn-primary" onclick="window.open('apaper.html')">生成试卷并预览</button></p>
						</div>
					</section>
					<!-- 智能组卷 end-->
		
	
		<!-- container end -->
		</section>

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
										用户名
										<div class="tb_information">Mary Doe</div>
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
										姓名
										<div class="tb_information">教师XXX</div>
									</td>
								</tr>
								<tr>
									<td>
										性别
										<div class="tb_information">女 </div>
									</td>
								</tr>
								<tr>
									<td>
										电话
										<div class="tb_information">15574014263</div>
									</td>
								</tr>
								<tr>
									<td>
										所属大学
										<div class="tb_information">萍乡学院</div>
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
						<button type="button" class="btn btn-secondary back_information" data-dismiss="modal">关闭</button>
					</div>
				</div>
			</div>
		</div>
		
		<!--模态框查看通知-->
		<div class="modal fade" id="myModal-invite-notice">
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
		
		<!--模态框邀请老师组卷-->
		<div class="modal fade" id="myModal-invite-teacher">
			<div class="modal-dialog">
				<div class="modal-content">
					<!-- 模态框头部 -->
					<div class="modal-header">
						<h4 class="modal-title">邀请老师组卷</h4>
						<button type="button" class="close close1" data-dismiss="modal">&times;</button>
					</div>-->
		
					<!-- 模态框主体 -->
					<div class="modal-body">
						<table>
							<tbody>
								<tr>
									<td>
										姓&nbsp;&nbsp;&nbsp;&nbsp;名&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="text" class="hover">
									</td>
								</tr>
								<tr>
									<td>
										学&nbsp;&nbsp;&nbsp;&nbsp;校&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="text" class="hover">
									</td>
								</tr>
								<tr>
									<td>
										学&nbsp;&nbsp;&nbsp;&nbsp;院&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="text" class="hover">
									</td>
								</tr>
								<tr>
									<td>
										专&nbsp;&nbsp;&nbsp;&nbsp;业&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="text" class="hover">
									</td>
								</tr>
								<tr>
									<td>
										专&nbsp;&nbsp;&nbsp;&nbsp;业&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="text" class="hover">
									</td>
								</tr>
							</tbody>
						</table>
					</div>
		
					<!-- 模态框底部 -->
					<div class="modal-footer">
						<button type="button" class="btn btn-primary add_invite">邀请</button>
						<button type="button" class="btn btn-secondary back_invite" data-dismiss="modal">关闭</button>
					</div>
		
				</div>
			</div>
		</div>
		
		<!--模态框邀请学校参加考试-->
		<div class="modal fade" id="myModal-invite-school">
			<div class="modal-dialog">
				<div class="modal-content">
		
					<!-- 模态框头部 -->
					<div class="modal-header">
						<h4 class="modal-title">邀请学校参加考试</h4>
						<button type="button" class="close close1" data-dismiss="modal">&times;</button>
					</div>
		
					<!-- 模态框主体 -->
					<div class="modal-body">
						<table>
							<tbody>
								<tr>
									<td>
										学&nbsp;&nbsp;&nbsp;&nbsp;校&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="text" class="hover">
									</td>
								</tr>
								<tr>
									<td>
										学&nbsp;&nbsp;&nbsp;&nbsp;院&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="text" class="hover">
									</td>
								</tr>
								<tr>
									<td>
										专&nbsp;&nbsp;&nbsp;&nbsp;业&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="text" class="hover">
									</td>
								</tr>
							</tbody>
						</table>
					</div>
		
					<!-- 模态框底部 -->
					<div class="modal-footer">
						<button type="button" class="btn btn-primary add_invite">邀请</button>
						<button type="button" class="btn btn-secondary back_invite" data-dismiss="modal">关闭</button>
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

</body>
</html>