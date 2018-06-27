<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% String path=request.getContextPath();
   String basePath=request.getScheme() + "://" +request.getServerName() + ":" +request.getServerPort() + path + "/";
%>
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
        <link rel="stylesheet" href="css/inviteSchool.css" />
        <link href="css/ionicons.min.css" rel="stylesheet" type="text/css" />
        <link href='http://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
        <script type="text/javascript" src="js/jquery-3.2.1.min.js" ></script>
		<script type="text/javascript" src="js/bootstrap.min.js" ></script>
        <!-- Theme style -->
        <link href="css/lxhstyle.css" rel="stylesheet" type="text/css" />
       
       
       <script type="text/javascript" src="js/affair_index.js" ></script>
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
		    				<span>${session.user.userId} <i class="caret"></i></span>
		    			</a>    		
		    	    </button>
		    		<div class="dropdown-content">
		    			<a href="#" data-toggle="modal" data-target="#myModal_information">个人中心</a>
		    			<a href="#" onclick="Out()">退出系统</a>
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
		    			<!-- <a href="#" data-toggle="modal" data-target="#myModal_invite_school">邀请学校考试</a> -->
		    		</div>
		    	</div>
		    
		    	<div class="dropdown notice">
		    		<button class="dropbtn">
		    			    			<a href="#" class="dropdown-toggle" data-toggle="dropdown">
		    			    				<i class="fa fa-envelope"></i>
		    			    				<span class="label label-success noticelabel"><i></i></span>
		    			    			</a>
		    			    	    </button>
		    		<div class="dropdown-content">
		    			<a href="#" data-toggle="modal" data-target="#myModal-invite-notice">邀请通知</a>
		    			<a href="#" data-toggle="modal" data-target="#myModal-exam-notice">阅卷通知</a>
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
		    			<p>Hello, ${session.user.userId}</p>
		    		</div>
		    	</div>
		    	<div class="light_bottom">
		    		 <ul class="side_nav">
		    			<a href="staffs_student.jsp">
			    			<li class="side_nav1 ">
								学生信息管理
							</li>
						</a>
						<a href="staffs_teacher.jsp">
							<li class="side_nav1">
								教师信息管理
							</li>
						</a>
						<a href="affair_index.jsp">
							<li class="side_nav1 now" >
								试卷管理
							</li> 
						</a>
						<!-- <li class="side_nav1">
=======
		    		<ul class="side_nav">
		    			<li class="side_nav1">
							<a href="staffs_student.jsp">学生信息管理</a>
						</li>
						<li class="side_nav1">
							<a href="staffs_teacher.jsp">教师信息管理</a>
						</li>
						<li class="side_nav1">
							<a href="affair_index.jsp">试卷管理 </a>
						</li>
<<<<<<< HEAD
					  <li class="side_nav1">
>>>>>>> origin/wmq-0624-3
=======
					  <!--   <li class="side_nav1">
>>>>>>> origin/lrx-0626-4(合并wmq-0626)
							<a href="affair_hand_volume.jsp">手动组卷</a>
						</li>
						<li class="side_nav1">
							<a href="affair_intel_volume.jsp">智能组卷</a>
