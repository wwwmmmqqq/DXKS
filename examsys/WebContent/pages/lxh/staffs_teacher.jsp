<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% String path=request.getContextPath();
   String basePath=request.getScheme() + "://" +request.getServerName() + ":" +request.getServerPort() + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="css/staffs_teacher.css" />
		<link rel="stylesheet" href="css/bootstrap.min.css" />
		<link rel="stylesheet" href="css/font-awesome.min.css" />
		<link rel="stylesheet" href="css/ionicons.min.css" />
		<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
		<script src="https://cdn.bootcss.com/popper.js/1.12.5/umd/popper.min.js"></script>
		<script type="text/javascript" src="js/bootstrap.min.js"></script>
	</head>

	<body>
		<!--上方导航栏-->
	<div class="all">
		<header class="header">
			<nav class="navbar navbar-static-top" role="navigation">
				<a class="logo" href="#"><img class="logo" src="img/logo.png"></a>
				<div class="banner">
					<div class="dropdown users">
						<button class="dropbtn">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">
								<i class="fa fa-user"></i>
								<span>muxue <i class="caret"></i></span>
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
							<a href="#" data-toggle="modal" data-target="#myModal_invite_teacher">邀请老师出卷</a>
							<a href="#" data-toggle="modal" data-target="#myModal_invite_school">邀请学校考试</a>
						</div>
					</div>
					<div class="dropdown task" >
					<button class="dropbtn envolope">
						<i class="fa fa-envelope envelope"></i>	
						<span class="label-success ">1</span>
					</button>
						<div class="dropdown-content">
							<a href="#" data-toggle="modal" data-target="#myModal-email">邀请通知</a>
							<a href="#" data-toggle="modal" data-target="#myModal_read">阅卷通知</a>
						</div>
				</div>
				</div>
		</header>

		<!--侧边导航栏-->

		<nav class="navbar bg-light">
			<div class="user-panel">
				<div class="image">
					<img class="user1" src="img/1098.jpg" alt="User Image">
				</div>
				<div class="info">
					<p>Hello, muxue</p>
				</div>

			</div>
		  	<div class="light_bottom"> 
			  	<ul class="side_nav">
			  		<li class="side_nav1"><a href="staffs_student.jsp">学生信息管理</a></li>
			  		<li class="side_nav1"><a href="staffs_teacher.jsp">教师信息管理</a></li>	
			  		<li class="side_nav1"><a href="jwindex.jsp">试卷管理</a></li>
			  		<li class="side_nav1"><a href="jwhandzhujuan.jsp">手动组卷</a></li>
			  		<li class="side_nav1"><a href="jwintelzhujuan.jsp">智能组卷</a></li>
			  		<li class="side_nav1"><a href="history_staffs.jsp">历史成绩</a></li>	
			  		<li class="side_nav1"><a href="test.jsp">考次计划</a></li>	
			  	</ul>
		  </div>
		</nav>

		<!--中间部分-->
		<div class="main">
			<div class="main1">
				<div class="bred position">
		    			<!--breadcrumbs start -->
		    			<ul class="breadcrumb mybread position">
		    				<li class="active">
		    					<a href="#"><i class="fa fa-home"></i> Home</a>
		    				</li>
		    				<li>用户管理</li>
		    			</ul>
		    			<!--breadcrumbs end -->	
		    	</div>
				<div class="top_main">
					<div class="top_button">
						<button class="btn btn1" type="button" data-toggle="modal" data-target="#myModal">
							<i class="fa fa-plus-circle"></i>
							添加教师
						</button>
						<div class="top_search">
							
							<button type="button" class="btn btn2">
								<i class="fa fa-search-minus"></i>
								条件搜索
							</button>
						</div>
					</div>
			<!--table-->
			<div class="tip">教师信息</div>
			<table class="table table-striped tb1">
				<thead class="thead-light">
					<tr class="tb_width">
						<th>序号</th>
						<th>用户名</th>
						<th>姓名</th>
						<th>学校</th>						
						<th>专业</th>
						<th>性别</th>
						<th>联系方式</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<tr class="tb_width">
						<td>1</td>
						<td>慕雪</td>
						<td>慕雪</td>
						<td>萍乡学院</td>
						<td>软件工程</td>
						<td>女</td>
						<td>1770313147</td>
						<td>
							<i class="fa fa-eye" data-toggle="modal" data-target="#myModal_eye_teacher"></i>
			        	<i class="fa fa-pencil check"></i>
			        	<i class="fa fa-trash-o"></i>
			        </td>
					</tr>
					<tr class="tb_width">
						<td>1</td>
						<td>慕雪</td>
						<td>慕雪</td>
						<td>萍乡学院</td>
						<td>软件工程</td>
						<td>女</td>
						<td>1770313147</td>
						<td>
							<i class="fa fa-eye"></i>
			        	<i class="fa fa-pencil check"></i>
			        	<i class="fa fa-trash-o"></i>
			        </td>
					</tr >
					<tr class="tb_width">
						<td>1</td>
						<td>慕雪</td>
						<td>慕雪</td>
						<td>萍乡学院</td>
						<td>软件工程</td>
						<td>女</td>
						<td>1770313147</td>
						<td>
							<i class="fa fa-eye"></i>
			        	<i class="fa fa-pencil check"></i>
			        	<i class="fa fa-trash-o"></i>
			        </td>
					</tr>
					<tr class="tb_width">
						<td>1</td>
						<td>慕雪</td>
						<td>慕雪</td>
						<td>萍乡学院</td>
						<td>软件工程</td>
						<td>女</td>
						<td>1770313147</td>
						<td>
							<i class="fa fa-eye"></i>
			        	<i class="fa fa-pencil check"></i>
			        	<i class="fa fa-trash-o"></i>
			        </td>
					</tr>
					<tr class="tb_width">
						<td>1</td>
						<td>慕雪</td>
						<td>慕雪</td>
						<td>萍乡学院</td>
						<td>软件工程</td>
						<td>女</td>
						<td>1770313147</td>
						<td>
							<i class="fa fa-eye"></i>
			        	<i class="fa fa-pencil check"></i>
			        	<i class="fa fa-trash-o"></i>
			        </td>
					</tr>
					<tr class="tb_width">
						<td>1</td>
						<td>慕雪</td>
						<td>慕雪</td>
						<td>萍乡学院</td>
						<td>软件工程</td>
						<td>女</td>
						<td>1770313147</td>
						<td>
							<i class="fa fa-eye"></i>
			        	<i class="fa fa-pencil check"></i>
			        	<i class="fa fa-trash-o"></i>
			        </td>
					</tr>
					<tr class="tb_width">
						<td>1</td>
						<td>慕雪</td>
						<td>慕雪</td>
						<td>萍乡学院</td>
						<td>软件工程</td>
						<td>女</td>
						<td>1770313147</td>
						<td>
							<i class="fa fa-eye"></i>
			        	<i class="fa fa-pencil check"></i>
			        	<i class="fa fa-trash-o"></i>
			        </td>
					</tr>
					<tr class="tb_width">
						<td>1</td>
						<td>慕雪</td>
						<td>慕雪</td>
						<td>萍乡学院</td>
						<td>软件工程</td>
						<td>女</td>
						<td>1770313147</td>
						<td>
							<i class="fa fa-eye"></i>
			        	<i class="fa fa-pencil check"></i>
			        	<i class="fa fa-trash-o"></i>
			        </td>
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
					    <input class="jump">
					    <button class="btn btn-primary btn_jump">跳转</button>
				  </ul>
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
									<td>
										用户名
										<div class="tb_information">慕雪</div>
									</td>
								</tr>
								<tr>
									<td>
										密码
										<div class="tb_information">17001</div>
									</td>
								</tr>
								<tr>
									<td>
										姓名
										<div class="tb_information">慕雪</div>
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
										专业
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
		
		<!-- 模态框添加教师信息 -->
		<div class="modal fade" id="myModal">
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
										专&nbsp;&nbsp;&nbsp;&nbsp;业&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="text" class="hover">
									</td>
								</tr>
								<tr>
									<td>
										性&nbsp;&nbsp;&nbsp;&nbsp;别&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="text" class="hover">
									</td>
								</tr>
								<tr>
									<td>
										联系方式&nbsp;
										<input type="text" class="hover">
									</td>
								</tr>

							</tbody>
						</table>

					</div>

					<!-- 模态框底部 -->
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary back" data-dismiss="modal">关闭</button>
						<button type="button" class="btn btn-primary add">添加</button>
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
		          		<button class="btn btn-primary accept" >接受</button>
		          		<button class="btn btn-danger refuse"  >拒绝</button>
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
		
		<!--模态框查看学生、教师信息-->
		<div class="modal fade" id="myModal_eye_teacher">
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
										<div class="tb_information">慕雪</div>
									</td>
								</tr>
								<tr>
									<td>
										密码
										<div class="tb_information">17001</div>
									</td>
								</tr>
								<tr>
									<td>
										姓名
										<div class="tb_information">慕雪</div>
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
										专业
										<div class="tb_information">软件工程</div>
									</td>
								</tr>
								<tr>
									<td>
										联系方式
										<div class="tb_information">1770313147</div>
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
		          		<button class="btn btn-primary accept" >接受</button>
		          		<button class="btn btn-danger refuse"  >拒绝</button>
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
		
		
	</div>	
	</body>

</html>