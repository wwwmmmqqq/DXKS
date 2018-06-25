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
         <link href="css/jquery-confirm.css" rel="stylesheet" type="text/css" />
            <link href="css/toastr.css" rel="stylesheet" type="text/css" />
       
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
					<a href="searchQuestions"><li class="side_nav1 now">题库管理</li></a>
					<a href="history_teacher.jsp"><li class="side_nav1 ">查看成绩</li></a>
					<a href="teacher_read_jump.jsp"><li class="side_nav1 ">批阅试卷</li></a>
				</div>
			</nav>
			<!-- sidebar end -->
		    
		    <div class="cant">
		    	<div class="bred">
		    			<!--breadcrumbs start -->
		    			<ul class="breadcrumb mybread">
		    				<li class="active">
		    					<a href="showItemBankListByUserJump?page=1"><i class="fa fa-home"></i> Home</a>
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
		    		<div class="form-inline searchform" role="form">
		    			<select class="form-control" onchange="searchType(this.value)">
		    				<option value="">所有题型</option>
		    				<option value="Single" ${type=='Single'?'selected':''}>单选题</option>
		    				<option value="Multiple" ${type=='Multiple'?'selected':''}>多题选</option>
		    				<option value="Fills" ${type=='Fills'?'selected':''}>填空题</option>
		    				<option value="TrueOrFalse" ${type=="TrueOrFalse"?"selected":""}>判断题</option>
		    			    <option value="Subjective" ${type=='Subjective'?'selected':''}>解答题</option>
		    			</select>
		    			<div class="form-group">
		    				<label class="sr-only" for="name">关键字</label>
		    				<input type="text" class="form-control myinput" id="keyInput" placeholder="请输入关键字搜索">
		    				
		    			</div>
		    			<button type="submit" class="btn btn-default" onclick="searchKey(keyInput.value)"><i class="fa fa-search"></i></button>
			    		<a href="jsentryquestions.jsp"><button type="button" class="btn btn-in">录入题库</button></a>
		    		</div>
		    	</div>
		    		
		    	</div>
		    	<div class="papermanage">
		    		<!--  浏览试卷 start -->
		    		<section>
		    			<div class="panel showpaper">
		    			<s:iterator id="que" value="#request.list" status="s1">
		    				<div class="panel-body paperpanel" id="question${que.sid}">
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
		    							<span>科目：${que.subjectName}</span>
		    						</p>
		    						<div class="operation">
		    							<ul>
		    							<s:if test="#que.type=='Single'">
		    								<%-- <li>
		    									<button class="btn btn-default btn-xs" data-toggle="modal" 
		    										data-target="#myModal-pencil" onclick="editQuestion(${que.sid})">
		    										<i class="fa fa-pencil"></i>
		    									</button>
		    									</li> --%>
		    							    <li><button class="btn btn-default btn-xs" onclick="deleteQuestion(${que.sid})"><i class="fa fa-times"></i></button>
		    									</li>
		    							
		    							</s:if>
		    							<s:if test="#que.type=='Multiple'">
		    								<%-- <li>
		    									<button class="btn btn-default btn-xs" data-toggle="modal"
		    										 data-target="#myModal-choosesl" onclick="editQuestion(${que.sid})" >
		    										<i class="fa fa-pencil"></i>
		    								</button>
		    									</li> --%>
		    							    <li><button class="btn btn-default btn-xs" 
		    							    		onclick="deleteQuestion(${que.sid})"><i class="fa fa-times"></i></button>
		    									</li>
		    							
		    							</s:if>
		    							<s:if test="#que.type=='TrueOrFalse'">
		    								<%-- <li>
		    									<button class="btn btn-default btn-xs" data-toggle="modal"
		    									 data-target="#myModal-true-or-flase" onclick="editQuestion(${que.sid})">
		    										<i class="fa fa-pencil"></i>
		    								</button>
		    									</li> --%>
		    							    <li><button class="btn btn-default btn-xs"
		    							    		 onclick="deleteQuestion(${que.sid})"><i class="fa fa-times"></i></button>
		    									</li>
		    							
		    							</s:if>
		    							<s:if test="#que.type=='Fills'">
		    								<%-- <li>
		    									<button class="btn btn-default btn-xs"  onclick="editQuestion(${que.sid})"
		    										data-toggle="modal" data-target="#myModal-fill-and-judgement">
		    										<i class="fa fa-pencil"></i>
		    								</button>
		    									</li> --%>
		    							    <li><button class="btn btn-default btn-xs"
		    							    		 onclick="deleteQuestion(${que.sid})"><i class="fa fa-times"></i></button>
		    									</li>
		    							
		    							</s:if>
		    							<s:if test="#que.type=='Subjective'">
		    								<%-- <li>
		    									<button class="btn btn-default btn-xs"  onclick="editQuestion(${que.sid})"
		    										data-toggle="modal" data-target="#myModal-answer-question">
		    										<i class="fa fa-pencil"></i>
		    								</button>
		    									</li> --%>
		    							    <li><button class="btn btn-default btn-xs"
		    							    		 onclick="deleteQuestion(${que.sid})"><i class="fa fa-times"></i></button>
		    									</li>
		    							
		    							</s:if>
		    							
		    							</ul>
		    						</div>

		    					</div>
		    					<ul>
		    						<li class="question"><h4>${que.title}</h4></li>
		    						<input type="hidden" value='<s:property value="#que.sid"/>'/>
			    					<s:iterator id="queOpt" value="#que.options" status="s2">
			    					<%request.setAttribute("optionLabel", (char)(((org.apache.struts2.views.jsp.IteratorStatus)request.getAttribute("s2")).getIndex()+'A')); %>
			    						
			    						<li>${("Single Multiple TrueOrFalse".indexOf(que.type))>0?optionLabel:(s2.index+1)}. ${queOpt.content}</li>
			    						<li>
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
		
				<!-- 修改单选 模态框-->
				<div class="modal fade" id="myModal-pencil">
				  <div class="modal-dialog">
				    <div class="modal-content">
				 
				      <!-- 模态框头部 -->
				      <div class="modal-header">
				        <h4 class="modal-title">修改题库</h4>
				        <button type="button" class="close close1" data-dismiss="modal">&times;</button>
				      </div>
				 
				      <!-- 模态框主体 -->
				      <div class="modal-body">
				      	<form class="choose" id="s-question">
		    				<ul>
		    				<li id="dry" >题干
		    				<textarea name="question.title" id="question"></textarea></li>	
		    				    <li id="sa">A&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class=" input-pencil form-control " type="text" name="question.content" /></li>
		    				    <li id="sb">B&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="input-pencil form-control " type="text" name="question.content" /></li>
		    				    <li id="sc">C&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="input-pencil form-control " type="text" name="question.content" /></li>
		    				    <li id="sd">D&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="input-pencil form-control " type="text" name="question.content" /></li>
		    				    <li id="answer" class="answerw">答&nbsp;&nbsp;案&nbsp;
		    							<span>A</span><input type="radio" name="question.isAnswer" class="choose1"/>
			    						<span>B</span><input type="radio" name="question.isAnswer" class="choose1"/>
			    						<span>C</span><input type="radio" name="question.isAnswer" class="choose1"/>
			    						<span>D</span><input type="radio" name="question.isAnswer" class="choose1"/>
		    					</li>
		    					
		    				    <li id="knowledge">知识点<input class="input-pencil form-control" type="text" name="question.knowledge"/></li>
		    			    </ul>
		    			 </form>
				 
				      <!-- 模态框底部 -->
				      <div class="modal-footer foot-pencil">
				      	<button type="bttton" class="btn btn-primary check-pencil edit-btn">修改</button>
				        <button type="button" class="btn btn-secondary back-pencil" data-dismiss="modal">关闭</button>
				      </div>
				    </div>
				  </div>
				</div>
			</div>   		
		    		
				<!-- 修改多选 模态框-->
				<div class="modal fade" id="myModal-chooses">
				  <div class="modal-dialog">
				    <div class="modal-content">
				 
				      <!-- 模态框头部 -->
				      <div class="modal-header">
				        <h4 class="modal-title">修改题库</h4>
				        <button type="button" class="close close1" data-dismiss="modal">&times;</button>
				      </div>
				 
				      <!-- 模态框主体 -->
				      <div class="modal-body">
				      	<form class="choose" id="s-question">
		    				<ul>
		    				<li id="dry" >题干
		    				<textarea name="question.title" id="question"></textarea></li>	
		    				    <li id="sa">A&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class=" input-pencil form-control " type="text" name="question.content" /></li>
		    				    <li id="sb">B&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="input-pencil form-control " type="text" name="question.content" /></li>
		    				    <li id="sc">C&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="input-pencil form-control " type="text" name="question.content" /></li>
		    				    <li id="sd">D&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="input-pencil form-control " type="text" name="question.content" /></li>
		    				    <li id="answer" class="answerw">答&nbsp;&nbsp;案&nbsp;
		    							<span>A</span><input type="checkbox" name="question.isAnswer" class="choose1"/>
			    						<span>B</span><input type="checkbox" name="question.isAnswer" class="choose1"/>
			    						<span>C</span><input type="checkbox" name="question.isAnswer" class="choose1"/>
			    						<span>D</span><input type="checkbox" name="question.isAnswer" class="choose1"/>
		    					</li>
		    					
		    				    <li id="knowledge">知识点<input class="input-pencil form-control" type="text" name="question.knowledge"/></li>
		    			    </ul>
		    			 </form>
				 
				      <!-- 模态框底部 -->
				      <div class="modal-footer foot-pencil">
				      	<button type="bttton" class="btn btn-primary check-pencil edit-btn">修改</button>
				        <button type="button" class="btn btn-secondary back-pencil" data-dismiss="modal">关闭</button>
				      </div>
				    </div>
				  </div>
				</div>
			</div>   		
		    		
				<!-- 修改判断模态框-->
				<div class="modal fade" id="myModal-true-or-flase">
				  <div class="modal-dialog">
				    <div class="modal-content">
				 
				      <!-- 模态框头部 -->
				      <div class="modal-header">
				        <h4 class="modal-title">修改题库</h4>
				        <button type="button" class="close close1" data-dismiss="modal">&times;</button>
				      </div>
				 
				      <!-- 模态框主体 -->
				      <div class="modal-body">
				      	<form class="choose" id="s-question">
		    				<ul>
		    				<li id="dry" >题干
		    				<textarea name="question.title" id="question"></textarea></li>	
		    				    <li id="sa">A&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class=" input-pencil form-control " type="text" name="question.content" /></li>
		    				    <li id="sb">B&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="input-pencil form-control " type="text" name="question.content" /></li>
		    				    <li id="answer" class="answerw">答&nbsp;&nbsp;案&nbsp;
		    							<span>A</span><input type="radio" name="question.isAnswer" class="choose1"/>
			    						<span>B</span><input type="radio" name="question.isAnswer" class="choose1"/>
		    					</li>
		    					
		    				    <li id="knowledge">知识点<input class="input-pencil form-control" type="text" name="question.knowledge"/></li>
		    			    </ul>
		    			 </form>
				 
				      <!-- 模态框底部 -->
				      <div class="modal-footer foot-pencil">
				      	<button type="button" class="btn btn-primary check-pencil edit-btn" >修改</button>
				        <button type="button" class="btn btn-secondary back-pencil" data-dismiss="modal">关闭</button>
				      </div>
				    </div>
				  </div>
				</div>
			</div>   		
		
		<!-- 修改填空题模态框 -->
		<div class="modal fade" id="myModal-fill-and-judgement">
		  <div class="modal-dialog">
		    <div class="modal-content">
		 
		      <!-- 模态框头部 -->
		      <div class="modal-header">
		        <h4 class="modal-title">修改题库</h4>
		        <button type="button" class="close close1" data-dismiss="modal">&times;</button>
		      </div>
		 
		      <!-- 模态框主体 -->
		      <div class="modal-body">
		      		<form class="choose" id="fj-question">
	    				<ul>
	    					<li id="dry">
	    					题&nbsp;&nbsp;&nbsp;&nbsp;干&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<textarea name="question.title"></textarea></li>		    					
	    					<li id="answer">答&nbsp;&nbsp;&nbsp;&nbsp;案&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="input-pencil form-control" type="text" name="question.fillsText" /></li>
	    					<li id="knowledge">涉及知识点:<input class="input-pencil form-control" type="text" name="question.knowledge"/></li>
	    				</ul>
		    		</form>
		      </div>
		 
		      <!-- 模态框底部 -->
		      <div class="modal-footer foot-pencil">
		      	<button type="button" class="btn btn-primary check-pencil edit-btn">修改</button>
		        <button type="button" class="btn btn-secondary back-pencil" data-dismiss="modal">关闭</button>
		      </div>
		 
		    </div>
		  </div>
		</div>
	
	<!-- 修改解答题模态框 -->
		<div class="modal fade" id="myModal-answer-question">
		  <div class="modal-dialog">
		    <div class="modal-content">
		 
		      <!-- 模态框头部 -->
		      <div class="modal-header">
		        <h4 class="modal-title">修改题库</h4>
		        <button type="button" class="close close1" data-dismiss="modal">&times;</button>
		      </div>
		 
		      <!-- 模态框主体 -->
		      <div class="modal-body">
		      		<form class="choose" id="fj-question">
	    				<ul>
	    					<li id="dry">
	    					题&nbsp;&nbsp;&nbsp;&nbsp;干&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<textarea name="question.title"></textarea></li>		    					
	    					<li id="answer">答&nbsp;&nbsp;&nbsp;&nbsp;案&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="input-pencil form-control" type="text" name="question.fillsText" /></li>
	    					<li id="knowledge">涉及知识点:<input class="input-pencil form-control" type="text" name="question.knowledge"/></li>
	    				</ul>
		    		</form>
		      </div>
		 
		      <!-- 模态框底部 -->
		      <div class="modal-footer foot-pencil">
		      	<button type="button" class="btn btn-primary check-pencil edit-btn">修改</button>
		        <button type="button" class="btn btn-secondary back-pencil" data-dismiss="modal">关闭</button>
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
		          		<button class="btn btn-primary accept" onclick="window.location='teacher_read.jsp'">接受</button>
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
	<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
		<script type="text/javascript" src="js/popper.min.js" ></script>
		<script type="text/javascript" src="js/bootstrap.min.js"></script>
		<script type="text/javascript" src="js/search.js" ></script>
		<script type="text/javascript" src="js/jsshowpaper.js" ></script>
		<script type="text/javascript" src="js/jquery-confirm.js" ></script>
		<script type="text/javascript" src="js/toastr.js"></script>
		<script type="text/javascript">
		var sid;
		function editQuestion(n) {
			sid = n;
		}
		
		$(".edit-btn").click(function() {
			alert(sid);
		});
		
		var page = 1;
		var key = "";
		var type = "";
		
		function searchKey(s) {
			key = s;
			search();
		}
		
		function searchType(s) {
			type = s;
			search();
		}
		
		function search() {
			location.href = "searchQuestions?page="+page+"&key="+key+"&type="+type;
		}
		
		</script>
	</body>
	
</html>
