<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/staffs_teacher.css" />
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/font-awesome.min.css" />
<link rel="stylesheet" href="css/ionicons.min.css" />
<link href="css/toastr.css" rel="stylesheet" type="text/css" />
 <link href="css/jquery-confirm.css" rel="stylesheet" type="text/css" />
          <link href="css/toastr.css" rel="stylesheet" type="text/css" />
</head>

<body>
	<!--上方导航栏-->
	<div class="all">
		<header class="header"> <nav class="navbar navbar-static-top"
			role="navigation"> <a class="logo" href="#"><img
			class="logo" src="img/logo.png"></a>
		<div class="banner">
			<div class="dropdown users">
				<button class="dropbtn">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown"> <i
						class="fa fa-user"></i> <span>${session.user.userId}<i
							class="caret"></i></span>
					</a>
				</button>
				<div class="dropdown-content">
					<a href="#" data-toggle="modal" data-target="#myModal_information">个人中心</a>
					<a href="javascript:setPassword()">修改密码</a>
					<a href="#" onclick="Out()">退出系统</a>
				</div>
			</div>
			<!-- 	<div class="dropdown task">
						<button class="dropbtn">
						    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
						    	<i class="fa fa-tasks"></i>
						    </a>
						</button>
						<div class="dropdown-content">
							<a href="#" data-toggle="modal" data-target="#myModal_invite_teacher">邀请老师出卷</a>
							<a href="#" data-toggle="modal" data-target="#myModal_invite_school">邀请学校考试</a>
						</div>
					</div>
					<div class="dropdown task" >
					<button class="dropbtn envolope">
						<i class="fa fa-envelope envelope"></i>	
						<span class="label-success "><i></i></span>
					</button>
						<div class="dropdown-content">
							<a href="#" data-toggle="modal" data-target="#myModal-invite-notice">邀请通知</a>
							<a href="#" data-toggle="modal" data-target="#myModal-exam-notice">阅卷通知</a>
						</div>
				</div> -->
		</div></header>

		<!--侧边导航栏-->

		<nav class="navbar bg-light">
		<div class="user-panel">
			<div class="image">
				<img class="user1" src="img/1098.jpg" alt="User Image">
			</div>
			<div class="info">
				<p>Hello, ${session.user.userId}</p>
			</div>

		</div>
		<div class="light_bottom">
			<ul class="side_nav">
				<a href="staffs_student.jsp">
					<li class="side_nav1 ">学生信息管理</li>
				</a>
				<a href="staffs_teacher.jsp">
					<li class="side_nav1 now">教师信息管理</li>
				</a>
				<a href="affair_index.jsp">
					<li class="side_nav1">试卷管理</li>
				</a>
				<!-- <li class="side_nav1">
							<a href="affair_hand_volume.jsp">手动组卷</a>
						</li>
						<li class="side_nav1">
							<a href="affair_intel_volume.jsp">智能组卷</a>
						</li> -->
				<a href="history_staffs.jsp">
					<li class="side_nav1">历史成绩</li>
				</a>
				<a href="test.jsp">
					<li class="side_nav1">考次计划</li>
				</a>
			</ul>
		</div>
		</nav>

		<!--中间部分-->
		<div class="main">
			<div class="main1">
				<div class="bred position">
					<!--breadcrumbs start -->
					<ul class="breadcrumb mybread position">
						<li class="active"><a href="affair_index.jsp"><i
								class="fa fa-home"></i> Home</a></li>
						<li>教师信息管理</li>
					</ul>
					<!--breadcrumbs end -->
				</div>
				<div class="top_main">
					<div class="top_button">
						<button class="btn btn1" type="button" data-toggle="modal"
							data-target="#myModal_addTeacher">
							<i class="fa fa-plus-circle"></i> 添加教师
						</button>
						<button type="button" class="btn btn2" id="find">
							<i class="fa fa-search-minus"></i> 条件搜索
						</button>
					</div>
					<div class="search_hide" id="hide">
						<input type="text" class="input_hide1 form-control" id="userId2"
							placeholder="工号" /> <input type="text"
							class="input_hide form-control" id="name2" placeholder="姓名" /> <input
							type="text" class="input_hide form-control" id="profession2"
							placeholder="专业" /> <input type="text"
							class="input_hide form-control" id="college2" placeholder="学校" />
						<!-- <select class="input_hide form-control" id="sex2">
				             <option>男</option>
				             <option>女</option>
				        </select> -->
						<button type="button" class="btn right_search"
							onclick="loadTeacherList(1)">搜索</button>
						<button type="button" class="btn right_search" onclick="clean()">重置</button>
					</div>


					<!--table-->
					<div class="tip">教师信息</div>
					<table class="table table-striped tb1">
						<thead class="thead-light">
							<tr class="tb_width">
								<th>序号</th>
								<th>姓名</th>
								<th>工号</th>
								<th>学校</th>
								<th>专业</th>
								<th>性别</th>
								<th>联系方式</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody id="teacher-list-box">
							<tr class="tb_width">
								<td>1</td>
								<td>慕雪</td>
								<td>慕雪</td>
								<td>萍乡学院</td>
								<td>软件工程</td>
								<td>女</td>
								<td>1770313147</td>
								<td><i class="fa fa-eye" data-toggle="modal"
									data-target="#myModal_eye_teacher"></i> <i
									class="fa fa-pencil check"></i> <i class="fa fa-trash-o"></i></td>
							</tr>

						</tbody>
					</table>
					<!--<div class="bottom_button">
					<button class="btn btn3" type="button" >全选</button>
					<button class="btn btn4" type="button" >全不选</button>
					<button class="btn btn5" type="button" >反选</button>
					
				</div>-->


					<!--页码-->
					<div class="page_pagination">
						<ul class="pagination">
							<li class="page-item"><a class="page-link" href="#">上一页</a></li>
							<li class="page-item"><a class="page-link" href="#">1</a></li>
							<li class="page-item active"><a class="page-link " href="#">2</a></li>
							<li class="page-item"><a class="page-link" href="#">3</a></li>
							<li class="page-item"><a class="page-link" href="#">下一页</a></li>
							<!-- <input class="jump">
					    <button class="btn btn-primary btn_jump">跳转</button> -->
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!--模态框查看个人信息-->
	<div class="modal fade" id="myModal_information">
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
								<td>姓名
									<div class="tb_information">${session.user.name}</div>
								</td>
							</tr>
							<tr>
								<td>工号
									<div class="tb_information">${session.user.userId}</div>
								</td>
							</tr>
							<tr>
								<td>密码
									<div class="tb_information">${session.user.psw}</div>
								</td>
							</tr>
							<tr>
								<td>学校
									<div class="tb_information">${session.user.collegeName}</div>
								</td>
							</tr>
							
							<tr>
								<td>性别
									<div class="tb_information">${session.user.sex}</div>
								</td>
							</tr>
							<tr>
								<td>联系方式
									<div class="tb_information">${session.user.phone}</div>
								</td>
							</tr>
							<tr>
								<td>邮箱
									<div class="tb_information">${session.user.email}</div>
								</td>
							</tr>
						</tbody>
					</table>

				</div>

				<!-- 模态框底部 -->
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary back-information"
						data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>


	<!-- 模态框添加教师信息 -->
	<div class="modal fade" id="myModal_addTeacher">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- 模态框头部 -->
				<div class="modal-header">
					<h4 class="modal-title">添加教师</h4>
					<button type="button" class="close close1" data-dismiss="modal">&times;</button>
				</div>

				<!-- 模态框主体 -->
				<div class="modal-body">
					<table>
						<tbody>
							<tr>
									<td>
										工&nbsp;&nbsp;&nbsp;&nbsp;号&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="text" class="hover form-control" id="te_userId" >
									</td>
								</tr> 
							<tr>
								<td>姓&nbsp;&nbsp;&nbsp;&nbsp;名&nbsp;&nbsp;&nbsp;&nbsp; <input
									type="text" class="hover form-control" id="te_name">
								</td>
							</tr>
							<tr>
								<td>学&nbsp;&nbsp;&nbsp;&nbsp;校&nbsp;&nbsp;&nbsp;&nbsp; <input
									type="text" class="hover form-control" id="te_collegeName">
								</td>
							</tr>
							<tr>
								<td>学&nbsp;&nbsp;&nbsp;&nbsp;院&nbsp;&nbsp;&nbsp;&nbsp; <input
									type="text" class="hover form-control" id="te_department"
									name="user.department">
								</td>
							</tr>
						
							<tr>
									<td>
										专&nbsp;&nbsp;&nbsp;&nbsp;业&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="text" class="hover form-control" id="te_profession">
									</td>
								</tr> 
							<tr>
								<td class="choose-sex">
									性&nbsp;&nbsp;&nbsp;&nbsp;别&nbsp;&nbsp;&nbsp;&nbsp; <select
									class="hover form-control" name="user.sex" id="te_sex">
										<option class="hover">男</option>
										<option class="hover">女</option>
								</select>
								</td>
							</tr>
							<tr>
								<td>联系方式&nbsp; <input type="text"
									class="hover form-control" id="te_phone" onblur="checkPhone1()">
								</td>
							</tr>

						</tbody>
					</table>

				</div>

				<!-- 模态框底部 -->
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary back"
						data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary add"
						onclick="createTeacher()">添加</button>
				</div>

			</div>
		</div>
	</div>

	<!--模态框修改教师信息 -->
	<div class="modal fade" id="myModal_check">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- 模态框头部 -->
				<div class="modal-header">
					<h4 class="modal-title">修改教师信息</h4>
					<button type="button" class="close close1" data-dismiss="modal">&times;</button>
				</div>

				<!-- 模态框主体 -->
				<div class="modal-body">
					<table>
						<tbody id="editTeacher">
							<tr>
								<td>工&nbsp;&nbsp;&nbsp;&nbsp;号&nbsp;&nbsp;&nbsp;&nbsp; <input
									type="text" class="hover form-control" readonly="readonly"
									disabled id="teacher_userId" name="user.userId">
								</td>
							</tr>
							<tr>
								<td>姓&nbsp;&nbsp;&nbsp;&nbsp;名&nbsp;&nbsp;&nbsp;&nbsp; <input
									type="text" class="hover form-control" id="teacher_name"
									name="user.name">
								</td>
							</tr>
							<td class="choose-sex">
								性&nbsp;&nbsp;&nbsp;&nbsp;别&nbsp;&nbsp;&nbsp;&nbsp; <select
								class="hover form-control" id="teacher_sex" name="user.sex">
									<option class="hover 男">男</option>
									<option class="hover 女">女</option>
							</select>
							</td>

							<tr>
								<td>学&nbsp;&nbsp;&nbsp;&nbsp;校&nbsp;&nbsp;&nbsp;&nbsp; <input
									type="text" class="hover form-control" id="teacher_collegeName"
									name="user.collegeName">
								</td>
							</tr>
							<tr>
								<td>学&nbsp;&nbsp;&nbsp;&nbsp;院&nbsp;&nbsp;&nbsp;&nbsp; <input
									type="text" class="hover form-control" id="teacher_department"
									name="user.department">
								</td>
							</tr>
							<!-- <tr>
									<td>
										专&nbsp;&nbsp;&nbsp;&nbsp;业&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="text" class="hover form-control" id="teacher_profession" name="user.profession">
									</td>
								</tr>
								<tr>
									<td>
										班&nbsp;&nbsp;&nbsp;&nbsp;级&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="text" class="hover form-control" id="teacher_classroom" name="user.classroom">
									</td>
								</tr> -->
							<tr>
								<td>身份证号&nbsp; <input type="text" onblur="checkIdCard()"
									class="hover form-control" id="teacher_idcard"
									name="user.idcard">
								</td>
							</tr>
							<tr>
								<td>联系方式&nbsp; <input type="text" onblur="checkPhone()"
									class="hover form-control" id="teacher_phone" name="user.phone">
								</td>
							</tr>
							<tr>
								<td>电子邮件&nbsp; <input type="text" onblur="checkEmail()"
									class="hover form-control" id="teacher_email" name="user.email">
								</td>
							</tr>

						</tbody>
					</table>

				</div>

				<!-- 模态框底部 -->
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary back"
						data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary add"
						onclick="editTeacher()">修改</button>
					<!-- // -->
				</div>

			</div>
		</div>
	</div>
	<!--模态框邀请老师组卷-->
	<div class="modal fade" id="myModal_invite_teacher">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- 模态框头部 -->
				<div class="modal-header">
					<h4 class="modal-title">邀请老师组卷</h4>
					<button type="button" class="close close1" data-dismiss="modal">&times;</button>
				</div>

				<!-- 模态框主体 -->
				<div class="modal-body">
					<table>
						<tbody>
							<tr>
								<td>姓&nbsp;&nbsp;&nbsp;&nbsp;名&nbsp;&nbsp;&nbsp;&nbsp; <input
									type="text" class="hover">
								</td>
							</tr>
							<tr>
								<td>学&nbsp;&nbsp;&nbsp;&nbsp;校&nbsp;&nbsp;&nbsp;&nbsp; <input
									type="text" class="hover">
								</td>
							</tr>
							<tr>
								<td>学&nbsp;&nbsp;&nbsp;&nbsp;院&nbsp;&nbsp;&nbsp;&nbsp; <input
									type="text" class="hover">
								</td>
							</tr>
							<tr>
								<td>专&nbsp;&nbsp;&nbsp;&nbsp;业&nbsp;&nbsp;&nbsp;&nbsp; <input
									type="text" class="hover">
								</td>
							</tr>
							<tr>
								<td>专&nbsp;&nbsp;&nbsp;&nbsp;业&nbsp;&nbsp;&nbsp;&nbsp; <input
									type="text" class="hover">
								</td>
							</tr>
						</tbody>
					</table>
				</div>

				<!-- 模态框底部 -->
				<div class="modal-footer">
					<button type="button" class="btn btn-primary add_invite">邀请</button>
					<button type="button" class="btn btn-secondary back_invite"
						data-dismiss="modal">关闭</button>
				</div>

			</div>
		</div>
	</div>

	<!--模态框邀请学校参加考试-->
	<div class="modal fade" id="myModal_invite_school">
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
								<td>学&nbsp;&nbsp;&nbsp;&nbsp;校&nbsp;&nbsp;&nbsp;&nbsp; <input
									type="text" class="hover">
								</td>
							</tr>
							<tr>
								<td>学&nbsp;&nbsp;&nbsp;&nbsp;院&nbsp;&nbsp;&nbsp;&nbsp; <input
									type="text" class="hover">
								</td>
							</tr>
							<tr>
								<td>专&nbsp;&nbsp;&nbsp;&nbsp;业&nbsp;&nbsp;&nbsp;&nbsp; <input
									type="text" class="hover">
								</td>
							</tr>
						</tbody>
					</table>
				</div>

				<!-- 模态框底部 -->
				<div class="modal-footer">
					<button type="button" class="btn btn-primary add_invite">邀请</button>
					<button type="button" class="btn btn-secondary back_invite"
						data-dismiss="modal">关闭</button>
				</div>

			</div>
		</div>
	</div>

	<!--模态框查看教师信息-->
	<div class="modal fade" id="myModal_eye_teacher">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- 模态框头部 -->
				<div class="modal-header">
					<h4 class="modal-title">教师信息</h4>
					<button type="button" class="close close1" data-dismiss="modal">&times;</button>
				</div>

				<!-- 模态框主体 -->
				<div class="modal-body eye_teacher">
					<table>
						<tbody id="teacher-info-box">
							<tr>
								<td>用户名
									<div class="tb_information">慕雪</div>
								</td>
							</tr>
							<tr>
								<td>密码
									<div class="tb_information">17001</div>
								</td>
							</tr>
							<tr>
								<td>姓名
									<div class="tb_information">慕雪</div>
								</td>
							</tr>
							<tr>
								<td>学校
									<div class="tb_information">萍乡学院</div>
								</td>
							</tr>
							<tr>
								<td>专业
									<div class="tb_information">软件工程</div>
								</td>
							</tr>
							<tr>
								<td>性别
									<div class="tb_information">女</div>
								</td>
							</tr>
							<tr>
								<td>联系方式
									<div class="tb_information">1770313147</div>
								</td>
							</tr>

						</tbody>
					</table>

				</div>

				<!-- 模态框底部 -->
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary back-information"
						data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>

	<!--邀请通知-->
	<div class="modal fade" id="myModal-invite-notice">
		<div class="modal-dialog">
			<div class="modal-content">

				<div class="modal-header">
					<h4 class="modal-title">邀请通知</h4>
					<button type="button" class="close close1" data-dismiss="modal">&times;</button>
				</div>

				<div class="modal-body">
					<div class="email">
						来自xx学校xx学院xx老师的邀请
						<button class="btn btn-primary accept">接受</button>
						<button class="btn btn-danger refuse" data-toggle="modal"
							data-target="#myModal_email_refuse">拒绝</button>
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
					<button type="button" class="btn btn-secondary back-email"
						data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>

	<!--阅卷通知-->
	<div class="modal fade" id="myModal-exam-notice">
		<div class="modal-dialog">
			<div class="modal-content">

				<div class="modal-header">
					<h4 class="modal-title">阅卷通知</h4>
					<button type="button" class="close close1" data-dismiss="modal">&times;</button>
				</div>

				<div class="modal-body">
					<div class="email">
						来自xx学校xx学院xx老师的邀请
						<button class="btn btn-primary accept">接受</button>
						<button class="btn btn-danger refuse" data-toggle="modal"
							data-target="#myModal_email_refuse">拒绝</button>
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
					<button type="button" class="btn btn-secondary back-email"
						data-dismiss="modal">关闭</button>
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
					<button type="button" class="btn btn-secondary back"
						data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary add">提交</button>
				</div>

			</div>
		</div>
	</div>
	<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
	<script
		src="https://cdn.bootcss.com/popper.js/1.12.5/umd/popper.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/toastr.js"></script>

