<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% String path=request.getContextPath();
   String basePath=request.getScheme() + "://" +request.getServerName() + ":" +request.getServerPort() + path + "/";
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
		<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
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
        <link rel="stylesheet" href="css/inviteSchool.css" />
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
							<a href="#" data-toggle="modal" data-target="#myModal_invite_school">邀请学校考试</a>
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
						<p>Hello, 教务周</p>
					</div>
				</div>
				<div class="light_bottom">
					<ul class="side_nav">
		    			<a href="staffs_student.jsp">
			    			<li class="side_nav1">
								学生信息管理
							</li>
						</a>
						<a href="staffs_teacher.jsp">
							<li class="side_nav1">
								教师信息管理
							</li>
						</a>
						<a href="affair_index.jsp">
							<li class="side_nav1 now">
								试卷管理
							</li> 
						</a>
						<!-- <li class="side_nav1">
							<a href="affair_hand_volume.jsp">手动组卷</a>
						</li>
						<li class="side_nav1">
							<a href="affair_intel_volume.jsp">智能组卷</a>
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
		    					<a href="jwindex.html"><i class="fa fa-home"></i>Home</a>
		    				</li>
		    	
		    			</ul>
		    			<!--breadcrumbs end -->	
		    	</div>
		    	<div class="papermanage">
		    		<!-- 试卷管理 start -->
		    		<div class="panel showpaperpanel">
		    			<header class="panel-heading operation">
		    				<ul>
		    				    <li>
		    				    	<button type="button" class="btn btn-primary loadPaper" onclick="delPaper()">删除样卷 </button>
		    				    </li>
		    				    <li>
		    				       <button type="button" class="btn btn-primary loadPaper">导出试卷</button>
		    				    </li>
		    				</ul>
		    			</header>
		    			<div class="panel-body ">
		    				<div class="exam-list">
		    					<s:iterator id="que" value="#request.list" status="sta">
		    					<ul>
		    						<li>
			    						
									</li>
		    						<li>
		    						 
		    							<div class="exam-content">
		    								<!-- <div class="exam-question">		    							    
		    								</div> -->
		    								<div class="exam-qlist">
		    									<div class="exam-content">
		    										<div class="exam-question">
		    											<h5>
		    											<s:if test="#request.lastType != #request.que.type">
						 									<p style="font-size: 24px">
						 									${(que.type=="Single")?"单选题":""}
															${(que.type=="Multiple")?"多选题":""}
															${(que.type=="TrueOrFalse")?"判断题":""}
															${(que.type=="Fills")?"填空题":""}
															${(que.type=="Subjective")?"解答题":""}
															</p>
														</s:if>
		    											${sta.index+1}. ${que.title}
		    											</h5>
		    										</div>
		    						
		    										<div class="exam-selection">
		    										<s:iterator id="opt" value="#que.options" status="st">
		    											<span class="op-item">
		    											   <s:if test="'Single Multiple'.indexOf(#que.type)>=0">
		    											        <%request.setAttribute("optionLabel", (char)(((org.apache.struts2.views.jsp.IteratorStatus)request.getAttribute("st")).getIndex()+'A')); %>
		    											   		<span>${optionLabel}. ${opt.content} </span>
		    											   </s:if>
		    											   <s:else>
		    											   	<div>${st.index+1}. ${opt.content} </div>
		    											   	<div><textarea class="xz-que" readonly="readonly" cols="30" rows="3"></textarea></div>
		    											   </s:else>
		    											</span>
		    										</s:iterator>	
		    										    <!-- <span class="op-item">
		    							                	<span>B.</span>
		    											   <span>Update software</span>
		    											</span>
		    											<span class="op-item">
		    									    	    <span>C.</span>
		    											<span>Update software</span>
		    											</span>
		    											<span class="op-item">
		    									    		<span>D.</span>
		    											<span>Update software</span>
		    											</span> -->
		    										</div>
		    									</div>
		    									
		    								</div>
		    							</div>
                                    </li>
                                   <%--  <li>
		    							<div class="exam-content">
		    								<div class="exam-question">
		    							    
		    								</div>
		    								<div class="exam-qlist">
		    									<div class="exam-content">
		    										<div class="exam-question">
		    											1.下列说法正确的是(<input type="text" class="xz-que" size="5" placeholder=""/>)
		    										</div>
		    							
		    										<div class="exam-selection">
		    											<span class="op-item">
		    									    	   <span>A.</span>
		    											   <span>Update software</span>
		    											</span>
		    										    <span class="op-item">
		    							                	<span>B.</span>
		    											   <span>Update software</span>
		    											</span>
		    											<span class="op-item">
		    									    	    <span>C.</span>
		    											<span>Update software</span>
		    											</span>
		    											<span class="op-item">
		    									    		<span>D.</span>
		    											<span>Update software</span>
		    											</span>
		    										</div>
		    									</div>
		    									
		    								</div>
		    							</div>
		    							
		      
                                    </li> --%>
                               </ul>
                               <%
                               cn.examsys.bean.Question question = (cn.examsys.bean.Question)request.getAttribute("que");
                               if(question!=null)
                            	   request.setAttribute("lastType", question.getType());
                               %>
                              </s:iterator>
		    				</div>
		    	
		    			</div>
		    			<!-- 试卷管理 end -->
		    			
		    			
		    			<div class="page_pagination">
		    				<ul class="pagination">
		    					<li class="page-item">
		    						<a class="page-link" href="#">上一页</a>
		    					</li>
		    					<li class="page-item">
		    						<a class="page-link" href="#">1</a>
		    					</li>
		    					<li class="page-item active">
		    						<a class="page-link " href="#">2</a>
		    					</li>
		    					<li class="page-item">
		    						<a class="page-link" href="#">3</a>
		    					</li>
		    					<li class="page-item">
		    						<a class="page-link" href="#">下一页</a>
		    					</li>
		    					<input class="jump">
		    					<button class="btn btn-primary btn_jump">跳转</button>
		    				</ul>
		    			</div>
		    			
		    			
		    		</div>	
		    	</div>
		    </div>
		    
	    </div>
		
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
	function delPaper() {
		$.post("delPaper", {"sid":${paper.sid}}, function(data) {
			if(data.result == "success") {
				alert("删除成功!");
				window.close();
			}
		});
	}
	</script>
	<script type="text/javascript" src="js/school.js"></script>
<script type="text/javascript" src="js/inviteSchool.js" ></script>
</html>
