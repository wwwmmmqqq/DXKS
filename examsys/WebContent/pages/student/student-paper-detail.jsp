<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="s" uri="/struts-tags" %>
          <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/student.css" />
<link rel="stylesheet" href="css/ionicons.min.css" />
<link rel="stylesheet" href="css/font-awesome.min.css" />
<link href="css/jquery-confirm.css" rel="stylesheet" type="text/css" />
<link href="css/toastr.css" rel="stylesheet" type="text/css" />

</head>
<body>

		<header>

			<nav id="top-nav">
				<div id="main-nav-content">
					<a href="student-main.jsp" clas="logo">
						<img class="logo-img" src="<%=basePath%>img/logo.png" />
					</a>

						<div class="navbar-right">
						<ul class="user-info">
							<li class="dropdown user user-menu">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">
									<i class="fa fa-user"></i>
									<span>${session.user.name}</span>
								</a>
								
							</li>
							<div class="dropdown-content">
		    			<a href="javascript:setPassword()">修改密码</a>
		    			<a >退出系统</a>
		    		</div>
						</ul>
						
					</div>
				</div>
			</nav>
		</header>
			<div class="main-content">
				<div class="breadcrumb">
				<i class="fa fa-circle-o"></i> 位置：
				<a href="student-main.jsp">首页</a>
				<b>></b>
				<a href="student-all-exam.jsp">我的考试</a>
				<b>></b>
				<a href="/">查看试卷</a>
			</div>
			<section class="left-section">
				<div class="left-menu">
					<div class="user-panel">
						<div class="pull-left image">
							<img src="<%=basePath%>img/user.jpg" class="img-circle" alt="User Image" />
						</div>
						<div class="pull-left info">
							<p>Hello,${session.user.name}</p>
							<a href="#"><i class="fa fa-circle text-success"></i> Online</a>
						</div>
					</div>
					<ul class="sider-menu">
						<li onclick="javascript:window.location.href='student-main.jsp'">
							<span >
								在线考试
							</span>
						</li>
						<li onclick="javascript:window.location.href='student-self-exam.jsp'">
							<span>
								在线练习
							</span>
						</li>
						<li  class="active">
							<span>
								我的考试
							</span>
						</li>
						<li  onclick="javascript:window.location.href='student-exam-score.jsp'">
							<span>
								历史成绩
							</span>
						</li>

						<li data-toggle="modal" data-target="#myinfo" onclick="showInfo()">
							<span>
								我的信息
							</span>
						</li>
					</ul>
					<!-- 模态框（Modal） -->