<<<<<<< HEAD
<<<<<<< HEAD
						</li> -->
						<a href="history_staffs.jsp">
							<li class="side_nav1">
								历史成绩
							</li>
						</a>
						<a href="test.jsp">
							<li class="side_nav1">
								考次计划
							</li>
						</a>
						
		    		</ul>
		    	</div>
		    </nav>
		    <!-- sidebar end -->
		    
		    
		    <div class="cant">
		    	<div class="bred">
		    			<!--breadcrumbs start -->
		    			<ul class="breadcrumb mybread">
		    				<li class="active">
		    					<a href="#"><i class="fa fa-home"></i> 试卷管理</a>
		    				</li>
		    	
		    			</ul>
		    			<!--breadcrumbs end -->	
		    	</div>
		   
		    	
		    	<div class="papermanage">
		    		<div id="flip"><i class="fa fa-search-minus"></i>条件搜索</div>
		    		<div id="panel">
		    			<form>
		    				<div class="searchpanel">
		    					<ul>
		    						<li id="qtype"><label>科目</label>
		    							<select>
		    								<option>高等数学</option>
		    								<option>大学英语</option>
		    								<option>大学物理</option>
		    								<option>计算机</option>
		    							</select>
		    						</li>	    
		    						<li id="startTime"><label>开始时间</label>
		    							<input type="text" id="date3" data-options="{'type':'YYYY-MM-DD hh:mm','beginYear':2010,'endYear':2088}" style="width:166px;">
		    						</li>
		    						<li><label>结束时间</label>
		    							<input type="text" id="date4" data-options="{'type':'YYYY-MM-DD hh:mm','beginYear':2010,'endYear':2088}" style="width:166px;">
		    						</li>
		    						<li><button type="submit" class="btn btn-default searchbtn"><i class="fa fa-search"></i></button></li>
		    					</ul>		    					
		    				</div>		    		
		    			</form>		
		    		</div>
		  
		    		<div class="jwchaxun">
		    			<!-- <div class="operation"> 
		    				<ul>
		    					<li>
		    						<a class="btn btn-default btn-sm pull-right" href="apaper.jsp">查看</a>
		    					</li>
		    					<li><button class="btn btn-default btn-xs" onclick="deletefunction()"><i class="fa fa-times"></i></button></li>
		    					<li><button class="btn btn-default btn-xs"  data-toggle="modal" data-target="#modify-paper"><i class="fa fa-pencil"></i></button></li>
		    				</ul>
		    			</div> -->
		    			<!-- <p>共查询到？条记录</p> -->
		    			<table class="table jwcxtable">
		    				<thead>
		    					<tr>
		    						<th>编号</th>
		    						<th>所在考次</th>
		    						<th>试卷科目</th>
		    						<th>标题</th>
		    						<th>总分</th>
		    						<th>总时间</th>
		    						<th>开始时间</th>
		    						<th>结束时间</th>
		    						<th>查看</th>
		    					</tr>
		    				</thead>
		    				<tbody id="paper-list-box">
		    					<tr id=''>
			    					<td id=''>
			    						1
			    					</td>
			    					<td id=''>第一次联考</td>
			    					<td id=''>高等数学</td>
			    					<td id=''>2018年高等数学第一次联考</td>
			    					<td id=''>100分</td>
			    					<td id=''>100分钟</td>
			    					<td id=''>2018年5月20日9：00</td>
			    					<td id=''>2018年5月20日9：40</td>
			    					<td id=''><button class="btn btn-default btn-xs"  data-toggle="modal" data-target="#modify-paper"><i class="fa fa-pencil"></i></button></td>
			    				</tr>
		    				</tbody>
		    			</table>
		    		  
		    			<div class="page_pagination">
		    				<ul class="pagination">
		    					<li class="page-item">
		    						<a class="page-link" href="javascript:prevPage()">上一页</a>
		    					</li>
		    					<li class="page-item">
		    						<a class="page-link" href="javascript:showPaperList(1)">1</a>
		    					</li>
		    					<li class="page-item active">
		    						<a class="page-link " href="javascript:showPaperList(2)">2</a>
		    					</li>
		    					<li class="page-item">
		    						<a class="page-link" href="javascript:showPaperList(3)">3</a>
		    					</li>
		    					<li class="page-item">
		    						<a class="page-link" href="javascript:nextPage()">下一页</a>
		    					</li>
		    					<input class="jump" type="text" id="jpage"/>
		    					<button class="btn btn-primary btn_jump">跳转</button>
		    				</ul>
		    			</div>
		    		</div>
		        </div>  
		        
		    </div>
		    <!--cant end -->	
		   
	    </section>
	    
	    <!--模态框-->
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
										姓名
										<div class="tb_information">${session.user.name}</div>
									</td>
								</tr>
								<tr>
									<td>
										工号
										<div class="tb_information">${session.user.userId}</div>
									</td>
								</tr>
								<tr>
									<td>
										密码
										<div class="tb_information">${session.user.psw}</div>
									</td>
								</tr>
								<tr>
									<td>
										学校
										<div class="tb_information">${session.user.collegeName}</div>
									</td>
								</tr>
								<tr>
									<td>
										学院
										<div class="tb_information">${session.user.department}</div>
									</td>
								</tr>
								<tr>
									<td>
										性别
										<div class="tb_information">${session.user.sex}</div>
									</td>
								</tr>
								<tr>
									<td>
										联系方式
										<div class="tb_information">${session.user.phone}</div>
									</td>
								</tr>
								<tr>
									<td>
										邮箱
										<div class="tb_information">${session.user.email}</div>
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
										<input type="text" class="hover form-control">
									</td>
								</tr>
								<tr>
									<td>
										学&nbsp;&nbsp;&nbsp;&nbsp;校&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="text" class="stext hover form-control school-name" name="school" id="school-name" value="请选择大学" onblur="if(this.value==''){this.value='请选择大学'}" onfocus="if(this.value=='请选择大学'){this.value=''}" onclick="pop()" />
										<div id="choose-box-wrapper" class="choose-box-wrapper">
											<div id="choose-box" class="choose-box">
												<div id="choose-box-title" class="choose-box-title">
													<span>选择学校</span>
												</div>
												<div id="choose-a-province" class="choose-a-province"></div>
												<div id="choose-a-school" class="choose-a-school"></div>
												<div id="choose-box-bottom" class="choose-box-bottom">
													<input type="botton" onclick="hide()" value="关闭" />
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>
										学&nbsp;&nbsp;&nbsp;&nbsp;院&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="text" class="hover form-control">
									</td>
								</tr>
								<tr>
									<td>
										专&nbsp;&nbsp;&nbsp;&nbsp;业&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="text" class="hover form-control">
									</td>
								</tr>
								<tr>
									<td>
										专&nbsp;&nbsp;&nbsp;&nbsp;业&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="text" class="hover form-control">
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
										
										<input type="text" class="stext hover form-control school-name" name="school" id="school-name" value="请选择大学" onblur="if(this.value==''){this.value='请选择大学'}" onfocus="if(this.value=='请选择大学'){this.value=''}" onclick="pop()" />
										<div id="choose-box-wrapper" class="choose-box-wrapper">
											<div id="choose-box" class="choose-box">
												<div id="choose-box-title" class="choose-box-title">
													<span>选择学校</span>
												</div>
												<div id="choose-a-province" class="choose-a-province"></div>
												<div id="choose-a-school" class="choose-a-school"></div>
												<div id="choose-box-bottom" class="choose-box-bottom">
													<input type="botton" onclick="hide()" value="关闭" />
												</div>
											</div>
										</div>
									
									</td>
								</tr>
								<tr>
									<td>
										学&nbsp;&nbsp;&nbsp;&nbsp;院&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="text" class="hover form-control">
										
									</td>
								</tr>
								<tr>
									<td>
										专&nbsp;&nbsp;&nbsp;&nbsp;业&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="text" class="hover form-control">
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
		
      
<<<<<<< HEAD
=======
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
      
      	<!--模态框查看邀请通知-->
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
		
		<!--模态框查看阅卷通知-->
		<div class="modal fade" id="myModal-read">
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
	    					来自xx学校xx学院东方老师的邀请
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
		          		<button class="btn btn-primary accept" >接受</button>
		          		<button class="btn btn-danger refuse" data-toggle="modal" data-target="#myModal_email_refuse" >拒绝</button>
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
      
       <!--模态框修改试卷信息 -->
		<div class="modal fade" id="myModal_check">
			<div class="modal-dialog">
				<div class="modal-content">
					<!-- 模态框头部 -->
					<div class="modal-header">
						<h4 class="modal-title">修改试卷信息</h4>
						<button type="button" class="close close1" data-dismiss="modal">&times;</button>
					</div>

				   <!--模态框主体 -->
					<div class="modal-body">
						<table>
							<tbody id="editPaper">
								<tr>
									<td>
										所&nbsp;&nbsp;在&nbsp;&nbsp;考&nbsp;&nbsp;次:&nbsp;&nbsp;
										<input type="text" class="hover" id="paper_examRef" name="user.name">
									</td>
								</tr>
								<tr>
									<td>
										试&nbsp;&nbsp;卷&nbsp;&nbsp;科&nbsp;&nbsp;目:&nbsp;&nbsp;
										<input type="text" class="hover" id="paper_subjectRef" name="user.name">
									</td>
								</tr>
								<tr>
									<td>
										标&nbsp;&nbsp;&nbsp;&nbsp;题&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="text" class="hover" id="paper_name" name="user.userId">
									</td>
								</tr>
								<tr>
									<td>
										总&nbsp;&nbsp;&nbsp;&nbsp;分；&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="text" class="hover" id="paper_totalScore" name="user.collegeName">
									</td>
								</tr>
								<tr>
									<td>
										总&nbsp;&nbsp;&nbsp;&nbsp;时&nbsp;&nbsp;&nbsp;&nbsp;间:&nbsp;&nbsp;
										<input type="text" class="hover" id="paper_totalTime" name="user.department">
									</td>
								</tr>
								<tr>
									<td>
										开&nbsp;&nbsp;始&nbsp;&nbsp;时&nbsp;&nbsp;间:&nbsp;&nbsp;
										<input type="text" class="hover" id="paper_examStart" name="user.name">
									</td>
								</tr>
								<tr>
									<td>
										结&nbsp;&nbsp;束&nbsp;&nbsp;时&nbsp;&nbsp;间:&nbsp;&nbsp;
										<input type="text" class="hover" id="paper_examEnd" name="user.name">
									</td>
								</tr>
								
							</tbody>
						</table>

				   </div>

					<!-- 模态框底部 -->
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary back" data-dismiss="modal">关闭</button>
						<button type="button" class="btn btn-primary add" onclick="editPaper();">修改</button>
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
	
	
	<script type="text/javascript" src="js/jquery.date.js" ></script>
	<script type="text/javascript">
	
	showPaperList(1);
	var currentPage = 1;
	var totalPage = 3;
	function showPaperList(page) {
		$.post("showPaperList", {"page":page}, function(data) {
			var paperList = data.paperList;
			var htm = "";
	 		for(var i=0;i<paperList.length;i++) {
	 			htm += getItemHtml(i, paperList[i]);
	 		}
	 		$('#paper-list-box').html(htm);
	 		currentPage = page;
		});
	}
	
	function nextPage() {
		if(currentPage<totalPage) 
			showPaperList(++currentPage);
	}
	
	function prevPage() {
		if(currentPage>=2) 
			showPaperList(--currentPage);
	}
	function jumpPage() {
		var juPage=$('#jpage').html();
		alert(juPage);
		if(currentPage==juPage || juPage<1 || juPage>totalPage){
			showPaperList(currentPage);
		} else{
			showPaperList(currentPage+(juPage-currentPage));
			
		}
			
	}
	
	function getItemHtml(index, obj) {
		var htm = "<tr id=''>"
			+"	<td>"+obj.sid+"</td>"
			+"	<td>"+obj.examRef+"</td>"
			+"	<td>"+obj.subjectRef+"</td>"
			+"	<td>"+obj.name+"</td>"
			+"	<td>"+obj.totalScore+"</td>"
			+"	<td>"+obj.totalTime+"</td>"
			+"	<td>"+obj.examStart+"</td>"
			+"	<td>"+obj.examEnd+"</td>"
			+"  <td>"
			+"  <a href='apaper.jsp?"+obj.sid+"'><i class='fa fa-eye see'></i></a>" 
			/* +"  <i class='fa fa-pencil check' data-toggle='modal' data-target='#myModal_check' onclick='paperInfo(this)'></i>"
			+"  <i class='fa fa-trash-o' onclick='deletePaper(this)'></i>" */
			+" </td>"
			+"</tr>";
		return htm;
	}
	
