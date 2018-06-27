<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="s" uri="/struts-tags" %>
    <% String path=request.getContextPath();
   String basePath=request.getScheme() + "://" +request.getServerName() + ":" +request.getServerPort() + path + "/";
%>
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
         <link rel="stylesheet" href="css/inviteSchool.css" />
		<link href='http://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
		<!-- Theme style -->
		<link href="css/lxhstyle.css" rel="stylesheet" type="text/css" />
		<link href="css/toastr.css" rel="stylesheet" type="text/css" />
		
		
		<style type="text/css">
		input {text-align: center;}
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
							<li class="side_nav1">
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
							<li class="side_nav1 now">
								考次计划
							</li>
						</a>
		    		</ul>
				</div>
			</nav>
			<!-- sidebar end -->
			<!-- container start -->
			<div class="cant">
				<div class="bred">
					<!--breadcrumbs start -->
					<ul class="breadcrumb mybread">
						<li>
							<a href="affair_index.jsp"><i class="fa fa-home"></i> Home</a>
						</li>
						<!--<li>
		    					<a href="#">Dashboard</a>
		    				</li>-->
						<li class="active">智能组卷</li>
					</ul>
					<!--breadcrumbs end -->
				</div>
				<section class="papermanage">
					<!-- 智能组卷 start-->
					<div>
						<input type="text" id="title" placeholder="输入试卷标题" />
						 <input type="text" id="startTime" placeholder="输入开始时间" />
						<input type="text" id="endTime" placeholder="输入结束时间" />
						<select id="subjectSel" onchange="loadDiffCounts()">
							<optgroup label="选择科目" id="subjectOpts"></optgroup>
						</select>
						<select id="teacherSels">
							<optgroup label="指定解答题批改老师" id="teacherOptions">
							
							</optgroup>
						</select>
					</div>
						<div class="autocompose">
							<table class="table table-hover mytable">
								<thead>
									<tr>
										<th>题型</th>
										<th>题库题量</th>
										<th>设置题量</th>
										<th>难度占比</th>
										<th>题量</th>
										<th>每题分值</th>
										<th>合计（分值）</th>
									</tr>
								</thead>
								<tbody>
									<s:iterator id="item" value="{'单选题','多选题','判断题','填空题','主观题'}" status="st">
										<tr id="type${st.index}">
											<td id="qtype">${item}</td>
											<td id="leamount${st.index+1}" class="hasCount">共0题</td>
											<td id="qmount"><input type="text" id="count" value="0" onchange="setCount(${st.index}, this.value)"/> 题</td>
											<td>
												<span>简单<input type="text" id="diffPercent${st.index}1" value="0" onchange="setTypeDiffPercent(${st.index}, 0, this.value)"/>%</span>
												<span>一般<input type="text" id="diffPercent${st.index}2" value="0" onchange="setTypeDiffPercent(${st.index}, 1, this.value)"/>%</span>
												<span>中等<input type="text" id="diffPercent${st.index}3" value="0" onchange="setTypeDiffPercent(${st.index}, 2, this.value)"/>%</span>
												<span>难题<input type="text" id="diffPercent${st.index}4" value="0" onchange="setTypeDiffPercent(${st.index}, 3, this.value)"/>%</span>
												<span id='diff_total_percent${st.index}'>还差100%</span>
											</td>
											<td>
												<div>
													<span style="line-height: 180%" id="count_diff${st.index}0">0</span>
													<span style="line-height: 180%" id="count_diff${st.index}1">0</span>
													<span style="line-height: 180%" id="count_diff${st.index}2">0</span>
													<span style="line-height: 180%" id="count_diff${st.index}3">0</span>
												</div>
											</td>
											<td>
												<div>
													<span>每题<input type="text" id="diff0point" value="0" onchange="setTypeDiffPoint(${st.index}, 0, this.value)"/>分</span>
													<span>每题<input type="text" id="diff1point" value="0" onchange="setTypeDiffPoint(${st.index}, 1, this.value)"/>分</span>
													<span>每题<input type="text" id="diff2point" value="0" onchange="setTypeDiffPoint(${st.index}, 2, this.value)"/>分</span>
													<span>每题<input type="text" id="diff3point" value="0" onchange="setTypeDiffPoint(${st.index}, 3, this.value)"/>分</span>
												</div>
											</td>
											<td id="leamark" class="leamark">0</td>
										</tr> 
									</s:iterator>
								</tbody>
							</table>
						
							<p style="text-align: center;">
								<button type="submit" class="btn btn-primary" id="submitBtn">生成试卷并预览</button></p>
						</div>
					</section>
					<!-- 智能组卷 end-->
		
	
		<!-- container end -->
		</section>

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
<script type="text/javascript" src="js/jquery-3.2.1.min.js" ></script>
		<script type="text/javascript" src="js/bootstrap.min.js" ></script>
		<script type="text/javascript" src="js/toastr.js"></script>
</body>
<script type="text/javascript">
function getParam(name) {
	var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i"); //匹配目标参数
	var result = window.location.search.substr(1).match(reg); //匹配目标参数
	if (result != null) 
		return decodeURIComponent(result[2]);
	return null;
}
var examSid = getParam("exam.sid");//拿到考次
</script>
<script type="text/javascript">
var type_count = [0, 0, 0, 0, 0];
function loadDiffCounts() {
	$.post("loadQuestionCountByType", {
		"paper.subjectRef":subjectSel.value
	}, function(data) {
		for(var i=0;i<data.countListMap.length;i++) {
			type_count[i] = data.countListMap[i]["count"];
			$("#leamount" + (i+1)).text("共"+type_count[i] + "题");
		}
		if(data.countListMap.length == 0) {
			for(var i=0;i<5;i++) {
				$("#leamount" + (i+1)).text("共0题");
			}
		}
 	});
}
</script>