<div class="modal fade" id="myinfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
					个人信息
				</h4>
			</div>
			<div class="modal-body">
				<form id="my-info">
					<div >
						<table class="info-body">
							<tbody>
								<tr class="basic-info">
									<td>学号：</td>
									<td>
								
										<input type="text" class="form-control" disabled="disabled" name="user.userId" value='${session.user.userId}'/>
									</td>
								</tr>
								<tr>
									<td>姓名：</td>
									<td>
										<input type="text" class="form-control" name="user.name"/>
									</td>
								</tr>
								<tr>
									<td>性别：</td>
									<td>
										<input type="text" class="form-control" name="user.sex"/>
									</td>
								</tr>
								<tr>
									<td>学校：</td>
									<td>
										<input type="text" class="form-control" name="user.collegeName"/>
									</td>
								</tr>
								<tr>
									<td>学院：</td>
									<td>
										<input type="text" class="form-control" name="user.permission"/>
									</td>
								</tr>
								<tr>
									<td>专业：</td>
									<td>
										<input type="text" class="form-control" name="user.profession"/>
									</td>
								</tr>
								<tr>
									<td>邮箱：</td>
									<td>
										<input type="text" class="form-control" name="user.email"/>
									</td>
								</tr>
								<tr>
									<td>电话：</td>
									<td>
										<input type="text" onblur="checkPhone()" class="form-control" name="user.phone"/>
									</td>
								</tr>
								
								<tr>
									<td>身份证号：</td>
									<td>
										<input type="text" onblur="checkIdCard()" id="student_idcard" class="form-control" name="user.idcard"/>
									</td>
								</tr>
								
							</tbody>
						</table>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				
				<button type="button" id="modify-button"class="btn btn-primary" data-dismiss="modal">确认修改
				</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
				</div>
				</div>
			</section>
			<section class="right-section">
				<div class="right-content">
				   
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
					<!-- <div class="paper-title-info">
					<div class="detail-paper-title">
						<span>软件工程导论测试卷A</span>
						
					</div>
					<div class="que-info">
						<ul>
							<li>命题人：</li>
							<li>张三</li>
							<li>总分：</li>
							<li>100分</li>
							<li>答题时间:</li>
							<li>120分钟</li>
						</ul>
						</div>
					</div>
					<div class="detaile-question">
						<div class="all-que">
							<ul class="que-type">
								<li>一、填空题</li>
							</ul>
							<ul>
								<li>
									<span>1.</span><span>下列哪项不属于因为  <input type="text" class="tk-que" size="12" placeholder="疫苗"/> 的本质因素而引起的不良反应</span>
								</li>
							</ul>
							<ul class="que-type">
								<li>二、选择题</li>
							</ul>
							<ul class="all-que-title">
								<li><span>1.</span>
							<span>(1分)</span>
								<span>下列哪项不属于因为疫苗的本质因素而引起的不良反应</span>
								</li>
							</ul>
							<ul class="all-answer">
								<li>
									<p>
									<span>A.</span>
									<span><input type="radio">减毒疫苗在体内复制繁殖引起类似自然感染的临床症状；</span>  
									</p>
								</li>
								<li>
									<p>
									<span>B.</span>
									<span><input type="radio">减毒疫苗在体内复制繁殖引起类似自然感染的临床症状；</span>
									</p>
								</li>
								<li>
									<p>
									<span>C.</span>
									<span><input type="radio">减毒疫苗在体内复制繁殖引起类似自然感染的临床症状；</span>
									</p>
								</li>
								<li>
									<p>
									<span>D.</span>
									<span><input type="radio">减毒疫苗在体内复制繁殖引起类似自然感染的临床症状；</span>
									</p>
								</li>
								<li>
									<p>
									<span>答案：</span>
									<span>C</span>
									</p>
								</li>
							</ul>
							<ul class="que-type">
								<li>三、判断题</li>
							</ul>
							<ul class="all-que-title">
								<li><span>2.</span>
							<span>(1分)</span>
								<span>下列哪项不属于因为疫苗的本质因素而引起的不良反应</span>
								</li>
							</ul>
							<ul class="all-answer">
								<li>
									<p>
									<span>A.</span>
									<span><input type="radio">对</span>  
									</p>
								</li>
								<li>
									<p>
									<span>B.</span>
									<span><input type="radio">错</span>
									</p>
								</li>
								<li>
									<p>
									<span>答案：</span>
									<span>A</span>
									</p>
								</li>
							</ul>
							<ul class="all-que-title">
								<li><span>2.</span>
							<span>(1分)</span>
								<span>下列哪项不属于因为疫苗的本质因素而引起的不良反应</span>
								</li>
							</ul>
							<ul class="all-answer">
								<li>
									<p>
									<span>A.</span>
									<span><input type="radio">对</span>  
									</p>
								</li>
								<li>
									<p>
									<span>B.</span>
									<span><input type="radio">错</span>
									</p>
								</li>
								<li>
									<p>
									<span>答案：</span>
									<span>A</span>
									</p>
								</li>
							</ul>
							<ul class="que-type">
								<li>四、简答题</li>
							</ul>
							<ul class="all-que-title">
								<li><span>3.</span>
							<span>(5分)</span>
								<span>下列哪项不属于因为疫苗的本质因素而引起的不良反应</span>
								</li>
							</ul>
							<ul class="all-answer">
								
								<li class="intro-answer">
									<p>
									<span>下列哪项不属于因为疫苗的本质因素而引起的不良反应下列哪项不属于因为疫苗的本质因素而引起的不良反应下列哪项不属于因为疫苗的本质因素而引起的不良反应
									下列哪项不属于因为疫苗的本质因素而引起的不良反应下列哪项不属于因为疫苗的本质因素而引起的不良反应下列哪项不属于因为疫苗的本质因素而引起的不良反应</span>
									</p>
								</li>
								<li class="intro-answer">
									<p>
									<span>答案：</span><span>下列哪项不属于因为疫苗的本质因素而引起的不良反应下列哪项不属于因为疫苗的本质因素而引起的不良反应下列哪项不属于因为疫苗的本质因素而引起的不良反应</span>
									</p>
								</li>
							</ul>
						</div>
					</div> -->
				</div>
			</section>
			</div>
			<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
			<script type="text/javascript" src="js/bootstrap.min.js"></script>
			<script type="text/javascript" src="js/jquery-confirm.js"></script>
			<script type="text/javascript" src="js/com.js"></script>
			<script type="text/javascript" src="js/toastr.js"></script>
</body>
</html>