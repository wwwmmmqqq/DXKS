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
								<span>${session.user.userId}<i class="caret"></i></span>
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
					<div class="dropdown task" >
					<button class="dropbtn envolope">
						<i class="fa fa-envelope envelope"></i>	
						<span class="label-success "><i></i></span>
					</button>
						<div class="dropdown-content">
							<a href="#" data-toggle="modal" data-target="#myModal-invite-notice">邀请通知</a>
							<a href="#" data-toggle="modal" data-target="#myModal-exam-notice">阅卷通知</a>
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
					<p>Hello, ${session.user.userId}</p>
				</div>

			</div>
		  	<div class="light_bottom"> 
			  	<ul class="side_nav">
			  		<li class="side_nav1"><a href="staffs_student.jsp">学生信息管理</a></li>
			  		<li class="side_nav1"><a href="staffs_teacher.jsp">教师信息管理</a></li>	
			  		<li class="side_nav1"><a href="affair_index.jsp">试卷管理</a></li>
			  		<!-- <li class="side_nav1"><a href="affair_hand_volume.jsp">手动组卷</a></li>
			  		<li class="side_nav1"><a href="affair_intel_volume.jsp">智能组卷</a></li> -->
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
		    					<a href="affair_index.jsp"><i class="fa fa-home"></i> Home</a>
		    				</li>
		    				<li>用户管理</li>
		    			</ul>
		    			<!--breadcrumbs end -->	
		    	</div>
				<div class="top_main">
					<div class="top_button">
						<button class="btn btn1" type="button" data-toggle="modal" data-target="#myModal_addTeacher">
							<i class="fa fa-plus-circle"></i>
							添加教师
						</button>
						<button type="button" class="btn btn2" id="find">
								<i class="fa fa-search-minus"></i>
								条件搜索
						</button>	
					</div>
					<div class="search_hide" id="hide">
					    <input type="text" class="input_hide1"  id="userId2" placeholder="工号"/>
                        <input type="text" class="input_hide1"  id="name2" placeholder="姓名"/>
				        <input type="text" class="input_hide" id="profession2"  placeholder="专业"/>
				        <input type="text" class="input_hide" id="college2"  placeholder="学校"/>
				                 性别:
				        <select id="sex2">
				             <option>男</option>
				             <option>女</option>
				        </select>
				        <button type="button" class="btn right_search" onclick="loadTeacherList(1)">搜索</button>
				        <input type="reset" class="btn clean">
			        </div>
              </div>
              
			<!--table-->
			<div class="tip">教师信息</div>
			<table class="table table-striped tb1">
				<thead class="thead-light">
					<tr class="tb_width">
						<th>序号</th>
						<th>工号</th>
						<th>姓名</th>
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
						<td>
							<i class="fa fa-eye" data-toggle="modal" data-target="#myModal_eye_teacher"></i>
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
					    <!-- <input class="jump">
					    <button class="btn btn-primary btn_jump">跳转</button> -->
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
										学&nbsp;&nbsp;&nbsp;&nbsp;号&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="text" class="hover" id="te_userId" >
									</td>
								</tr>
								<tr>
									<td>
										姓&nbsp;&nbsp;&nbsp;&nbsp;名&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="text" class="hover" id="te_name">
									</td>
								</tr>
								<tr>
									<td>
										学&nbsp;&nbsp;&nbsp;&nbsp;校&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="text" class="hover"id="te_collegeName" >
									</td>
								</tr>
								<tr>
									<td>
										专&nbsp;&nbsp;&nbsp;&nbsp;业&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="text" class="hover" id="te_profession">
									</td>
								</tr>
								<tr>
								    <td class="choose-sex">
							      	  性&nbsp;&nbsp;&nbsp;&nbsp;别&nbsp;&nbsp;&nbsp;&nbsp;
							      	<select class="hover"  name="user.sex" id="te_sex">
							        	<option class="hover">男</option>
							        	<option class="hover">女</option>
							      	 </select>		 
							        </td>
								</tr>
								<tr>
									<td>
										联系方式&nbsp;
										<input type="text" class="hover" id="te_phone">
									</td>
								</tr>

							</tbody>
						</table>

					</div>

					<!-- 模态框底部 -->
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary back" data-dismiss="modal">关闭</button>
						<button type="button" class="btn btn-primary add" onclick="createTeacher()">添加</button>
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
									<td>
										工&nbsp;&nbsp;&nbsp;&nbsp;号&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="text" class="hover" readonly="readonly" disabled id="teacher_userId" name="user.userId">
									</td>
								</tr>
								<tr>
									<td>
										姓&nbsp;&nbsp;&nbsp;&nbsp;名&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="text" class="hover" id="teacher_name" name="user.name">
									</td>
								</tr>
								<td class="choose-sex">
							      	  性&nbsp;&nbsp;&nbsp;&nbsp;别&nbsp;&nbsp;&nbsp;&nbsp;
							      	<select class="hover"  id="teacher_sex" name="user.sex">
							        	<option class="hover 男">男</option>
							        	<option class="hover 女">女</option>
							      	 </select>		 
							    </td>
								
								<tr>
									<td>
										学&nbsp;&nbsp;&nbsp;&nbsp;校&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="text" class="hover" id="teacher_collegeName" name="user.collegeName">
									</td>
								</tr>
								<tr>
									<td>
										学&nbsp;&nbsp;&nbsp;&nbsp;院&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="text" class="hover" id="teacher_department" name="user.department">
									</td>
								</tr>
								<tr>
									<td>
										专&nbsp;&nbsp;&nbsp;&nbsp;业&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="text" class="hover" id="teacher_profession" name="user.profession">
									</td>
								</tr>
								<tr>
									<td>
										班&nbsp;&nbsp;&nbsp;&nbsp;级&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="text" class="hover" id="teacher_classroom" name="user.classroom">
									</td>
								</tr>
								<tr>
									<td>
										身份证号&nbsp;
										<input type="text" class="hover" id="teacher_idcard" name="user.idcard">
									</td>
								</tr>
								<tr>
									<td>
										联系方式&nbsp;
										<input type="text" class="hover" id="teacher_phone" name="user.phone">
									</td>
								</tr>

							</tbody>
						</table>

					</div>

					<!-- 模态框底部 -->
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary back" data-dismiss="modal">关闭</button>
						<button type="button" class="btn btn-primary add" onclick="editTeacher();">修改</button>
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
	    
		
	</body>
