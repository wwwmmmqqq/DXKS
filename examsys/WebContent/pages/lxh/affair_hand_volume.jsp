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
		<script type="text/javascript" src="js/affair_hand_volume.js" ></script>
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
		
				<div class="dropdown notice" style="float:right;">
					<button class="dropbtn">
							    			    			<a href="#" class="dropdown-toggle" data-toggle="dropdown">
							    			    				<i class="fa fa-envelope"></i>
							    			    				<span class="label label-success noticelabel"><i></i></span>
							    			    			</a>
							    			    	    </button>
					<div class="dropdown-content">
						<a href="#" data-toggle="modal" data-target="#myModal-invite-notice">邀请通知</a>
						<a href="#" data-toggle="modal" data-target="#myModal-exam-notice">考试通知</a>
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
						<p>Hello, ${session.user.userId}</p>
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
						 <li class="side_nav1">
							<a href="affair_hand_volume.jsp">手动组卷</a>
						</li>
						<li class="side_nav1">
							<a href="affair_intel_volume.jsp">智能组卷</a>
						</li>
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
		    					<a href="affair_index.jsp"><i class="fa fa-home"></i>手动组卷</a>
		    				</li>
		    	
		    			</ul>
		    			<!--breadcrumbs end -->	
		    	</div>
		    	
		    	<!--试题篮 start -->
		    	<div class="basket active" id="J_Basket">
		    		<div class="basket-tit">
		    			<p><i class="fa fa-shopping-cart"></i>试题篮<b class="basket-num" id="subj-amount">0</b>
		    				<span onclick="basketSlide()"><i class="fa fa-hand-o-right"></i></span>
		    			</p>
		    		</div>
		    		<div class="basket-con">
		    			<div class="basket-count">
		    				<div class="basket-head">
		    					共计：（<span id="subject-amount">0</span>）道题
		    				</div>
		    				<div class="baskrt-list">
		    	
		    				</div>
		    			</div>
		    			<div class="basket-foot">
		    				<a id="to-paper-admin-edit" data-method="post" class="basket-btn" href="" style="display: none">编辑</a>
		    				<a id="to-paper-edit" data-method="post" class="basket-btn" href="apaper.jsp">生成试卷</a>
		    				<a id="to-paper-admin-cancel" class="basket-btn" href="" style="display: none">取消</a>
		    			</div>
		    		</div>
		    	</div>
		    
		    	<!--试题篮  end -->
		    	
		    	
		    	<div class="papermanage">
		    	
		    	    <div id="flip"><i class="fa fa-search-minus"></i>条件搜索</div>
		    		<div id="panel">
		    			<form>
		    				<div class="searchpanel">
		    					<ul>
		    						<li id="qtype">
		    							<select id="question_type">
		    							    <option>选择试题类型</option>
		    								<option>单选题</option>
		    								<option>多选题</option>
		    								<option>填空题</option>
		    								<option>判断题</option>
		    								<option>解答题</option>
		    							</select>
		    						</li>	    
		    						<li id="qdiffer"><label>难易程度</label>
		    							<select id="question_difficultValue">
		    								<option>简单</option>
		    								<option>一般</option>
		    								<option>难</option>
		    								<option>较难</option>
		    							</select>
		    						</li>
		    						<li id="qknow"><label>知识点</label>
		    							<input type="text" id="question_knowledge" />
		    						</li>
		    						<li><button type="submit" class="btn btn-default searchbtn" onclick="searchQuestions()"><i class="fa fa-search"></i></button></li>
		    					</ul>		    					
		    				</div>		    		
		    			</form>		
		    		</div>
		    		<!-- 试卷管理 start -->
		    		<div class="panel showpaperpanel">
		    			<header class="panel-heading" >
		    				试题列表
		    			</header>
		    			<div class="panel-body panelbod">
		    				<div class="searchlist">
		    					<ul>
		    					 <s:iterator id="que" value="#request.questionList" status="sta">
		    						<li>
		    							<div class="search-exam">
		    								<div class="exam-head">
		    									<p class="exam-head-left">
		    									    <span>题型：  ${que.type}
		    									             ${(que.type=="Single")?"(单选题)":""}
											                 ${(que.type=="Multiple")?"(多选题)":""}
											                 ${(que.type=="TrueOrFalse")?"(判断题)":""}
										                     ${(que.type=="Fills")?"(填空题)":""}
										                     ${(que.type=="Subjective")?"(解答题)":""}
		    									    </span>
		    									    <i class="line"></i>
		    									    <span>所属科目：${que.subjectRef}</span>
		    									    
		    									    <i class="line"></i>
		    									    <span>难易度： <%-- ${que.difficultValue} --%>
		    									            ${que.difficultyValue==1?"简单":""}
		    								                ${que.difficultyValue==2?"一般":""}
		    							                    ${que.difficultyValue==3?"中等":""}
		    								                ${que.difficultyValue==4?"较难":""}
		    									    </span>
		    									    <i class="line"></i>
		    									    <span>知识点：${que.knowledge}</span>
		    								    </p>
		    								</div>
		    							    <div class="exam-con">
		    							    	<div class="exam-q">
		    							    		
		    							    	</div>
		    							    	<div class="exam-qlist"> 
		    							    		<div class="exam-con">
		    							    			<div class="exam-q">
		    							    				${sta.index}.${que.title}(&nbsp;&nbsp;)
		    							    			</div>
		    							    				
		    							    		    <div class="exam-s">
		    							    		    	    							    		    		    				                        	
		    							    		    <s:iterator id="opt" value="#request.optionList" status="st">
		    							    			 <li>${("Single Multiple TrueOrFalse".indexOf(que.type))>0?optionLabel:(s2.index+1)}. ${queOpt.content}</li>
			    						                 <li>${s2.last?"正确答案：":""}
				    					              	  <span style="color: red;">
				    							           ${("Single Multiple TrueOrFalse".indexOf(que.type)>0 && queOpt.isAnswer==1)?optionLabel:""}
				    							           ${que.type=="Fills"?queOpt.fillsText:""}
				    							           ${que.type=="Subjective"?queOpt.subjectiveText:""}
				    						              </span>
			    						                 </li>
		    							    			</s:iterator>
		    							    		
		    							    			    <%-- <span class="op-item">
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
		    							    			    </span> --%>
		    							    		    </div>
		    							    		</div>
		    							    		<div class="exam-foot">
		    							    			<p class="exam-foot-left">
		    							    				<i class="fa fa-hand-pointer-o"></i>
		    							    				<a class="" href="#">查看解析</a>
		    							    			</p>
		    							    			<p class="exam-foot-right">
		    							    				<button type="button" class="btn btn-primary" id="addtobasket" onclick="addQuestion('${que.type}')">+选题</button>
		    							    			</p>
		    							    		</div>
		    							    	</div>
		    							    </div>
		    							    
		    							</div>
		    						</li>
		    					 </s:iterator>
		    						<%-- <li>
		    							<div class="search-exam">
		    								<div class="exam-head">
		    									<p class="exam-head-left">
		    									    <span>题型：单选题</span>
		    									    <i class="line"></i>
		    									    <span>难易度：简单</span>
		    									    <i class="line"></i>
		    									    <span>知识点：java语言</span>
		    								    </p>
		    								</div>
		    							    <div class="exam-con">
		    							    	<div class="exam-q"> 
		    							    		
		    							    	</div>
		    							    	<div class="exam-qlist"> 
		    							    		<div class="exam-con">
		    							    			<div class="exam-q">
		    							    				1.下列说法正确的是(&nbsp;&nbsp;)
		    							    			</div>
		    							    		
		    							    		    <div class="exam-s">
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
		    							    		<div class="exam-foot">
		    							    			<p class="exam-foot-left">
		    							    				<i class="fa fa-hand-pointer-o"></i>
		    							    				<a class="" href="#">查看解析</a>
		    							    			</p>
		    							    			<p class="exam-foot-right">
		    							    				<button type="button" class="btn btn-primary">+选题</button>
		    							    			</p>
		    							    		</div>
		    							    	</div>
		    							    </div>
		    							    
		    							</div>
		    						</li>
		    						 --%>
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
	    <div class="modal fade" id="myModal-invite-teacher">
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
		
	<script >
	
	function searchQuestions() {
		  $.post("searchQuestions", {
			  "question.type":$('#question_type').val(),//搜索的字段1
			  "question.difficultValue":$('#question_difficultValue').val(),
			  "question.knowledge":$('#question_knowledge').val()//搜索的关键字1
			  
		  }, function(data) {alert("ooo");
			  alert(data.result);
			  alert(data.list);
			 var questionList=data.list; 
		  });
	  }
	
	
	var questionBasketList = [];
	function addQuestion(sid) {
		questionList.push(sid);
	}
	function remove() {
		
	}
	
	
	 function constituteByHand(qids, examStart, examEnd, examName) {
		  //手动组卷接口
		  $.post("createPaperHand", {
			  "examStart":examStart //考试开始
			  ,"examEnd":examEnd //考试结束
			  ,"examName":title //考试名字
			  ,"qids[0]":qids[0]//第一题ID
			  ,"qids[1]":qids[1]//第二题ID
			  ,"qids[2]":qids[2]//第三题ID
			  ,"qids[3]":qids[3]//到总题目数量 的ID 
		  }, function(data) {
			  if("fail" == data.result) {
				  alert("失败");
			  } else {
				  var paperSid = data.result;//返回试卷的ID  
			  }
		  });
	 }
	 
	  function basketSlide(){
		 $('#basketright').hide();
	  }
	</script>
	</body>
</html>
