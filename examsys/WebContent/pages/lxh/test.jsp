 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% String path=request.getContextPath();
   String basePath=request.getScheme() + "://" +request.getServerName() + ":" +request.getServerPort() + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="css/test.css" />
		 <link rel="stylesheet" href="css/jquery.datetimepicker.css" />
		 <link rel="stylesheet" href="css/inviteSchool.css" />
		<link rel="stylesheet" href="css/bootstrap.min.css" />
		<link rel="stylesheet" href="css/font-awesome.min.css" />
		<link rel="stylesheet" href="css/ionicons.min.css" />
		<link href="css/toastr.css" rel="stylesheet" type="text/css" />
		
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
			</nav>
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
		    			<a href="staffs_student.jsp">
			    			<li class="side_nav1 ">
								学生信息管理
							</li>
						</a>
						<a href="staffs_teacher.jsp">
							<li class="side_nav1 ">
								教师信息管理
							</li>
						</a>
						<a href="affair_index.jsp">
							<li class="side_nav1">
								试卷管理
							</li> 
						</a>
						<a href="history_staffs.jsp">
							<li class="side_nav1">
								历史成绩
							</li>
						</a>
						<a href="test.jsp">
							<li class="side_nav1 now">
								考次计划
							</li>
						</a>
		    		</ul>
		  </div>
		</nav>
		
		<!--中间部分-->
		<section class="main">
			<div class="main1">
				<div class="bred position">
		    			<!--breadcrumbs start -->
		    			<ul class="breadcrumb mybread position">
		    				<li class="active">
		    					<a href="affair_index.jsp"><i class="fa fa-home"></i> Home</a>
		    				</li>
		    				<li>考次计划</li>
		    			</ul>
		    			<!--breadcrumbs end -->	
		    	</div>
				<div class="top_main">
					<div class="top_button">
						<button class="btn btn1" type="button" data-toggle="modal" data-target="#myModal_addexam">
							<i class="fa fa-plus-circle"></i>
							添加考次
						</button>
						<button type="button" class="btn btn2" id="find">
						<i class="fa fa-search-minus"></i>
							       条件搜索
						</button>
					</div>
	         
			   <div class="search_hide" id="hide">

                   <input type="text" class="input_hide1 form-control "  id="name1" placeholder="考试计划名称"/>
				   <input type="text" class="input_hide form-control mydate" id="userId1"  placeholder="计划时间"/>
				   <input type="text" class="input_hide form-control" id="userId1"  placeholder="受邀学校"/>
				  <!--  <input type="text" class="stext hover form-control" name="school" id="school-name" value="请选择大学" onblur="if(this.value==''){this.value='请选择大学'}" onfocus="if(this.value=='请选择大学'){this.value=''}" onclick="pop()" />
										<div id="choose-box-wrapper">
											<div id="choose-box">
												<div id="choose-box-title">
													<span>选择学校</span>
												</div>
												<div id="choose-a-province"></div>
												<div id="choose-a-school"></div>
												<div id="choose-box-bottom">
													<input type="botton" onclick="hide()" value="关闭" />
												</div>
											</div>
										</div> -->
				   <button type="button" class="btn right_search" onclick="loadDatas(1)">搜索</button>
				   <input type="reset" class="btn clean">
			   </div>
          
					
			
			<!--表格-->
			<div class="tip">考试计划</div>
			<table class="table table-striped tb1">
				<thead class="thead-light">
			      <tr class="tb_width">
			        <th>考试计划编号</th>
			        <th>考试计划名称</th>
			        <th>计划时间</th>
			        <th>计划开始时间</th>
			        <th>计划结束时间</th>
			        <th>受邀学校</th>
			        <th>考试说明</th>
			        <th>状态</th>
			        <th>组卷</th>
			        <th>操作</th>
			      </tr>
			    </thead>
				<tbody  id="tplan-list-box">
					<!-- <tr class="tb_width">
					    <td>1</td>	
				        <td>四六级</td>
				        <td>2018-8-8</td>
				        <td>2018-8-8</td>
				        <td>2018-8-8</td>
				        <td>萍乡学院</td>
				        <td>考试说明</td>
				        <td>组卷</td>
				        <td>状态</td>
				        <td>
				           <i class='fa fa-pencil check' data-toggle='modal' data-target='#myModal_check'></i>
	                       <i class='fa fa-trash-o' onclick='deleteExamPlan()'></i><a href='affair_intel_volume.jsp?exam.sid="+obj.sid+"'>组卷</a>
			        	</td>
			        </tr> -->
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
	
		<!--模态框添加考次-->
		<div class="modal fade" id="myModal_addexam">
			<div class="modal-dialog">
				<div class="modal-content">
						   
					<!-- 模态框头部 -->
					<div class="modal-header">
						<h4 class="modal-title">添加考次</h4>
						<button type="button" class="close close1" data-dismiss="modal">&times;</button>
					</div>
							   
					 <!-- 模态框主体 -->
					<div class="modal-body">
						<table >
							<tbody>
							    <tr>
							        <td >
							        	考&nbsp;试&nbsp;计&nbsp;划&nbsp;名&nbsp;称&nbsp;
							        	<input type="text" class="hover form-control " id="ex_title">
							        </td>
							    </tr>
							    <tr>			        				
							        <td >
							        	
							        	考&nbsp;试&nbsp;开&nbsp;始&nbsp;时&nbsp;间&nbsp;
							        	<input type="text" class="hover form-control  mydate" id="ex_periodStart">
							        </td>
							    </tr>
							     <tr>			        				
							        <td >
							        	
							        	考&nbsp;试&nbsp;结&nbsp;束&nbsp;时&nbsp;间&nbsp;
							        	<input type="text" class="hover form-control  mydate"  id="ex_periodEnd">
							        </td>
							     </tr>
							        <tr>
							        	<td >
							        		<!-- 受&nbsp;&nbsp;&nbsp;&nbsp;邀&nbsp;&nbsp;&nbsp;&nbsp;学&nbsp;&nbsp;&nbsp;&nbsp;校&nbsp;&nbsp; -->
