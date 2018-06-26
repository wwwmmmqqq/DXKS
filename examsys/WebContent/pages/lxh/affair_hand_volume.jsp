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
		
		<script type="text/javascript" src="js/array.js"></script>
		<style type="text/css">
		.little-box {
   			width: 25px;height:25px;line-height:25px;border: 1px solid rgba(100,100,100,0.5);
   			cursor: pointer;
   			color: gray;float: left;
   			text-align: center;
   		}
   		.little-box:hover{background-color: rgba(100,100,100,0.5);}
		</style>
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
						<!-- <a href="#" data-toggle="modal" data-target="#myModal-invite-school">邀请学校考试</a> -->
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
						<!--  <li class="side_nav1">
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
		    				<div class="baskrt-list" style="overflow: auto;max-height: 100px;">
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
		    	
		    	    <div id="flip"><i class="fa fa-search-minus">
		    	    </i>条件搜索</div>
		    		<div id="panel">
	    				<div class="searchpanel" style="float: left;">
	    					<ul>
	    						<li id="qtype">
	    							<label>题目类型</label>
	    							<select id="typeSels" onchange="selType(this.value)">
	    							    <optgroup label="选择试题类型">
		    								<option value="">全部</option>
		    								<option value="Single">单选题</option>
		    								<option value="Multiple">多选题</option>
		    								<option value="Fills">填空题</option>
		    								<option value="TrueOrFalse">判断题</option>
		    								<option value="Subjective">解答题</option>
	    								</optgroup>
	    							</select>
	    						</li>	    
	    						<li id="qdiffer"><label>难易程度</label>
	    							<select id="difficultValueSels" onchange="selDiff(this.value)">
	    								<optgroup label="题目难度筛选">
	    									<option value="">全部</option>
		    								<option value="1">简单</option>
		    								<option value="2">一般</option>
		    								<option value="3">难</option>
		    								<option value="4">较难</option>
	    								</optgroup>
	    							</select>
	    						</li>
	    						<li id="qdiffer"><label>科目</label>
	    							<select id="subjectSels" onchange="selSubject(this.value)">
	    								<optgroup label="科目" id="subjectGroup">
	    									<option value="">全部</option>
	    								</optgroup>
	    							</select>
	    						</li>
	    						<li id="qknow">
	    							<label>题目标题</label>
	    							<input type="text" id="titleIpt" onchange="selTitle(this.value)" />
	    						</li>
	    						<li id="qknow">
	    							<label>知识点</label>
	    							<input type="text" id="knowledgeIpt" onchange="selKnowledge(this.value)" />
	    						</li>
	    						<li><button type="submit" class="btn btn-default searchbtn" 
	    							onclick="doSearch()"><i class="fa fa-search"></i></button>
	    						</li>
	    					</ul>
	    				</div>
		    		</div>
		    		
		    		<script type="text/javascript">
		    		
		    		var questionIds = [];
		    		
		    		var type = "Single";
		    		var diff = "";
		    		var subject = "";
		    		var title = "";
		    		var knowledge = "";
		    		var jsons = {
		    			"examSid":"${examSid}",
		    			"keys[0]":"type",
		    			"keys[1]":"difficultyValue",
		    			"keys[2]":"subjectRef",
		    			"keys[3]":"title",
		    			"keys[4]":"knowledge",
		    			"vals[0]":type,
		    			"vals[1]":diff,
		    			"vals[2]":subject,
		    			"vals[3]":title,
		    			"vals[4]":knowledge
		    		};
		    		function selType(s) {
		    			type = s;
		    			jsons["vals[0]"] = s;
		    			doSearch();
		    		}
		    		function selDiff(s) {
		    			diff = s;
		    			jsons["vals[1]"] = s;
		    			doSearch();
		    		}
		    		function selSubject(n) {
		    			subject = n;
		    			jsons["vals[2]"] = n;
		    			doSearch();
		    		}
		    		function selTitle(s) {
		    			title = s;
		    			jsons["vals[3]"] = s;
		    			doSearch();
		    		}
		    		function selKnowledge(s) {
		    			knowledge = s;
		    			jsons["vals[4]"] = s;
		    			doSearch();
		    		}
		    		doSearch();
		    		function doSearch() {
		    			$.post("searchQuestionsHandConstitute",jsons, function(data) {
		    				var li = data.list;
		    				var htmls = "";
		    				for(var i=0;i<li.length;i++) {
		    					htmls += getItemHtm(li[i]);
		    				}
		    				$("#question-box").html(htmls);
		    			});
		    		}
		    		
		    		loadSubjects();
		    		function loadSubjects() {
		    			$.post("loadSubjects", null, function(data) {
		    				var li = data.list;
		    				for(var i=0;i<li.length;i++) {
		    					var opt = document.createElement("option");
		    					opt.value = li[i].sid;
		    					opt.innerText = li[i].name;
		    					subjectGroup.appendChild(opt);
		    				}
		    				loadDiffCounts();
		    			});
		    		}
		    		
		    		function getItemHtm(q) {
		    			var options = q.options;
		    			var optHtmls = "";
		    			var answer = "";
		    			for(var i=0;i<options.length;i++) {
		    				var label = String.fromCharCode("A".charCodeAt() + i);
		    				if("Fills Subjective TrueOrFalse".indexOf(q.type)>=0) {
		    					label = i+1;
		    					if("Fills" == q.type) {
		    						answer = options[i].fillsText;
		    					} else if("Subjective" == q.type) {
		    						answer = options[i].subjectiveText;
		    					} else if("TrueOrFalse" == q.type) {
		    						answer = options[i].isAnswer=='1'?"正确":"错误";
		    					}
		    				}else if(options[i].isAswer) {
		    					answer += label;
		    				}
		    				optHtmls += "<span class='op-item'>"
		    						+"		<span>"+label+".</span>"
		    						+"		<span>"+options[i].content+"</span>"
		    						+"	 </span>";
		    			}
		    			
		    			var diffText = ["","简单","一般","中等","较难"][q.difficultyValue];
		    			var questionTypeName = {
		    					"Single":"单选题",
		    					"Multiple":"多选题",
		    					"Fills":"填空题",
		    					"TrueOrFalse":"判断题",
		    					"Subjective":"解答题"
		    				}[q.type];
		    			var cssstyle = "";
		    			var btnText = "加选题";
		    			if(questionIds.contains(q.sid)) {
		    				cssstyle = "style='background-color:green;border-color:green'";
		    				btnText = "减选题";
		    			}
		    			var htm = "<li id='q-item-"+q.sid+"' class='q-item-class'>"
		    				+"	<div class='search-exam'>"
		    				+"		<div class='exam-head'>"
		    				+"			<p class='exam-head-left'>"
		    				+"				<span>题型："+questionTypeName+"</span>"
		    				+"				<i class='line'></i>"
		    				+"				<span>难易度："+diffText+"</span>"
		    				+"				<i class='line'></i>"
		    				+"				<span>知识点："+q.knowledge+"</span>"
		    				+"			</p>"
		    				+"		</div>"
		    				+"		<div class='exam-con'>"
		    				+"			<div class='exam-q'></div>"
		    				+"			<div class='exam-qlist'>"
		    				+"				<div class='exam-con'>"
		    				+"					<div class='exam-q'>"
		    				+"						"+(q.sid)+"."+q.title+"(&nbsp;&nbsp;)"
		    				+"					</div>"
		    				+"					<div class='exam-s'>"
		    				+ optHtmls
		    				+"					</div>"
		    				+"				</div>"
		    				+"				<div class='exam-foot'>"
		    				+"					<p class='exam-foot-left'>"
		    				+"						<i class='fa fa-hand-pointer-o'></i>"
		    				+"						<a href='javascript:void(0)'>答案："+answer+"</a>"
		    				+"					</p>"
		    				+"					<p class='exam-foot-right'>"
		    				+"						<button type='button' class='btn btn-primary' "+cssstyle+" onclick='addQuestion(this, "+q.sid+")'>"+btnText+"</button>"
		    				+"					</p>"
		    				+"				</div>"
		    				+"			</div>"
		    				+"		</div>"
		    				+"	</div>"
		    				+"</li>";
		    				return htm;
		    		}
		    		
		    		
		    		function addQuestion(self, n) {
		    			if(!questionIds.contains(n)) {
		    				questionIds.push(n);
		    				$(self).css({
		    					"background-color":"green"
		    					,"border-color":"green"
		    				});
		    				$(self).text("减选题");
			    			$("#choosedQuestionBox").html($("#choosedQuestionBox").html() + $("#q-item-" + n).get(0).outerHTML);
			    			$("#choosedQuestionBox").find("#q-item-" + n).hide();
		    			} else {
		    				questionIds.remove(n);
		    				$(self).css({
		    					"background-color":"#428bca"
		    					,"border-color":"#357ebd"
		    				});
		    				$(self).text("加选题");
		    				$("#choosedQuestionBox").find("#q-item-" + n).remove();
		    			}
		    			
		    			$("#subj-amount").text(questionIds.length);
		    			$("#subject-amount").text(questionIds.length);
		    			var basketHtml = "";
		    			for(var i=0;i<questionIds.length;i++) {
		    				basketHtml += "<div class='little-box'>"+questionIds[i]+"</div>";
		    			}
		    			$(".baskrt-list").html(basketHtml);
		    			
		    			
		    			$(".little-box").hover(function() {
			    			$("#q-item-" + $(this).text()).show();
			    		}, function() {
			    			$("#q-item-" + $(this).text()).hide();
			    		});
		    			
		    		}
		    		
		    		
		    		function submitHandVolume() {
		    			$("createPaperHand", {
		    				
		    			}, function(data) {
		    				
		    			});
		    		}
		    		</script>
		    		<!-- 试卷管理 start -->
		    		<div class="panel showpaperpanel">
		    			<header class="panel-heading" >
		    				试题列表
		    			</header>
		    			<div class="panel-body panelbod">
		    				<div class="searchlist">
		    					<div id="choosedQuestionBox"></div>
		    					<ul id="question-box">
		    						<li>
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
		    							    	<div class="exam-q"></div>
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
		    							    		    </div>
		    							    		</div>
		    							    		<div class="exam-foot">
		    							    			<p class="exam-foot-left">
		    							    				<i class="fa fa-hand-pointer-o"></i>
		    							    				<a href="javascript:void(0)">答案：</a>
		    							    			</p>
		    							    			<p class="exam-foot-right">
		    							    				<button type="button" class="btn btn-primary" onclick="addQuestion(this, 0)" >+选题</button>
		    							    			</p>
		    							    		</div>
		    							    	</div>
		    							    </div>
		    							</div>
		    						</li>
		    					
		    					 <%-- <s:iterator id="que" value="#request.list" status="sta">
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
		    									    <span>难易度： ${que.difficultValue}
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
		    							    				<button type="button" class="btn btn-primary" id="addtobasket" onclick="addQuestion('${que.type}')">+选题</button>
		    							    			</p>
		    							    		</div>
		    							    	</div>
		    							    </div>
		    							    
		    							</div>
		    						</li>
		    					 </s:iterator> --%>
		    						
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
	/* 
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
	 */
	
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