</body>
<script type="text/javascript">
	loadTeacherList(1);
	var currentPage=1;
	var totalPage=3;
	function loadTeacherList(page) {
		var userId=$('#userId2').val();
		var name=$('#name2').val();
		var profession=$('#profession2').val();
		var collegeName=$('#college2').val();
		//var sex=$('#sex2').val();
		
		$.post("selectUserList",{
			"user.type":"教师",
			"page":page,
			"user.userId":userId,
			"user.name":name,
			"user.collegeName":collegeName,
			"user.profession":profession
			//"user.sex":sex
			
		},function(data) {
			  var userList=data.userList;
			  totalPage=data.totalPage;      
			  var htm = "";
			  var ht = "";
			  for(var i=0;i<userList.length;i++) {
				  	var number=(page-1)*10;
				  	number +=i+1;
		 			htm += getItemHtml(i, userList[i],number);
		 		}
			 $('#teacher-list-box').html(htm);
			 for(var j=1;j<=totalPage;j++) {
				 ht += getLiHtml(j);
			 }
			 $('.pagination').html(ht);
		 		currentPage = page;
		  })  
	}
	
	function nextPage() {
		if(currentPage<totalPage) 
			loadTeacherList(++currentPage);
	}
	
	function prevPage() {
		if(currentPage>=2) 
			loadTeacherList(--currentPage);
	}
	
	function getItemHtml(index, obj,number) {
		var htm = "<tr class='tb_width'>"
			+"<td>"+number+"</td>"
			+"<td>"+obj.name+"</td>"
			+"<td>"+obj.userId+"</td>"
			+"<td>"+obj.collegeName+"</td>"
			+"<td>"+obj.profession+"</td>"
			+"<td>"+obj.sex+"</td>"
			+"<td>"+obj.phone+"</td>"
			+"<td>"
			+"<i class='fa fa-eye see' data-toggle='modal' data-target='#myModal_eye_teacher' onclick='teacherInfo(this)'></i>" 
			+"<i class='fa fa-pencil check' data-toggle='modal' data-target='#myModal_check' onclick='teacherInfo(this)'></i>"
			+"<i class='fa fa-trash-o' onclick='deleteTeacher(this)'></i>"
			+"</td>"
			+"</tr>";
		return htm;
	}
	function getLiHtml(index) {
		if(index==1){
			var ht = "<li class='page-item'><a class='page-link' href='javascript:prevPage()'>上一页</a></li>"
				+"<li class='page-item active' id='first'><a class='page-link' href='javascript:loadTeacherList("+index+")'>"+index+"</a></li>";
		}
		else if(index==totalPage){
			var ht = "<li class='page-item' id='total'><a class='page-link' href='javascript:loadTeacherList("+index+")'>"+index+"</a></li>"
				+"<li class='page-item'><a class='page-link' href='javascript:nextPage()'>下一页</a></li>";
		}
		else {
			var ht = "<li class='page-item' id='second'><a class='page-link ' href='javascript:loadTeacherList("+index+")'>"+index+"</a></li>";
			
		}
		return ht;    
	}
	function teacherInfo(node) {
		var td = node.parentNode.parentNode.childNodes;
		var userId = td[2].innerHTML;
		$.post("showUser",{"user.userId":userId},function(data) {
			var user = data.user;
			var info = getInfoHtml(user);
			$('#teacher-info-box').html(info);
			
			$('#teacher_name').val(user.name);
			/* $('#teacher_sex').find("."+user.sex).attr("checked", "checked"); */
			 $('#teacher_sex').val(user.sex);
			$('#teacher_userId').val(user.userId);
			$('#teacher_collegeName').val(user.collegeName);
			$('#teacher_department').val(user.department);
			$('#teacher_profession').val(user.profession);
			$('#teacher_classroom').val(user.classroom);
			$('#teacher_idcard').val(user.idcard);
			$('#teacher_phone').val(user.phone);
			$('#teacher_email').val(user.email);
		});
	}	
	function getInfoHtml(obj) {
		var info = "<tr>"
			+"<td>"
			+"姓名"
			+"<div class='tb_information'>"+obj.name+"</div>"
			+"</td>"
			+"</tr>"
			+"<tr>"
			+"<td>"
			+"学号"
			+"<div class='tb_information'>"+obj.userId+"</div>"
			+"</td>"
			+"</tr>"
			+"<tr>"
			+"<td>"
			+"学校"
			+"<div class='tb_information'>"+obj.collegeName+"</div>"
			+"</td></tr>"
			+"<tr><td>"
			+"学院"
			+"<div class='tb_information'>"+obj.department+"</div>"
			+"</td></tr>"
			+"<tr><td>"
			+"专业"
			+"<div class='tb_information'>"+obj.profession+"</div>"
			+"</td></tr>"
			+"<tr><td>"
			+"身份证号"
			+"<div class='tb_information'>"+obj.idcard+"</div>"
			+"</td></tr>"
			+"<tr><td>"
			+"性别"
			+"<div class='tb_information'>"+obj.sex+"</div>"
			+"</td></tr>"
			+"<tr><td>"
			+"联系方式"
			+"<div class='tb_information'>"+obj.phone+"</div>"
			+"</td></tr>"
			+"<tr><td>"
			+"邮箱"
			+"<div class='tb_information'>"+obj.email+"</div>"
			+"</td></tr>";
		return info;
	}
	
	function checkPhone1(){
		var mobile = $("#te_phone").val();
		
		//焦点移除的时候进行验证
		var myreg =/^[1][3,4,5,7,8][0-9]{9}$/; 
		var myid = /^[1-9]{1}[0-9]{14}$|^[1-9]{1}[0-9]{16}([0-9]|[xX])$/;
		console.log(myreg.test(mobile));
		//手机的格式
	        if (!myreg.test(mobile)) {   			//如果手机号码的格式与正则的不符合，就提醒
	            toastr.error("手机号格式有误");        
	               return false;
	           }else{
	        	   return true;
	           }
	}
	
	function createTeacher() {
	
			var bo = true;
			$("#myModal_addTeacher input[type=text]").each(function() {
			if($(this).val()=="" && bo) { 
				toastr.warning("请将信息填写完整");
				bo = false;
				return;
			}
		});
			if(bo){
				$.post("createUser",
						 {	"user.userId":$('#te_userId').val(),   //用户id
					        "user.name":$('#te_name').val(),   //用户名
					        "user.collegeName":$('#te_collegeName').val(),   //用户学校
					        "user.department":$('#te_department').val(),   //用户学校
					        "user.profession":$('#te_profession').val(),   //用户专业
					 		"user.type":"教师",					//用户类型
					 		"user.sex":$('#te_sex').val(),	//用户性别
					 		"user.phone":$('#te_phone').val(),
					 		"user.psw":"000000"
					 	},function(data){
					 		toastr.success(data.result);
					 		location.href="staffs_teacher.jsp";
						 });
			}
	 
	}
	
	function checkPhone(){    
		var mobile = $("#teacher_phone").val();
		//焦点移除的时候进行验证
		var myreg =/^[1][3,4,5,7,8][0-9]{9}$/; 
		console.log(myreg.test(mobile));
		//手机的格式
	        if (!myreg.test(mobile)) {   			//如果手机号码的格式与正则的不符合，就提醒
	       
	        	toastr.error("手机号格式有误");        
	               return false;
	           }
		
	        return true;
	    }
	function checkEmail(){    
		var id = $("#teacher_email").val();
		//焦点移除的时候进行验证
		var myid =/^\w+@[a-zA-Z0-9]{2,10}(?:\.[a-z]{2,4}){1,3}$/;
		if(!myid.test(id)) {
	        	//如果邮箱的格式与正则的不符合，就提醒
	        	toastr.error("邮箱格式有误");        
	               return false;
	           }
	        return true;
	      
	    }
	function checkIdCard(){    
		var id = $("#teacher_idcard").val();
		//焦点移除的时候进行验证
		var myid = /^[1-9]{1}[0-9]{14}$|^[1-9]{1}[0-9]{16}([0-9]|[xX])$/;
		if(!myid.test(id)) {
	        	//如果手机号码的格式与正则的不符合，就提醒
	        	toastr.error("身份证格式有误");        
	               return false;
	           }
	        return true;
	      
	    }

       	   function editTeacher() {
	       		if( !checkIdCard()||!checkPhone()||!checkEmail() ){
	    			return;
	    		}

					var bo = true;
					$("#editTeacher input[type=text]").each(function() {
	    			if($(this).val()=="" && bo) { 
	    				toastr.warning("请将信息填写完整");
	    				bo = false;
	    				return;
	    			}
	    		});
					if(bo) {
    				$.post("editUser",
       						{	
       							"user.name":$('#teacher_name').val(),
       							"user.sex":$('#teacher_sex').val(),
       							"user.userId":$('#teacher_userId').val(),
       							"user.collegeName":$('#teacher_collegeName').val(),
       							"user.department":$('#teacher_department').val(),
       							"user.profession":$('#teacher_profession').val(),
       							"user.idcard":$('#teacher_idcard').val(),
       							"user.phone":$('#teacher_phone').val(),
       							"user.email":$('#teacher_email').val()
       						},function(data) {
       							toastr.success(data.result);
       						  	location.href="staffs_teacher.jsp";
       							
       				  });
					}
				}
		           
     /*   	function checkInput() {
    		$("#editTeacher input[type=text]").each(function() {
    			if($(this).val()=="") {	
    				toastr.warning("请将信息填写完整");
    				return false;
    			}else{
    				return true;
    			}
    		});	
    	} */
   
	function deleteTeacher(node) {
		var td = node.parentNode.parentNode.childNodes;
		var userId = td[2].innerHTML;
		if(confirm("确定要删除该用户吗？")) {
			$.post("deleteUser",{"user.userId":userId},function(data) {
				if(data.result=="删除成功") {
						location.href="staffs_teacher.jsp";
				}
		  }); 
		}  
		return false;
	}
	
	function Out() {
		if(confirm("确定要退出吗？")) {
			$.post("loginOut",null,function(data) {
				if(data.result=="成功退出") {
						location.href="../gy/login.jsp";
				}
		  });
		}  
	}
	

	
	//搜索重置
	function clean() {
		$("#userId2").val('');
		$('#name2').val('');
		$('#department2').val('');
		$('#profession2').val('');
		$('#college2').val('');
		//$('#sex2').val('');
		loadTeacherList(1)
	}
	$("#second").click(function(){
		$("#first").removeClass("active");
		$("#second").addClass("active");
	});
	
	
	//搜索隐藏
	$("#find").click(function(){
	$("#hide").slideToggle("slow");
	/*$("#school").click(function(){
			$("#school1").slideToggle("slow");
		});
		$("#institute").click(function(){
			$("#institute1").slideToggle("slow");
		});
		$("#profession").click(function(){
			$("#profession1").slideToggle("slow");
		});
		$("#class").click(function(){
			$("#class1").slideToggle("slow");
		});*/
});
</script>
<script type="text/javascript" src="js/jquery-confirm.js" ></script>
		<script type="text/javascript" src="js/toastr.js"></script>
