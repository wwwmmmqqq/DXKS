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
				    				<span>${session.user.userId} <i class="caret"></i></span>
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
						<a href="#" data-toggle="modal" data-target="#myModal-invite-teacher">邀请老师出卷</a>
						<a href="#" data-toggle="modal" data-target="#myModal-invite-school">邀请学校考试</a>
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
						<p>Hello, ${session.user.userId}v</p>
					</div>
				</div>
				<div class="light_bottom">
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
						<!-- <li class="side_nav1">
							<a href="affair_hand_volume.jsp">手动组卷</a>
						</li>
						<li class="side_nav1">
							<a href="affair_intel_volume.jsp">智能组卷</a>
						</li> -->
						<li class="side_nav1">
							<a href="history_staffs.jsp">历史成绩</a>
						</li>
						<li class="side_nav1">
							<a href="test.jsp">考次计划</a>
						</li>
					</ul>
				</div>
			</nav>
			<!-- sidebar end -->
		    
		    <div class="cant">
		    	<div class="bred">
		    			<!--breadcrumbs start -->
		    			<ul class="breadcrumb mybread">
		    				<li class="active">
		    					<a href="affair_index.jsp"><i class="fa fa-home"></i>Home</a>
		    				</li>
		    	
		    			</ul>
		    			<!--breadcrumbs end -->	
		    	</div>
		    	<div class="papermanage">
		    		<!-- 试卷管理 start -->
		    		<div class="panel showpaperpanel">
		    			<header class="panel-heading operation">
		    				<ul>
		    				    <li>样卷</li>
		    				    <li>
		    				       <button type="button" class="btn btn-primary loadPaper">导出试卷</button>
		    				    </li>
		    				</ul>
		    			</header>
		    			<div class="panel-body ">
		    				<div class="exam-list">
		    				<%-- <s:if(){}></s:if> --%>
		    				<s:if test="1=1 && 2=2">
		    					
		    				</s:if>
		    					<s:iterator id="que" value="#request.questionList" status="sta"> 
		    					<ul>
		    						<li><p>一. ${que.type}</p></li>
		    						<li>
		    						 
		    							<div class="exam-content">
		    								<!-- <div class="exam-question">		    							    
		    								</div> -->
		    								<div class="exam-qlist">
		    									<div class="exam-content">
		    										<div class="exam-question">
		    											${sta.index}.${que.title}(<input type="text" class="xz-que" size="5" placeholder=""/>)
		    										</div>
		    						
		    										<div class="exam-selection">
		    										<s:iterator id="opt" value="#request.optionList" status="st">
		    											<span class="op-item">
		    									    	   <span>${st.index}.</span>
		    											   <span>${opt.content}</span>
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
                              </s:iterator>
                               <ul>
                                    <li>二.填空题</li>
		    						<li>
		    							<div class="exam-content">
		    								<div class="exam-question">
		    						
		    								</div>
		    								<div class="exam-qlist">
		    									<div class="exam-content">
		    										<div class="exam-question">
		    											1.统一资源定位符URL完整格式是<input type="text" class="tk-que" size="12" placeholder=""/>
		    										</div>
		    						
		    										
		    									</div>
		    						
		    								</div>
		    							</div>
		    						
		    						</li>
		    						<li>
		    							<div class="exam-content">
		    								<div class="exam-question">
		    						
		    								</div>
		    								<div class="exam-qlist">
		    									<div class="exam-content">
		    										<div class="exam-question">
		    											1.统一资源定位符URL完整格式是<input type="text" class="tk-que" size="12" placeholder=""/>
		    										</div>
		    						
		    									</div>
		    						
		    								</div>
		    							</div>
		    						
		    						</li>
		    				    </ul>
		    				    <ul>
		    				    	<li>三 .解答题</li>
		    						<li>
		    							<div class="exam-content">
		    								<div class="exam-question">
		    						            
		    								</div>
		    								<div class="exam-qlist">
		    									<div class="exam-content">
		    										<div class="exam-question">
		    											1.已知函数f(x)＝lnx²+2a/x(a∈R)
		    											<br>(1)当a=-2时，求曲线y=f(x)在点(1,f(1))处的切线方程. 
		    											<br>(2)当a＞0时.   
		    											<br>  （i）讨论函数f(x)的单调性；   
		    											<br>  （ii）若函数f(x)在区间[1,e]上最小的值是3，求a的值.  
		    										</div>
		    						
		    										
		    									</div>
		    						
		    								</div>
		    							</div>
		    						
		    						</li>
		    					</ul>
		    						
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
	    
	    <!--模态框邀请老师组卷-->
	    <div class="modal fade" id="myModal-invite-teacher">
	    	<div class="modal-dialog">
	    		<div class="modal-content">
	    			<!-- 模态框头部 -->
	    			<div class="modal-header">
	    				<h4 class="modal-title">邀请老师组卷</h4>
	    				<button type="button" class="close close1" data-dismiss="modal">&times;</button>
	    			</div>-->
	    
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
</html>
