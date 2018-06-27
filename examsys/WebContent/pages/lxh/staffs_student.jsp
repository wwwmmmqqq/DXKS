<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% String path=request.getContextPath();
   String basePath=request.getScheme() + "://" +request.getServerName() + ":" +request.getServerPort() + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="css/satffs_student.css" />
		<link rel="stylesheet" href="css/bootstrap.min.css" />
		<link rel="stylesheet" href="css/font-awesome.min.css" />
		<link rel="stylesheet" href="css/ionicons.min.css" />
		<link rel="stylesheet" href="css/inviteSchool.css" />
		<link href="css/toastr.css" rel="stylesheet" type="text/css" />
		
		
	</head>

	<body>
		<!--上方导航栏-->

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
			  		<li class="side_nav1 now"><a href="staffs_student.jsp">学生信息管理</a></li>
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
						<!-- <button class="btn btn1" type="button" data-toggle="modal" data-target="#">
							<i class="fa fa-plus-circle"></i>
							添加学生
						</button> -->
						<button type="button" class="btn btn2" id="find">
								<i class="fa fa-search-minus"></i>
								条件搜索
						</button>	
					</div>
					<div class="search_hide" id="hide">
                        <input type="text" class="input_hide1"  id="userId1" placeholder="学号"/>
				        <input type="text" class="input_hide" id="name1"  placeholder="姓名"/>
				        <input type="text" class="input_hide" id="department1"  placeholder="学院"/>
				        <input type="text" class="input_hide" id="profession1"  placeholder="专业"/>
				                 性别:
				        <select id ="sex1">
				             <option>男</option>
				             <option>女</option>
				        </select>
				        <button type="button" class="btn right_search" onclick="loadStudentList(1)">搜索</button>
				       <button type="button" class="btn right_search" onclick="clean()">重置</button>
			        </div>
              </div>
              
			<!--table-->
			<div class="tip">学生信息</div>
			<table class="table table-striped tb1">
				<thead class="thead-light">
					<tr class="tb_width">
						<th>序号</th>
						<th>姓名</th>
						<th>学号</th>
						<th>学校</th>
						<th>学院</th>
						<th>专业</th>
						<th>班级</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody id="student-list-box">
					<tr class="tb_width">
						<td>1</td>
						<td>慕雪</td>
						<td>15478015</td>
						<td>萍乡学院</td>
						<td>信息与计算机工程学院</td>
						<td>软件工程</td>
						<td>1班</td>
						<td>
							<i class="fa fa-eye see" data-toggle="modal" data-target="#myModal_eye_student"></i>
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
					   <!--  <input class="jump">
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
		
		<!-- 模态框添加学生信息 -->
		<div class="modal fade" id="myModal_addstudent">
			<div class="modal-dialog">
				<div class="modal-content">

					<!-- 模态框头部 -->
					<div class="modal-header">
						<h4 class="modal-title">添加学生</h4>
						<button type="button" class="close close1" data-dismiss="modal">&times;</button>
					</div>

					<!-- 模态框主体 -->
					<div class="modal-body">
						<table>
							<tbody>
								<tr>
									<td>
										姓&nbsp;&nbsp;&nbsp;&nbsp;名&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="text" class="hover" id="" >
									</td>
								</tr>
								<tr>
									<td>
										学&nbsp;&nbsp;&nbsp;&nbsp;校&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="text" class="hover" >
									</td>
								</tr>
								<tr>
									<td>
										专&nbsp;&nbsp;&nbsp;&nbsp;业&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="text" class="hover"  id="">
									</td>
								</tr>
								<tr>
									<td>
										性&nbsp;&nbsp;&nbsp;&nbsp;别&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="text" class="hover"  id="">
									</td>
								</tr>
								<tr>
									<td>
										联系方式&nbsp;
										<input type="text" class="hover"  id="">
									</td>
								</tr>

							</tbody>
						</table>

					</div>

					<!-- 模态框底部 -->
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary back" data-dismiss="modal">关闭</button>
						<button type="button" class="btn btn-primary add" onclick="createStudent()">添加</button>
					</div>

				</div>
			</div>
		</div>
		
		<!--模态框修改学生信息 -->
		<div class="modal fade" id="myModal_check">
			<div class="modal-dialog">
				<div class="modal-content">

					<!-- 模态框头部 -->
					<div class="modal-header">
						<h4 class="modal-title">修改学生信息</h4>
						<button type="button" class="close close1" data-dismiss="modal">&times;</button>
					</div>

					<!-- 模态框主体 -->
					<div class="modal-body">
						<table>
							<tbody id="editStudent">
							    <tr>
									<td>
										学&nbsp;&nbsp;&nbsp;&nbsp;号&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="text" class="hover" readonly="readonly" disabled id="student_userId" name="user.userId">
									</td>
								</tr>
								<tr>
									<td>
										姓&nbsp;&nbsp;&nbsp;&nbsp;名&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="text" class="hover" id="student_name" name="user.name">
									</td>
								</tr>
								<td class="choose-sex">
							      	  性&nbsp;&nbsp;&nbsp;&nbsp;别&nbsp;&nbsp;&nbsp;&nbsp;
							      	<select class="hover"  id="student_sex" name="user.sex">
							        	<option class="hover 男">男</option>
							        	<option class="hover 女">女</option>
							      	 </select>		 
							    </td>
								
								<tr>
									<td>
										学&nbsp;&nbsp;&nbsp;&nbsp;校&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="text" class="hover" id="student_collegeName" name="user.collegeName">
									</td>
								</tr>
								<tr>
									<td>
										学&nbsp;&nbsp;&nbsp;&nbsp;院&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="text" class="hover" id="student_department" name="user.department">
									</td>
								</tr>
								<tr>
									<td>
										专&nbsp;&nbsp;&nbsp;&nbsp;业&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="text" class="hover" id="student_profession" name="user.profession">
									</td>
								</tr>
								<tr>
									<td>
										班&nbsp;&nbsp;&nbsp;&nbsp;级&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="text" class="hover" id="student_classroom" name="user.classroom">
									</td>
								</tr>
								<tr>
									<td>
										身份证号&nbsp;
										<input type="text" class="hover" id="student_idcard" name="user.idcard">
									</td>
								</tr>
								<tr>
									<td>
										联系方式&nbsp;
										<input type="text" class="hover" id="student_phone" name="user.phone">
									</td>
								</tr>

							</tbody>
						</table>

					</div>

					<!-- 模态框底部 -->
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary back" data-dismiss="modal">关闭</button>
						<button type="button" class="btn btn-primary add" onclick="editStudent();">修改</button>
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
		
			
		<!--模态框查看学生详细信息-->
		<div class="modal fade" id="myModal_eye_student">
			<div class="modal-dialog">
				<div class="modal-content">
					<!-- 模态框头部 -->
					<div class="modal-header">
						<h4 class="modal-title">学生详细信息</h4>
						<button type="button" class="close close1" data-dismiss="modal">&times;</button>
					</div>

					<!-- 模态框主体 -->
					<div class="modal-body eye_student">
						<table>
							<tbody id="student-info-box">
								<tr>
									<td>
										姓名
										<div class="tb_information">慕雪</div>
									</td>
								</tr>
								<tr>
									<td>
										学号
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
										专业
										<div class="tb_information">软件工程</div>
									</td>
								</tr>
								<tr>
									<td>
										班级
										<div class="tb_information">1</div>
									</td>
								</tr>
								<tr>
									<td>
										身份证号
										<div class="tb_information">123456789996325147</div>
									</td>
								</tr>
								<tr>
									<td>
										联系方式
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
	    
		<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
		<script src="https://cdn.bootcss.com/popper.js/1.12.5/umd/popper.min.js"></script>
		<script type="text/javascript" src="js/bootstrap.min.js"></script>
		<script type="text/javascript" src="js/toastr.js"></script>
	</body>