<script type="text/javascript">
if("${session.user}" == '') {
	alert("请登录");
	location.href = '../gy/login.jsp';
}
function setPassword(){
	   var str = '<form id="user_setting" action="">' +
		'<table style="width:100%;">' +
		'<tbody>' +
		'<tr>' +
		'<td>旧密码</td>' +
		'<td><input type="text"class="form-control" name="user.oldpwd"/></td>' +
		'</tr>' +
		'<tr>' +
		'<td>新密码</td>' +
		'<td><input type="password"class="form-control"name="user.newpwd"/></td>' +
		'</tr>' +
		'<tr>' +
		'<td>确认密码</td>' +
		'<td><input type="password"class="form-control"name="user.repwd"/></td>' +
		'</tr>' +
		'</tbody>' +
		'</table>' +
		'</form>'
		$.confirm({
	title : '修改密码',
	smoothContent : false,
	content : str,
	buttons : {
		deleteUser : {
			btnClass : 'btn-blue',
			text : '修改',
			action : function() {
				var oldpwd=$('#user_setting input[name="user.oldpwd"]').val();
				var newpwd=$('#user_setting input[name="user.newpwd"]').val();
				var repwd=$('#user_setting input[name="user.repwd"]').val();
				if(repwd!=newpwd) {
					toastr.error("确认密码不正确！");
					return false;
				}
					 $.post("changePsw",{"user.psw":oldpwd,"rePsw":newpwd},function(data) {
						if(data.result=="密码修改成功") {
							toastr.success(data.result);
						}else{
							toastr.error(data.result);
							return false;
						}
				  });
				
			}
		},
		cancelAction : {
			btnClass : 'btn-default',
			text : '取消',
		}
	}
});
}

</script>
</html>