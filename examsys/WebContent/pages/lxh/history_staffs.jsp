<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib prefix="s" uri="/struts-tags" %>
    <% String path=request.getContextPath();
   String basePath=request.getScheme() + "://" +request.getServerName() + ":" +request.getServerPort() + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
		<link rel="stylesheet" href="css/history.css" />
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
							<span class="label-success "><i></i></span>
						</button>
						<div class="dropdown-content">
							<a href="#" data-toggle="modal" data-target="#myModal-email">邀请通知</a>
							<a href="#" data-toggle="modal" data-target="#myModal_read">阅卷通知</a>
						</div>
					</div>
				</div>
			</nav>
		</header>
		
		<!--侧边导航栏-->
		<div class="left">
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
			  		<ul class="side_nav">
			  		<a href="staffs_student.jsp"><li class="side_nav1">学生信息管理</li></a>
			  		<a href="staffs_teacher.jsp"><li class="side_nav1">教师信息管理</li></a>	
			  		<a href="affair_index.jsp"><li class="side_nav1">试卷管理</li></a>
			  		<a href="affair_hand_volume.jsp"><li class="side_nav1">手动组卷</li></a>
			  		<a href="affair_intel_volume.jsp"><li class="side_nav1">智能组卷</li></a>
			  		<a href="history_staffs.jsp"><li class="side_nav1">历史成绩</li></a>	
			  		<a href="test.jsp"><li class="side_nav1">考次计划</li></a>
			  	</ul>
		  </div>
		</nav>
	</div>	
			
		<!--中间部分-->
		<section class="main">
			<div class="main1">
				
				<!--<span class="position">当前位置>历史成绩</span>-->
				<div class="bred position">
		    			<!--breadcrumbs start -->
		    			<ul class="breadcrumb mybread position">
		    				<li class="active">
		    					<a href="staffs_student.jsp"><i class="fa fa-home"></i> Home</a>
		    				</li>
		    				<li>历史成绩</li>
		    			</ul>
		    			<!--breadcrumbs end -->	
		    	</div>
				
				<div class="top_main">
					<div class="top_button">
						<button class="btn btn1" type="button" >
							<i class="fa fa-mail-forward history"></i>
							导出成绩
						</button>
						<button type="button" class="btn btn2">
							<i class="fa fa-search-minus"></i>
							条件搜索
						</button>
						
					</div>
					<!--table-->
					<div class="tip">历史成绩</div>
					<table class="table table-striped tb1">
						<thead class="thead-light">
							<tr>
								<th>序号</th>
								<th>科目</th>
								<th>参加学校</th>
								<th>考试时间</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
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
		</section>
		
		
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
		
		<!--查看历史成绩模态框-->
		<div class="modal fade" id="myModal_correct">
			<div class="modal-dialog">
				<div class="modal-content">

					<!-- 模态框头部 -->
					<div class="modal-header">
						<h4 class="modal-title correct1">历史成绩</h4>
						<button type="button" class="close close1" data-dismiss="modal">&times;</button>
					</div>

					<!-- 模态框主体 -->
					<div class="modal-body">
						<table >
							<thead >
							<tr>
								<th>学号</th>
								<th>姓名</th>
								<th>学院</th>
								<th>专业</th>
								<th>班级</th>
								<th>考试科目</th>
								<th>成绩</th>
								<th>总排名</th>
								<th>本校排名</th>
							</tr>
							</thead>
							<tbody>
								<tr>
									<td>15478015</td>
									<td>慕雪</td>
									<td>xxx</td>
									<td>xxx</td>
									<td>xxx</td>
									<td>xxx</td>
									<td>xxx</td>
									<td>xxx</td>
									<td>xxx</td>
									
								</tr>
								<tr>
									<td>15478015</td>
									<td>慕雪</td>
									<td>xxx</td>
									<td>xxx</td>
									<td>xxx</td>
									<td>xxx</td>
									<td>xxx</td>
									<td>xxx</td>
									<td>xxx</td>
								</tr>
								<tr>
									<td>15478015</td>
									<td>慕雪</td>
									<td>xxx</td>
									<td>xxx</td>
									<td>xxx</td>
									<td>xxx</td>
									<td>xxx</td>
									<td>xxx</td>
									<td>xxx</td>
								</tr>
								<tr>
									<td>15478015</td>
									<td>慕雪</td>
									<td>xxx</td>
									<td>xxx</td>
									<td>xxx</td>
									<td>xxx</td>
									<td>xxx</td>
									<td>xxx</td>
									<td>xxx</td>
								</tr>
								<tr>
									<td>15478015</td>
									<td>慕雪</td>
									<td>xxx</td>
									<td>xxx</td>
									<td>xxx</td>
									<td>xxx</td>
									<td>xxx</td>
									<td>xxx</td>
									<td>xxx</td>
								</tr>
								<tr>
									<td>15478015</td>
									<td>慕雪</td>
									<td>xxx</td>
									<td>xxx</td>
									<td>xxx</td>
									<td>xxx</td>
									<td>xxx</td>
									<td>xxx</td>
									<td>xxx</td>
								</tr>
								
							</tbody>
						</table>
					<ul>
						<li>正确率:50%</li>
					</ul>
					</div>

					<!-- 模态框底部 -->
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary back-information" data-dismiss="modal">关闭</button>
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
											<table >
												<tbody >
								        			<tr>
								        				<td >
								        					用户名<div class="tb_information">慕雪</div>
								        				</td>
								        			</tr>
								        			<tr>			        				
								        				<td >
								        					密码<div class="tb_information">145681</div>
								        				</td>
								        			</tr>
								        			<tr>
								        				<td >
								        					姓名<div class="tb_information">慕雪</div>
								        				</td>
								        			</tr>
								        			<tr>
								        				<td >
								        					性别<div class="tb_information">女 </div>
								        				</td>
								        			</tr>
								        			<tr>
								        				<td >
								        					电话<div class="tb_information">15574014263</div>
								        				</td>
								        			</tr>
								        			<tr>
								        				<td >
								        					所属大学<div class="tb_information">萍乡学院</div>
								        				</td>
								        			</tr>
								        			<tr>
								        				<td >
								        					邮箱<div class="tb_information">1770313147@qq.com</div>
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
			          		<button class="btn btn-danger refuse"  data-toggle="modal" data-target="#myModal_email_refuse">拒绝</button>
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
	
	<script type="text/javascript">
	var currentPage = 1;
	var totalPage = 3;
	
	function getHtmls(index, a) {
		var htm = "<tr>"
				+"	<td>1</td>"
				+"	<td>数据库概论</td>"
				+"	<td>萍乡学院</td>"
				+"	<td>2018-10-10</td>"
				+"	<td class='td_correct' data-toggle='modal' data-target='#myModal_correct'>"
				+"	<i class='fa fa-eye'></i>"
				+"	</td>"
				+"</tr>";
		return htm;
	}
	</script>
</html>