<!-- 							        		<input type="text" class="stext hover form-control school-name ex_invitee"  name="school" id="school-name" value="请选择大学" onblur="if(this.value==''){this.value='请选择大学'}" onfocus="if(this.value=='请选择大学'){this.value=''}" onclick="pop()" >
 -->							        		<!-- <input type="text" class="stext hover form-control school-name" name="school" id="school-name" /> -->
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
							       
							    </tbody>
							</table> 
						</div>
							   
					 <!-- 模态框底部 -->
					<div class="modal-footer">
					   <button type="button" class="btn btn-secondary back" data-dismiss="modal">关闭</button>
					  <button type="button" class="btn btn-primary add" onclick="createExamPlan();">添加</button>
					</div>
						   
			   </div>
		  </div>
		</div>
		
		<!--模态框修改考次-->
		<div class="modal fade" id="myModal_check">
			<div class="modal-dialog">
				<div class="modal-content">
						   
					<!-- 模态框头部 -->
					<div class="modal-header">
						<h4 class="modal-title">修改考次</h4>
						<button type="button" class="close close1" data-dismiss="modal">&times;</button>
					</div>
							   
					 <!-- 模态框主体 -->
					<div class="modal-body">
						<table >
							<tbody id="examPlan_info_box">
							    <tr>			        				
							        <td >
							        	
							        	考&nbsp;试&nbsp;计&nbsp;划&nbsp;编&nbsp;号&nbsp;
							        	<input type="text" class="hover" readonly="readonly" id="exam_sid">
							        </td>
							    </tr>
							    <tr>
							        <td >
							        	考&nbsp;试&nbsp;计&nbsp;划&nbsp;名&nbsp;称&nbsp;
							        	<input type="text" class="hover" id="exam_title">
							        </td>
							    </tr>
							    <tr>			        				
							        <td >
							        	
							        	考&nbsp;试&nbsp;开&nbsp;始&nbsp;时&nbsp;间&nbsp;
							        	<input type="text" class="hover" id="exam_periodStart">
							        </td>
							    </tr>
							     <tr>			        				
							        <td >
							        	
							        	考&nbsp;试&nbsp;结&nbsp;束&nbsp;时&nbsp;间&nbsp;
							        	<input type="text" class="hover" id="exam_periodEnd">
							        </td>
							     </tr>
							        <tr>
							        	<td >
							        		受&nbsp;&nbsp;&nbsp;&nbsp;邀&nbsp;&nbsp;&nbsp;&nbsp;学&nbsp;&nbsp;&nbsp;&nbsp;校&nbsp;&nbsp;
							        		<input type="text" class="hover" id="exam_invitee">
							        	</td>
							        </tr>
							       
							    </tbody>
							</table> 
						</div>
							   
							        <!-- 模态框底部 -->
							        <div class="modal-footer">
							          <button type="button" class="btn btn-secondary back" data-dismiss="modal">关闭</button>
							          <button type="button" class="btn btn-primary add" onclick="editExamPlan(this);">修改</button>
							        </div>
						   
						      </div>
						    </div>
						</div>
		
		<!--模态框查看考次计划详细信息-->
		<div class="modal fade" id="myModal_eye_examPlan">
			<div class="modal-dialog">
				<div class="modal-content">
					<!-- 模态框头部 -->
					<div class="modal-header">
						<h4 class="modal-title">学生详细信息</h4>
						<button type="button" class="close close1" data-dismiss="modal">&times;</button>
					</div>

					<!-- 模态框主体 -->
					<div class="modal-body">
						<table>
							<tbody id="examPlan-info-box">
								<tr>
									<td>
										计划编号
										<div class="tb_information">1</div>
									</td>
								</tr>
								<tr>
									<td>
										考试计划名称
										<div class="tb_information">XXX考试2</div>
									</td>
								</tr>
								<tr>
									<td>
										时间
										<div class="tb_information">2018-06-17 22:59:37</div>
									</td>
								</tr>
								<tr>
									<td>
										考试开始时间
										<div class="tb_information">2018-06-17 20:59:37</div>
									</td>
								</tr>
								<tr>
									<td>
										考试结束时间
										<div class="tb_information">2018-06-17 22:59:37</div>
									</td>
								</tr>
								<tr>
									<td>
									    邀请学校
										<div class="tb_information">萍乡学院</div>
									</td>
								</tr>
								<tr>
									<td>
										状态
										<div class="tb_information">0</div>
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
		<script type="text/javascript" src="js/bootstrap.min.js"></script>
		<script type="text/javascript" src="js/test.js" ></script>
		<script type="text/javascript" src="js/toastr.js"></script>
		<script type="text/javascript" src="js/school.js"></script>
		<script type="text/javascript" src="js/inviteSchool.js" ></script>
		<script type="text/javascript" src="js/jquery.date.js" ></script>
		<script type="text/javascript" src="js/jquery.datetimepicker.min.js" ></script>
		<script type="text/javascript" src="js/jquery.datetimepicker.full.min.js" ></script>
	</body>
