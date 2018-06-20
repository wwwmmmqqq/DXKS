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
		<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
		<script src="https://cdn.bootcss.com/popper.js/1.12.5/umd/popper.min.js"></script>
		<script type="text/javascript" src="js/bootstrap.min.js"></script>
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
			  		<li class="side_nav1"><a href="affair_index.jsp">试卷管理</a></li>
			  		<li class="side_nav1"><a href="affair_hand_volume.jsp">手动组卷</a></li>
			  		<li class="side_nav1"><a href="affair_intel_volume.jsp">智能组卷</a></li>
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
							添加学生
						</button>
						<div class="top_search">
							
							<button type="button" class="btn btn2">
								<i class="fa fa-search-minus"></i>
								条件搜索
							</button>
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
					    <input class="jump">
					    <button class="btn btn-primary btn_jump">跳转</button>
				  </ul>
			  	</div>
			</div>
		</div>
		</div>	
			
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
										<div class="tb_information">信计学院<%-- ${session.user.department} --%></div>
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
										姓&nbsp;&nbsp;&nbsp;&nbsp;名&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="text" class="hover" id="stu_name" name="user.name">
									</td>
								</tr>
								<td class="choose-sex">
							      	  性&nbsp;&nbsp;&nbsp;&nbsp;别&nbsp;&nbsp;&nbsp;&nbsp;
							      	<select class="hover"  id="stu_sex" name="user.sex">
							        	<option class="hover">男</option>
							        	<option class="hover">女</option>
							      	 </select>		 
							    </td>
								<tr>
									<td>
										学&nbsp;&nbsp;&nbsp;&nbsp;号&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="text" class="hover" readonly="readonly" id="stu_userId" name="user.userId">
									</td>
								</tr>
								<tr>
									<td>
										学&nbsp;&nbsp;&nbsp;&nbsp;校&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="text" class="hover" id="stu_collegeName" name="user.collegeName">
									</td>
								</tr>
								<tr>
									<td>
										学&nbsp;&nbsp;&nbsp;&nbsp;院&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="text" class="hover" id="stu_department" name="user.department">
									</td>
								</tr>
								<tr>
									<td>
										专&nbsp;&nbsp;&nbsp;&nbsp;业&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="text" class="hover" id="stu_profession" name="user.profession">
									</td>
								</tr>
								<tr>
									<td>
										班&nbsp;&nbsp;&nbsp;&nbsp;级&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="text" class="hover" id="stu_classroom" name="user.classroom">
									</td>
								</tr>
								<tr>
									<td>
										身份证号&nbsp;
										<input type="text" class="hover" id="stu_idcard" name="user.idcard">
									</td>
								</tr>
								<tr>
									<td>
										联系方式&nbsp;
										<input type="text" class="hover" id="stu_phone" name="user.phone">
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
		
			
		<!--模态框查看学生、教师信息-->
		<div class="modal fade" id="myModal_eye_student">
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
		
		
	</body>
<script type="text/javascript">
	loadStudentList(1);
	var currentPage=1;
	var totalPage=1;
	function loadStudentList(page) {
		$.post("selectUserList",{"user.type":"student","page":page},function(data) {
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
			+"<td>"+obj.userId+"</td>"
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
				+"<li class='page-item'><a class='page-link' href='javascript:loadStudentList("+index+")'>"+index+"</a></li>"
				+"<input class='jump'>"+"<button class='btn btn-primary btn_jump'>跳转</button>";
		}
		else if(index==totalPage){
			var ht = "<li class='page-item'><a class='page-link' href='javascript:loadStudentList("+index+")'>"+index+"</a></li>"
				+"<li class='page-item'><a class='page-link' href='javascript:nextPage()'>下一页</a></li>"
				+"<input class='jump'>"+"<button class='btn btn-primary btn_jump'>跳转</button>";
		}
		else {
			var ht = "<li class='page-item active'><a class='page-link ' href='javascript:loadStudentList("+index+")'>"+index+"</a></li>"
			+"<input class='jump'>"+"<button class='btn btn-primary btn_jump'>跳转</button>";
		}
		return ht;    
	}
	function studentInfo(node) {
		var td = node.parentNode.parentNode.childNodes;
		var userId = td[2].innerHTML;
		$.post("showUser",{"user.userId":userId},function(data) {
			var user = data.user;
			var info = getInfoHtml(user);
			$('#student-info-box').html(info);
			$('#stu_name').val(user.name);
			$('#stu_sex').val(user.sex);
			$('#stu_userId').val(user.userId);
			$('#stu_collegeName').val(user.collegeName);
			$('#stu_department').val(user.department);
			$('#stu_profession').val(user.profession);
			$('#stu_classroom').val(user.classroom);
			$('#stu_idcard').val(user.idcard);
			$('#stu_phone').val(user.phone);
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
	
	function createStudent() {
		 $.post("createUser",
				 {	
			 		"user.name":$('#name').val(),
			 		"user.userId":$('#userId').val(),   //用户名
				 	"user.collegeName":$('#collegeName').val(),
				 	"user.department":$('#department').val(),
				 	"user.profession":$('#profession').val(),
				 	"user.classroom":$('#classroom').val(),
			 		"user.type":"student",					//用户类型
			 		"user.sex":$('#sex').val(),						//用户性别
			 		"user.phone":$('#phone').val(),
			 		"user.idcard":$('#idcard').val()
			 	},function(data){
			 		alert(data.result);    //message为user返回信息
			 		if(data.result=="用户创建成功"){
			 			location.href="staffs_student.jsp";
			 		}else {
			 			return false;
			 		}
				 }
			)
	}
	
	function editStudent() {
		if(!checkInput()){alert("123"); return false;} 
		$.post("editUser",
					{	
						"user.name":$('#stu_name').val(),
						"user.sex":$('#stu_sex').val(),
						"user.userId":$('#stu_userId').val(),
						"user.collegeName":$('#stu_collegeName').val(),
						"user.department":$('#stu_department').val(),
						"user.profession":$('#stu_profession').val(),
						"user.classroom":$('#stu_classroom').val(),
						"user.idcard":$('#stu_idcard').val(),
						"user.phone":$('#stu_phone').val()
					},function(data) {
						if(data.result=="编辑用户成功") {
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
	
	function checkInput() {
		$("#editStudent input[type=text]").each(function() {
			if($(this).val()=="") {
				alert("请将信息填写完整");
				return false;
			}
		});
	}
</script>
</html>