<script type="text/javascript">
	loadStudentList(1);
	var currentPage=1;
	var totalPage=2;
	function loadStudentList(page) {
		var userId=$('#userId1').val();
		var name=$('#name1').val();
		var department=$('#department1').val();
		var profession=$('#profession1').val();
		var sex=$('#sex1').val();
		$.post("selectUserList",{
			"user.type":"学生",
			"page":page,
			"user.userId":userId,
			"user.name":name,
			"user.department":department,
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
			 $('#student-list-box').html(htm);
			 for(var j=1;j<=totalPage;j++) {
				 ht += getLiHtml(j);
			 }
			 $('.pagination').html(ht);
		 		currentPage = page;
		  })  
	}
	
	function nextPage() {
		if(currentPage<totalPage) 
			loadStudentList(++currentPage);
	}
	
	function prevPage() {
		if(currentPage>=2) 
			loadStudentList(--currentPage);
	}
	/* function jumpPage() {
		var juPage=$('#jpage').html();
		alert(juPage);
		if(currentPage==juPage || juPage<1 || juPage>totalPage){
			loadStudentList(currentPage);
		} else{
			loadStudentList(currentPage+(juPage-currentPage));
			
		}
			
	} */
	
	function getItemHtml(index, obj,number) {
		var htm = "<tr class='tb_width'>"
			+"<td>"+number+"</td>"
			+"<td>"+obj.name+"</td>"
			+"<td id='userid'>"+obj.userId+"</td>"
			+"<td>"+obj.collegeName+"</td>"
			+"<td>"+obj.department+"</td>"
			+"<td>"+obj.profession+"</td>"
			+"<td>"+obj.classroom+"</td>"
			+"<td>"
		    +"<i class='fa fa-eye see' data-toggle='modal' data-target='#myModal_eye_student' onclick='studentInfo(this)'></i>" 
			+"<i class='fa fa-pencil check' data-toggle='modal' data-target='#myModal_check' onclick='studentInfo(this)'></i>"
			+"<i class='fa fa-trash-o' onclick='deleteStudent(this)'></i>"
			+"</td>"
			+"</tr>";
		return htm;
	}
	function getLiHtml(index) {
		if(index==1){
			var ht = "<li class='page-item'><a class='page-link' href='javascript:prevPage()'>上一页</a></li>"
				+"<li class='page-item active'><a class='page-link' href='javascript:loadStudentList("+index+")'>"+index+"</a></li>";
	
		}
		else if(index==totalPage){
			var ht = "<li class='page-item active'><a class='page-link' href='javascript:loadStudentList("+index+")'>"+index+"</a></li>"
				+"<li class='page-item'><a class='page-link' href='javascript:nextPage()'>下一页</a></li>";
				
		}
		else {
			var ht = "<li class='page-item active'><a class='page-link ' href='javascript:loadStudentList("+index+")'>"+index+"</a></li>";	
		}
		return ht;    
	}
	function studentInfo(node) {
		var td =node.parentNode.parentNode.childNodes;
		var userId = td[2].innerHTML;
		$.post("showUser",{"user.userId":userId},function(data) {
			var user = data.user;
			var info = getInfoHtml(user);
			$('#student-info-box').html(info);
			//修改模态框显示学生信息
			
			$('#student_name').val(user.name);
			$('#student_sex').find("."+user.sex).attr("checked", "checked");
			$('#student_userId').val(user.userId);
			$('#student_collegeName').val(user.collegeName);
			$('#student_department').val(user.department);
			$('#student_profession').val(user.profession);
			$('#student_classroom').val(user.classroom);
			$('#student_idcard').val(user.idcard);
			$('#student_phone').val(user.phone);
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
	/* 
	function createStudent() {
		 $.post("createUser",
				 {	
			 		"user.name":$('#').val(),//用户名
			 		"user.userId":$('#').val(), //学号  
				 	"user.collegeName":$('#collegeName').val(),
				 	"user.department":$('#department').val(),
				 	"user.profession":$('#profession').val(),
				 	"user.classroom":$('#').val(),//班级
			 		"user.type":"student",					//用户类型
			 		"user.sex":$('#sex').val(),						//用户性别
			 		"user.phone":$('#phone').val(),
			 		"user.idcard":$('#idcard').val()
			 	},function(data){
			 		alert(data.result);    //message为user返回信息
			 		if(data.result=="用户创建成功"){
			 			alert(data.result);
			 			location.href="staffs_student.jsp";
			 		}else {
			 			return false;
			 		}
				 }
			)
	} */
	
	function editStudent() {
		/* alert(checkInput());
		if(checkInput()==false){
			return false;
			} else{ */
		$.post("editUser",
					{	
						"user.name":$('#student_name').val(),
						"user.sex":$('#student_sex').val(),
						"user.userId":$('#student_userId').val(),
						"user.collegeName":$('#student_collegeName').val(),
						"user.department":$('#student_department').val(),
						"user.profession":$('#student_profession').val(),
						"user.classroom":$('#student_classroom').val(),
						"user.idcard":$('#student_idcard').val(),
						"user.phone":$('#student_phone').val()
					},function(data) {
						if(data.result=="编辑用户成功") {
							toastr.success("修改成功!");
					  	location.href="staffs_student.jsp";
				  	}
			  });
		}
	

	function deleteStudent(node) {
		var td = node.parentNode.parentNode.childNodes;
		var userId = td[2].innerHTML;
		if(confirm("确定要删除该用户吗？")) {
			$.post("deleteUser",{"user.userId":userId},function(data) {
				if(data.result=="删除成功") {
						location.href="staffs_student.jsp";
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
	
	/* function checkInput() {
		var filled;
		$("#editStudent input[type=text]").each(function() {
			if($(this).val()=="") {
				alert("请将信息填写完整");
				filled=false;
			}else{
				filled=true;
			}
		});
		return filled;
	} */
	//搜索重置
	function clean() {
		$("#userId1").val('');
		$('#name1').val('');
		$('#department1').val('');
		$('#profession1').val('');
		$('#sex1').val('');
		loadStudentList(1);
	}

//搜索隐藏
	$("#find").click(function(){
	$("#hide").slideToggle("slow");
	})
</script>
</html>