<script>
loadMyExamList(1);
var currentPage=1;
var totalPage=2;
function loadMyExamList(page) {
	  $.post("loadMyExamList_jw", {"page":page}, function(data) {
		  var examList = data.list;
		  var htm = "";
		  var ht="";
		  for(var i=0;i<examList.length;i++) {
			  //其他信息详见cn.examsys.bean.Exam.java文件
			  var number=(page-1)*10;
		      number +=i+1;	
			  htm +=getItemHtml(i,examList[i],number); 		
		  }
		  $('#tplan-list-box').html(htm);		  
		  for(var j=1;j<=totalPage;j++) {
				 ht += getLiHtml(j);
			 }
			 $('.pagination').html(ht);
		 		currentPage = page;
	  });
}


function getItemHtml(index,obj,number){
	var htm="<tr class='tb_width' id='exam"+obj.sid+"'>"

	+"<td>"+obj.sid+"</td>"
	+"<td>"+obj.title+"</td>"
	+"<td>"+obj.time+"</td>"
	+"<td>"+obj.periodStart+"</td>"
	+"<td>"+obj.periodEnd+"</td>"
	+"<td>"+obj.invitee+"</td>"
	+"<td>"+obj.explication+"</td>"
	+"<td>"+obj.state+"</td>"
	+"<td>"
	+" <a href='loadHandConstitutePage?examSid="+obj.sid+"'>手动组卷</a>"
	+"<a href='affair_intel_volume.jsp?exam.sid="+obj.sid+"'>|智能组卷</a>"
			+"<td>"
	+"<i class='fa fa-trash-o' onclick='deleteExam("+obj.sid+")'></i><i class='fa fa-pencil check' data-toggle='modal' data-target='#myModal_check' onclick='examPlanInfo(this)' ></i>"
	+" <a href='javascript:inviteCollege("+obj.sid+",\""+obj.invitee+"\");'>邀请学校</a></td>"
	
	+"</tr>"; 
    return htm;
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


function nextPage() {
	if(currentPage<totalPage) 
		loadMyExamList(++currentPage);
}

function prevPage() {
	if(currentPage>=2) 
		loadMyExamList(--currentPage);
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
function examPlanInfo(node) {
	var td = node.parentNode.parentNode.childNodes;
	var sid = td[0].innerHTML;
	$.post("selectOneExamPlan",{"exam.sid":sid},function(data) {
		var exam = data.exam;
		/*  var info = getInfoHtml(exam);
		$('#examPlan-info-box').html(info);  */
		
		$('#exam_sid').val(exam.sid);
		$('#exam_title').val(exam.title);
		$('#exam_periodStart').val(exam.periodStart);
		$('#exam_periodEnd').val(exam.periodEnd);
		$('#exam_invitee').val(exam.invitee);
	})
}	
 /* function getInfoHtml(obj) {
	var info ="<tr>"
	    +"<td>计划编号<div class='tb_information'>"+obj.sid+"</div>"
	    +"</td>"
	    +"</tr>"
	    +"<tr>"
	    +"<td>考试计划名称<div class='tb_information'>"+obj.title+"</div>"
	    +"</td>"
	    +"</tr>"
	    +"<tr>"
	    +"<td>时间<div class='tb_information'>"+obj.time+"</div>"
	    +"</td>"
	    +"</tr>"
	    +"<tr>"
	    +"<td>考试开始时间<div class='tb_information'>"+obj.periodStart+"</div>"
	    +"</td>"
	    +"</tr>"
	    +"<tr>"
	    +"<td>考试结束时间<div class='tb_information'>"+obj.periodEnd+"</div>"
	    +"</td>"
	    +"</tr>"
	    +"<tr>"
	    +"<td>邀请学校<div class='tb_information'>"+obj.invitee+"</div>"
	    +"</td>"
	    +"</tr>"
	    +"<tr>"
	    +"<td>状态<div class='tb_information'>"+obj.state+"</div>"
	    +"</td>"
	    +"</tr>";
	return info;
} 
 */
function createExamPlan() {
		$.post("createExamPlan",
				 {	
			        "exam.title":$('#ex_title').val(), 
			        "exam.periodStart":$('#ex_periodStart').val(), 
			        "exam.periodEnd":$('#ex_periodEnd').val(), 
			        //"exam.invitee":$('#ex_invitee').val()
			},function(data){
				alert(data.result);    //message为user返回信息
				location.href="test.jsp";
			
			})
}
function editExamPlan() {
	$.post("editExamPlan",
				{	"exam.sid":$('#exam_sid').val(),
					"exam.title":$('#exam_title').val(),
					"exam.periodStart":$('#exam_periodStart').val(),
					"exam.periodEnd":$('#exam_periodEnd').val(),
					"exam.invitee":$('#exam_invitee').val(),
				},function(data) {
					alert(data.result);
				  	location.href="test.jsp";
				
		  })
	
}
function deleteExamPlan(node) {
	var td = node.parentNode.parentNode.childNodes;
	var sid = td[0].innerHTML;alert(sid);
	if(confirm("确定要删除该考次吗？")) {
		$.post("deleteExamPlan",{"exam.sid":sid},function(data) {
			     alert(data.result);
				location.href="test.jsp";
			
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

function inviteCollege(sid, colleges) {
	var college = prompt("添加邀请的学校");
	if(colleges.indexOf(college)>=0) {
		alert(college + "已被邀请");
	} else {
		if(college != null) {
			$.post("invite", {
				"sid":sid,
				"text":college
			}, function(data) {
				if(data.result == "success") {
					alert("邀请成功");
					location.reload();
				}
			});
		}
	}
}

function deleteExam(sid) {
	if(confirm("确认删除?")) {
		$.post("delExam",{
			"sid":sid
		},function(data) {
			if(data.result == "success") {
				$("#exam"+sid).remove();
			} else {
				alert("删除失败");
			}
		});
	}
}

function checkInput() {
	var fill=ture;
	$("#editStudent input[type=text]").each(function() {
		if($(this).val()=="") {
			alert("请将信息填写完整");
			fill=ture;
		}
	});
}

$("#find").click(function(){
	$("#hide").slideToggle("slow");
		/* $("#school").click(function(){
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
		}); */
});
$.datetimepicker.setLocale('ch');
$('.mydate').datetimepicker({
	yearStart : 2018, // 设置最小年份
	yearEnd : 2030, // 设置最大年份
	yearOffset : 0, // 年偏差
	timepicker : true, // 关闭时间选项
	format : 'Y-m-d h:m', // 格式化日期年-月-日
	minDate : new Date(), // 设置最小日期
	maxDate : '2030/01/01', // 设置最大日期
});
</script>
<script type="text/javascript" src="js/test.js" ></script>
</html>
