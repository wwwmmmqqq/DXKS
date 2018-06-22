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
		<link rel="stylesheet" href="css/admin.css" />
		<link rel="stylesheet" href="css/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css"/>
		<link rel="stylesheet" href="css/ionicons.min.css" />
		<link rel="stylesheet" href="css/search.css" />
		
		<title></title>
		
	</head>
	<body>
		<div class="all">
		<!--上方导航栏-->
		<header class="header">
			<nav class="navbar navbar-static-top" role="navigation" >
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
							<a href="#" onclick="Out()" value="退出系统">退出系统</a>
						</div>
					</div>
				</div>
			</nav>
		</header>		
		
		<!--侧边导航栏-->
		
		<nav class="navbar bg-light">
			<div class="user-panel">
				<div class="image">
					<img class="user1" src="img/user1.jpg"  alt="User Image">
				</div>
				<div class="info">
                    <p>Hello, ${session.user.userId}</p>                   
               </div>
			</div>
			<div class="light_bottom"> 
			  	<ul class="side_nav">
			  		<a href="admin.jsp" ><li class="side_nav1 now">用户管理</li></a>
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
		    					<a href="admin.jsp"><i class="fa fa-home"></i> Home</a>
		    				</li>
		    				<li>用户管理</li>
		    			</ul>
		    			<!--breadcrumbs end -->	
		    	</div>
				<div class="top_main">
					<div class="top_button">
						<button class="btn btn1" type="button" data-toggle="modal" data-target="#myModal">
							<i class="fa fa-plus-circle"></i>
							添加用户
						</button>
						<div class="top_search">
							<button type="button" class="btn btn2" id="find">
								<i class="fa fa-search-minus"></i>
								条件搜索
							</button>
						</div>
					</div>
					<div class="search_hide" id="hide">

						<input type="text" class="input_hide1"  id="name1" placeholder="姓名"/>
						<input type="text" class="input_hide" id="userId1"  placeholder="工号"/>
						<select class="select_hide">
							<option class="option_hide" selected="selected">全部</option>
							<option class="option_hide" id="school">学校</option>
							<option class="option_hide" id="institute">学院</option>
							<option class="option_hide" id="profession">专业</option>
							<option class="option_hide" id="class">班级</option>
						</select>
						<input type="text" class="input_hide2" id="school1" name="collegeName"  placeholder="学校"/>
						<input type="text" class="input_hide2" id="institute1" name="department" placeholder="学院"/>
						<input type="text" class="input_hide2" id="profession1" name="profession" placeholder="专业"/>
						<input type="text" class="input_hide2" id="class1" name="classroom" placeholder="班级"/>
						<button type="button" class="btn right_search" onclick="loadDatas(1)">搜索</button>
						<button type="button" class="btn clean">清空搜索</button>
					</div>
				
				
				
				<!--表格-->
				<div class="tip">用户信息</div>
				<table class="table table-striped tb1" id="clearTbody">
				<thead class="thead-light">
			      <tr class="tb_width">
			      	<th>序号</th>
			        <th>姓名</th>
			        <th>工号</th>
			        <th>学校</th>
			        <th>学院</th>
			        <th>邮箱</th>
			        <th>操作</th>
			      </tr>
			    </thead>
			     <tbody id="data-box">
					<!-- <tr class="tb_width">
				      	<td>1</td>
				        <td>慕雪</td>
				        <td>17001</td>
				        
				        <td>萍乡学院</td>
				        <td>信息与计算机工程学院</td>
				        
				        <td>771196591@qq.com</td>
				        <td class="see" data-toggle="modal" data-target="#myModal_see">查看权限</td>
				        <td>
				        	<i class="fa fa-eye see_information"  data-toggle="modal" data-target="#myModal_see_information"></i>
				        	<i class="fa fa-pencil check" data-toggle="modal" data-target="#myModal_correct_information"></i>
				        	<i class="fa fa-trash-o" onclick="myFunction1()"></i>
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
					    <!-- <li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="prevPage()">上一页</a></li>
					    <li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="loadDatas(1)">1</a></li>
					    <li class="page-item"><a class="page-link " href="javascript:void(0)" onclick="loadDatas(2)">2</a></li>
					    <li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="loadDatas(3)">3</a></li>
					    <li class="page-item"><a class="page-link" href="javascript:nextPage()" >下一页</a></li> -->
					    <!-- <input class="jump" id="jpage">
					    <button class="btn btn-primary btn_jump">跳转</button> -->
				  </ul>
			  	</div>
				
			</div>
			
		</section>
		
		
		
		
			
						<!--模态框 添加用户-->
						<div class="modal fade" id="myModal">
						    <div class="modal-dialog">
						      	<div class="modal-content">
						   
							        <!-- 模态框头部 -->
							        <div class="modal-header">
							          <h4 class="modal-title">添加用户</h4>
							          <button type="button" class="close close1" data-dismiss="modal">&times;</button>
							        </div>
							   
							        <!-- 模态框主体 -->
							        <div class="modal-body">
							        	<table id="table " class='add-jw'>
							        		<tbody>
							        			<tr>
							        				<td>
							        					姓&nbsp;&nbsp;&nbsp;&nbsp;名&nbsp;&nbsp;&nbsp;&nbsp;
							        					<input type="text" class="hover" name="name">
							        				</td>
							        			</tr>
							        			<tr>			        				
							        				<td >
							        					工&nbsp;&nbsp;&nbsp;&nbsp;号&nbsp;&nbsp;&nbsp;&nbsp;
							        					<input type="text" class="hover" name="userid">
							        				</td>
							        			</tr>
							        			<tr>
							        				<td >
							        					学&nbsp;&nbsp;&nbsp;&nbsp;校&nbsp;&nbsp;&nbsp;&nbsp;
							        					<input type="text" class="hover" name="collegeName">
							        				</td>
							        			</tr>
							        			<tr>
							        				<td class="choose-sex">
							        					性&nbsp;&nbsp;&nbsp;&nbsp;别&nbsp;&nbsp;&nbsp;&nbsp;
