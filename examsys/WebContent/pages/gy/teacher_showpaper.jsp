<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="/struts-tags" prefix="s"%>
    <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
        <link href="css/lxhstyle1.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
		<script type="text/javascript" src="js/popper.min.js" ></script>
		<script type="text/javascript" src="js/bootstrap.min.js"></script>
       
	</head>
	<body>
	<div class="all">
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
				    				<span>teacher <i class="caret"></i></span>
				    			</a>    		
				    	    </button>
					<div class="dropdown-content">
						<a href="#" data-toggle="modal" data-target="#myModal-information">个人中心</a>
						<a href="#" >修改密码</a>
						<a href="#" onclick="myFunction()" value="退出系统">退出系统</a>
					</div>
				</div>
		
				<div class="dropdown notice">
					<button class="dropbtn">
				    			    			<a href="#" class="dropdown-toggle" data-toggle="dropdown">
				    			    				<i class="fa fa-envelope"></i>
				    			    				<span class="label-success success1"></span>
				    			    			</a>
				    			    	    </button>
					<div class="dropdown-content">
							<a href="#" data-toggle="modal" data-target="#myModal-email">邀请通知</a>
							<a href="#" data-toggle="modal" data-target="#myModal_read">阅卷通知</a>
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
						<p>Hello, teacher</p>
					</div>
				</div>
				<div class="light_bottom">
					<ul class="side_nav">
					<a href="jsshowpaper.jsp"><li class="side_nav1 now">题库管理</li></a>
					<a href="history_teacher.jsp"><li class="side_nav1 ">查看成绩</li></a>
					<a href="teacher_read.jsp"><li class="side_nav1 ">批阅试卷</li></a>
				</ul>
				</div>
			</nav>
			<!-- sidebar end -->
		    
		    <div class="cant">
		    	<div class="bred">
		    			<!--breadcrumbs start -->
		    			<ul class="breadcrumb mybread">
		    				<li>
		    					<a href="jsshowpaper.jsp"><i class="fa fa-home"></i> Home</a>
		    				</li>
		    				<li>
		    					题库管理
		    				</li>
		    			</ul>
		    			<!--breadcrumbs end -->	
		    	</div>
		    	<!-- 搜索部分 -->
		    	<div>
		    	
			    	<div class="search">
		    		<form class="form-inline searchform" role="form">
		    			<select class="form-control" id="">
		    				<option>选择题型</option>
		    				<option>单选题</option>
		    				<option>多题选</option>
		    				<option>填空题</option>
		    				<option>判断题</option>
		    			    <option>解答题</option>
		    			</select>
		    			<div class="form-group">
		    				<label class="sr-only" for="name">关键字</label>
		    				<input type="text" class="form-control myinput" id="name" placeholder="请输入关键字搜索">
		    				
		    			</div>
		    			<button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
			    		<a href="jsentryquestions.jsp"><button type="button" class="btn btn-in">录入题库</button></a>
			    			
		    			
		    		</form>
		    	</div>
		    		
		    	</div>
		    	<div class="papermanage">
		    		<!--  浏览试卷 start -->
		    		<section>
		    			<div class="panel showpaper">
		    			<s:iterator id="que" value="#request.questionList" status="s1">
		    				<div class="panel-body paperpanel">
		    					<div class="qtype">
		    					
		    						<p class="information">
		    							<span>选择题型：
		    								${(que.type=="Single")?"(单选题)":""}
											${(que.type=="Multiple")?"(多选题)":""}
											${(que.type=="TrueOrFalse")?"(判断题)":""}
											${(que.type=="Fills")?"(填空题)":""}
											${(que.type=="Subjective")?"(解答题)":""}
		    							</span>
		    							<span>难易度：
		    								${que.difficultyValue==1?"简单":""}
		    								${que.difficultyValue==2?"一般":""}
		    								${que.difficultyValue==3?"中等":""}
		    								${que.difficultyValue==4?"较难":""}
		    							</span>
		    							<span>知识点：${que.knowledge}</span>
		    						</p>
		    						<div class="operation">
		    							<ul>
		    								<li><button class="btn btn-default btn-xs" data-toggle="modal" data-target="#modify-"><i class="fa fa-pencil"></i></button></li>
		    							    <li><button class="btn btn-default btn-xs" onclick="myFunction1()"><i class="fa fa-times"></i></button></li>
		    							</ul>
		    						</div>
		    					</div>
		    					<ul>
		    						<li class="question"><h4>${que.title}</h4></li>
			    					<s:iterator id="queOpt" value="#que.options" status="s2">
			    					<%request.setAttribute("optionLabel", (char)(((org.apache.struts2.views.jsp.IteratorStatus)request.getAttribute("s2")).getIndex()+'A')); %>
			    						<li>${("Single Multiple TrueOrFalse".indexOf(que.type))>0?optionLabel:(s2.index+1)}. ${queOpt.content}</li>
			    						<li>正确答案：
				    						<span style="color: red;">
				    							${("Single Multiple TrueOrFalse".indexOf(que.type)>0 && queOpt.isAnswer==1)?optionLabel:""}
				    							${que.type=="Fills"?queOpt.fillsText:""}
				    							${que.type=="Subjective"?queOpt.subjectiveText:""}
				    						</span>
			    						</li>
		    						</s:iterator>
		    						<%-- <li>正确答案：
		    							<span style="color: red;">
				    						${que.type=="Single"?queOpt.isAnswer:""}
				    						${que.type=="Fills"?queOpt.fillsText:""}
				    						${que.type=="Multiple"?queOpt.isAnswer:""}
				    						${que.type=="Subjective"?queOpt.subjectiveText:""}
				    						${que.type=="TrueOrFalse"?queOpt.isAnswer:""}
			    						</span>
		    						</li> --%>
		    						<%-- <s:if  test="#optque.isAnswer==1">
		    						<li>正确答案：${optque.content }</li>
		    						</s:if> --%>
		    					</ul>
		    					
		    					
		    				</div>
		    			</s:iterator>
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
		    			
		    		</section>
		    		<!--  浏览试卷 end -->
		        
		        
		    		<!--模态框-->
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
				        
		    		<!-- 修改试卷信息模态框 -->
		    		<div class="modal fade " id="modify-subject" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		    			<div class="modal-dialog">
		    				<div class="modal-content">
		    					<div class="modal-header">
		    						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
		    			    					&times;
		    			    				</button>
		    						<h4 class="modal-title" id="myModalLabel">
		    			    					修改题目
		    			    				</h4>
		    					</div>
		    					<div class="modal-body modify-body">
		    						<div>题&nbsp;&nbsp;目:<input type="text" /></div>
		    						<div>选项A:<input type="text" /></div>
		    						<div>选项B<input type="text" /></div>
		    						<div>选项C<input type="text" /></div>
		    						<div>选项D<input type="text" /></div>
		    						<div>答&nbsp;&nbsp;案:<input type="text" /></div>
		    						<div>:<input type="text" /></div>
		    		
		    					</div>
		    					<div class="modal-footer">
		    						<button type="button" class="btn btn-default" data-dismiss="modal">关闭
		    			    				</button>
		    						<button type="button" class="btn btn-primary">
		    			    					提交更改
		    			    				</button>
		    					</div>
		    				</div>
		    				<!-- /.modal-content -->
		    			</div>
		    			<!-- /.modal -->
		    		</div>
	    </section>
	</div>	
	</body>
	<script type="text/javascript" src="js/search.js" ></script>
</html>