<script>
var type_set_count = [0,0,0,0,0];
var type_diff_percent = [[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0]];
var type_diff_point = [[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0]];
function setCount(typeIndex, value) {
	type_set_count[typeIndex] = Number(value);
	updateShows(typeIndex);
}

function setTypeDiffPercent(typeIndex, diff, value) {
	type_diff_percent[typeIndex][diff] = Number(value);
	var pvalue = 0;
	for(var i = 0;i<type_diff_percent[typeIndex].length;i++) 
		pvalue += type_diff_percent[typeIndex][i];
	if(pvalue>100) {
		$("#type"+typeIndex).find("#diff_total_percent"+typeIndex).text("还差" + (100-pvalue) + "%");
		$("#diff_total_percent" + typeIndex).css({"color":"red"});
		toastr.warning("超出范围");
	} else if(pvalue<100) {
		$("#type"+typeIndex).find("#diff_total_percent"+typeIndex).text("还差" + (100-pvalue) + "%");
		$("#diff_total_percent" + typeIndex).css({"color":"orange"});
	} else {
		$("#type"+typeIndex).find("#diff_total_percent"+typeIndex).text("");
	}
	updateShows(typeIndex);
}

function setTypeDiffPoint(typeIndex, diff, value) {
	type_diff_point[typeIndex][diff] = Number(value);
	updateShows(typeIndex);
}


function updateShows(typeIndex) {
	for(var i=0;i<type_diff_percent[typeIndex].length;i++) {
		var val = type_set_count[typeIndex] * type_diff_percent[typeIndex][i] / 100;
		$("#type"+typeIndex).find("#count_diff"+typeIndex+i).text(Math.floor(val));
	}
	
	var typeScoreVal = 0;
	for(var i=0;i<type_diff_point[typeIndex].length;i++) {
		typeScoreVal += Number(type_diff_point[typeIndex][i])
			* Number(type_diff_percent[typeIndex][i] * type_set_count[typeIndex]) / 100;
	}
	$("#type"+typeIndex).find(".leamark").text(typeScoreVal);
}


$('tr input').click(function() {
	if($(this).val() == '0') {
		$(this).val("");
	}
})
$('tr input').blur(function() {
	if($(this).val() == '') {
		$(this).val("0");
	}
	if(isNaN($(this).val())) {
		toastr.error("非数字");
		$(this).val("0");
		$(this).facus();
	}
})
</script>
<script type="text/javascript">
function createPaperAutoParams(examRef, subjectRef, name, examStart, examEnd, responser) {
	var params = {
			  "paper.examRef":examRef //考试ID
			, "paper.subjectRef":subjectRef //考试ID
			, "paper.name":name //试卷标题名
			, "paper.examStart":examStart //考试开始时间
			, "paper.examEnd":examEnd //考试结束时间
			, "responser": responser
	};
	var types = ["single", "multiple", "trueOrFalse", "fills", "subjective"];
	for(var i=0;i<types.length;i++) {
		params[types[i] + ".count"] = type_set_count[i];
		for(var j=0;j<type_diff_percent[i].length;j++) {
			params[types[i] + ".diff" + (j+1) + "Percent"] = type_diff_percent[i][j];
		}
		for(var j=0;j<type_diff_point[i].length;j++) {
			params[types[i] + ".diff" + (j+1) + "Point"] = type_diff_point[i][j];
		}
	}
	return params;
}

//var newPaperSid = -1;
$('#submitBtn').bind().click(function() {
	var params = createPaperAutoParams(examSid, subjectSel.value, $("#title").val()
					, $("#startTime").val(), $("#endTime").val(), $("#teacherSels").val());
	$.post("createPaperAuto", params, function(data) {
		if(data.result != 'fail') {
			toastr.success("组卷成功，准备跳转到开始测试页面，试卷ID" + data.result);
			//newPaperSid = data.result;
			//$("#submitBtn").get(0).innerText = "不满意生成的试卷"+newPaperSid+"，重新组卷";
			window.open("loadAPaper?paper.sid=" + data.result);     
		}
	});
	//window.open('apaper.html')
});
</script>

<script type="text/javascript">
loadSubjects();
function loadSubjects() {
	$.post("loadSubjects", null, function(data) {
		var li = data.list;
		for(var i=0;i<li.length;i++) {
			var opt = document.createElement("option");
			opt.value = li[i].sid;
			opt.innerText = li[i].name;
			subjectOpts.appendChild(opt);
		}
		loadDiffCounts();
	});
}

loadTeachers();
function loadTeachers() {
	$.post("loadTeachers", null, function(data) {
		var li = data.list;
		for(var i=0;i<li.length;i++) {
			var opt = document.createElement("option");
			opt.value = li[i].userId;
			opt.innerText = li[i].name;
			teacherOptions.appendChild(opt);
		}
	});
}

</script>
<script type="text/javascript" src="js/school.js"></script>
<script type="text/javascript" src="js/inviteSchool.js" ></script>
</html>