<<<<<<< HEAD
							        				<div class="input_checkbox" name="sex" id="sex">
							        				<select class="form-control ">
							        				<option value="男">男</option>
							        				<option value="女">女</option>
							        				</select>
														</div> 
=======
							        						<select class="form-control" name="sex" id="administrationSex">
							        							<option value="男">男</option>
							        							<option value="女">女</option>
							        						</select>
							        					 <!-- <input type="text" class="hover"  name="sex">  -->
>>>>>>> lrx
							        				</td>
							        			</tr>
							        			<tr>
							        				<td >
							        					联系方式&nbsp;
							        					<input type="text" class="hover"  name="phone">
							        				</td>
							        			</tr>
							        			<tr>
							        				<td >
							        					邮&nbsp;&nbsp;&nbsp;&nbsp;箱&nbsp;&nbsp;&nbsp;&nbsp;
							        					<input type="text" class="hover"  name="email">
							        				</td>
							        			</tr>	
							        		</tbody>
							        	</table>
							         
							          
							        </div>
							   
							        <!-- 模态框底部 -->
							        <div class="modal-footer">
							          <button type="button" class="btn btn-secondary back" data-dismiss="modal">关闭</button>
							          <button type="button" class="btn btn-primary add" onclick="addJw()" id="add">添加</button>
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
								        					用户名<div class="tb_information">${session.user.userId}</div>
								        				</td>
								        			</tr>
								        			<tr>			        				
								        				<td >
								        					密码<div class="tb_information">${session.user.psw}</div>
								        				</td>
								        			</tr>
								        			<tr>
								        				<td >
								        					姓名<div class="tb_information">${session.user.name}</div>
								        				</td>
								        			</tr>
								        			<tr>
								        				<td >
								        					性别<div class="tb_information">${session.user.sex} </div>
								        				</td>
								        			</tr>
								        			<tr>
								        				<td >
								        					电话<div class="tb_information">${session.user.phone}</div>
								        				</td>
								        			</tr>
								        			<tr>
								        				<td >
								        					所属大学<div class="tb_information">${session.user.collegeName}</div>
								        				</td>
								        			</tr>
								        			<tr>
								        				<td >
								        					邮箱<div class="tb_information">${session.user.email}</div>
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
  
  		<!--查看权限模态框-->
		<div class="modal fade" id="myModal_see">
		   <div class="modal-dialog modal-sm">
		    <div class="modal-content">
		 
		      <!-- 模态框头部 -->
		      <div class="modal-header">
		        <h4 class="modal-title">权限</h4>
		        <button type="button" class="close close1" data-dismiss="modal">&times;</button>
		      </div>
		 
		      <!-- 模态框主体 -->
		      <div class="modal-body">
				拥有的权限：能查看答案，能阅卷
		      </div>
		 
		      <!-- 模态框底部 -->
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary back_information" data-dismiss="modal">关闭</button>
		      </div>
		 
		    </div>
		  </div>
		</div>	
	  
		<!--table查看信息模态框-->	
			<div class="modal fade" id="myModal_see_information">
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
						<tbody id="administration-info-box">
							<tr>
								<td >
									姓名<div class="tb_information">慕雪</div>
								</td>
							</tr>
							<tr>			        				
								<td >
									工号<div class="tb_information">17001</div>
								</td>
							</tr>
							<tr>
								<td >
									密码<div class="tb_information">1650567</div>
								</td>
							</tr>
							<tr>
								<td >
									学校<div class="tb_information">萍乡学院</div>
								</td>
							</tr>
							<tr>
								<td >
									学院<div class="tb_information">信计学院</div>
								</td>
							</tr>
							<tr>
								<td >
									性别<div class="tb_information">女</div>
								</td>
							</tr>
							<tr>
								<td >
									联系方式<div class="tb_information">1770313147</div>
								</td>
							</tr> 
							<tr>
								<td >
									邮箱<div class="tb_information">1770313147@qq.com</div>
								</td>
							</tr>  
							<tr>
								<td >
									权限<div class="tb_information">能查看答案，不能阅卷</div>
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
			
			<!--模态框修改用户信息-->
							<div class="modal fade" id="myModal_correct_information" >
							    <div class="modal-dialog">
							      	<div class="modal-content">
							   
								        <!-- 模态框头部 -->
								        <div class="modal-header">
								          <h4 class="modal-title">修改信息</h4>
								          <button type="button" class="close close1" data-dismiss="modal">&times;</button>
								        </div>
								   
								        <!-- 模态框主体 -->
								        <div class="modal-body">
											<table >
												<tbody>
								        			<tr>
								        				<td >
								        					用&nbsp;&nbsp;&nbsp;户&nbsp;&nbsp;&nbsp;名<input type="text" class="tb_information " id="administration_userId">
								        				</td>
								        			</tr>
								        			<tr>			        				
								        				<td >
								        					密&nbsp;&nbsp;&nbsp;&nbsp;码&nbsp;&nbsp;&nbsp;&nbsp;<input class="tb_information" id="administration_psw">
								        				</td>
								        			</tr>
								        			<tr>
								        				<td >
								        					姓&nbsp;&nbsp;&nbsp;&nbsp;名&nbsp;&nbsp;&nbsp;&nbsp;
								        					<input class="tb_information" id="administration_name">
								        				</td>
								        			</tr>
								        			<tr>
								        				<td >
								        					性&nbsp;&nbsp;&nbsp;&nbsp;别&nbsp;&nbsp;&nbsp;&nbsp;
								        					<input class="tb_information" id="administration_sex">
								        				</td>
								        			</tr>
								        			<tr>
								        				<td >
								        					电&nbsp;&nbsp;&nbsp;&nbsp;话&nbsp;&nbsp;&nbsp;&nbsp;
								        					<input class="tb_information" id="administration_phone">
								        				</td>
								        			</tr>
								        			<tr>
								        				<td >
								        					所属&nbsp;大学&nbsp;<input class="tb_information" id="administration_collegeName">
								        				</td>
								        			</tr>
								        			<tr>
								        				<td >
								        					邮&nbsp;&nbsp;&nbsp;&nbsp;箱&nbsp;&nbsp;&nbsp;&nbsp;
								        					<input class="tb_information" id="administration_email">
								        				</td>
								        			</tr>
								        			<tr>
							        				<td >

							        					权&nbsp;&nbsp;&nbsp;&nbsp;限&nbsp;&nbsp;&nbsp;&nbsp;
							        					<select class="option" id="administration_permission_answer"> 
							        						<option>能查看答案</option>
							        						<option>不能查看答案</option>
							        					</select>
							        					<select class="option" id="administration_permission_paper"> 
							        						<option>能够阅卷</option>
							        						<option>不能阅卷</option>
							        					</select>
							        				</td>
							        			</tr>
												</tbody>
											</table>
								        
								        </div>
					   
								        <!-- 模态框底部 -->
								        <div class="modal-footer">
								        	<button type="button" class="btn btn-primary add_invite" data-dismiss="modal" onclick="editStudent()">确认</button>
								          <button type="button" class="btn btn-secondary back_invite" data-dismiss="modal">关闭</button>
								        </div>
							      	</div>
							    </div>
							</div>			
			
	  </div>
	  <script type="text/javascript" src="js/jquery-3.2.1.min.js" ></script>
		<script type="text/javascript" src="js/bootstrap.min.js" ></script>
		<script src="https://cdn.bootcss.com/popper.js/1.12.5/umd/popper.min.js"></script>
	  <script type="text/javascript" src="js/search.js" ></script>
	<script type="text/javascript" src="js/admin.js" ></script>
	</body>
	
</html>