<script type="text/javascript">
	loadTeacherList(1);
	var currentPage=1;
	var totalPage=2;
	function loadTeacherList(page) {
		var userId=$('#userId2').val();
		var name=$('#name2').val();
		var profession=$('#profession2').val();
		var collegeName=$('#college2').val();
		var sex=$('#sex2').val();
		
		$.post("selectUserList",{
			"user.type":"教师",
			"page":page,
			"user.userId":userId,
			"user.name":name,
			"user.collegeName":collegeName,
			"user.profession":profession,
			"user.sex":sex
			
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
			+"<td>"+obj.department+"</td>"
			+"<td>"+obj.profession+"</td>"
			+"<td>"+obj.classroom+"</td>"
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
				+"<li class='page-item'><a class='page-link' href='javascript:loadTeacherList("+index+")'>"+index+"</a></li>";
		}
		else if(index==totalPage){
			var ht = "<li class='page-item'><a class='page-link' href='javascript:loadTeacherList("+index+")'>"+index+"</a></li>"
				+"<li class='page-item'><a class='page-link' href='javascript:nextPage()'>下一页</a></li>";
		}
		else {
			var ht = "<li class='page-item active'><a class='page-link ' href='javascript:loadTeacherList("+index+")'>"+index+"</a></li>";
			
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
			$('#teacher_sex').find("."+user.sex).attr("checked", "checked");
			$('#teacher_userId').val(user.userId);
			$('#teacher_collegeName').val(user.collegeName);
			$('#teacher_department').val(user.department);
			$('#teacher_profession').val(user.profession);
			$('#teacher_classroom').val(user.classroom);
			$('#teacher_idcard').val(user.idcard);
			$('#teacher_phone').val(user.phone);
		})
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
			+"<div class='tb_information'>"+obj.userId+"17001</div>"
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
			+"班级"
			+"<div class='tb_information'>"+obj.classroom+"</div>"
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
	
	 function createTeacher() {
		 $.post("createUser",
				 {	"user.userId":$('#te_userId').val(),   //用户id
			        "user.name":$('#te_name').val(),   //用户名
			        "user.college":$('#te_college').val(),   //用户学校
			        "user.profession":$('#te_profession').val(),   //用户专业
			 		"user.type":"教师",					//用户类型
			 		"user.sex":$('#te_sex').val(),	//用户性别
			 		"user.phone":$('#te_phone').val(),
			 		"user.psw":"000000"
			 	},function(data){
			 		/* alert("hhh");
			 		alert("UserName="+data.user.name+"----UserSex="+data.user.sex+"-----phone="+data.user.phone);  */
			 		alert(data.result);    //message为user返回信息
			 		location.href="staffs_teacher.jsp";
				 }
			)}
	
	function editTeacher() {
		/* alert("checkInput()"+checkInput()); */
		if(checkInput()==false){
			return false;
			} else{
		$.post("editUser",
					{	
						"user.name":$('#teacher_name').val(),
						"user.sex":$('#teacher_sex').val(),
						"user.userId":$('#teacher_userId').val(),
						"user.collegeName":$('#teacher_collegeName').val(),
						"user.department":$('#teacher_department').val(),
						"user.profession":$('#teacher_profession').val(),
						"user.classroom":$('#teacher_classroom').val(),
						"user.idcard":$('#teacher_idcard').val(),
						"user.phone":$('#teacher_phone').val()
					},function(data) {
						if(data.result=="编辑用户成功") {
							alert("修改成功!");
					  	location.href="staffs_teacher.jsp";
				  	}
			  });
			}
		}
   
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
						location.href="../gy/gy_login.jsp";
				}
		  });
		}  
	}
	
	function checkInput() {
		$("#editTeacher input[type=text]").each(function() {
			if($(this).val()=="") {	
				alert("请将信息填写完整");
				return false;
			}else{
				return true;
			}
		});	
	}
	
	//搜索重置
	function clean() {
		$("#userId1").val('');
		$('#name1').val('');
		$('#department1').val('');
		$('#profession1').val('');
		$('#sex1').val('');
	}
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
</html>