function editePaper() {
		$.post("editPaper",{"paper.sid":1,"paper.name":"第一次考试"},function(data) {
		alert(data.result);
	})
	
}
function Out() {
	if(confirm("确定要退出吗？")) {
		$.post("loginOut",null,function(data) {
			if(data.result=="成功退出") {
					location.href="../gy/gy_login.jsp";
			}
	  });
	}  
}

function loadNoticeList(page) {
	  /**获取通知列表*/
	  $.post("loadNoticeList", {
		  "page":page//第几页
	  }, function(data) {
		  var list = data.list;//列表
		  var html = "";
		  for(var i=0;i<list.length;i++) {
			  html += "通知的id = <a href='javascript:readNotice("+list[i].sid+")'>" + list[i].sid +"</a>";//获取到通知的id
			  html += "，通知的类型 = " + list[i].type;//获取到通知的类型
			  html += "，通知的标题 = " + list[i].title ;//获取到通知的标题
			  html += "，通知的内容 = " + list[i].content;//获取到通知的内容
			  html += "<br>";
		  }
		  $('#notice-box').html(html);
	  });
}

function getLiHtml(index) {
	if(index==1){
		var ht = "<li class='page-item'><a class='page-link' href='javascript:prevPage()'>上一页</a></li>"
			+"<li class='page-item active'><a class='page-link' href='javascript:loadMyExamList("+index+")'>"+index+"</a></li>";			
	}
	else if(index==totalPage){
		var ht = "<li class='page-item'><a class='page-link' href='javascript:loadMyExamList("+index+")'>"+index+"</a></li>"
			+"<li class='page-item'><a class='page-link' href='javascript:nextPage()'>下一页</a></li>";
			
	}
	else {
		var ht = "<li class='page-item'><a class='page-link ' href='javascript:loadMyExamList("+index+")'>"+index+"</a></li>";
	}
	return ht;    
}

/*搜索jquery隐藏显示面板*/
$(document).ready(function() {
    $("#flip").click(function() {
        $("#panel").slideToggle("slow");
    });
});

$.date('#date3');
$.date('#date4');

	</script>
	<script type="text/javascript" src="js/school.js"></script>
<script type="text/javascript" src="js/inviteSchool.js" ></script>
</html>
