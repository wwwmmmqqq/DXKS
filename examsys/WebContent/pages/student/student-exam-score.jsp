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
									<span>${session.user.name} </span>
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
				<a >历史成绩</a>
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
						<li  onclick="javascript:window.location.href='student-all-exam.jsp'">
							<span>
								我的考试
							</span>
						</li>
						<li  class="active">
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
										<input type="text" onblur="checkPhone()" id="student_phone"  class="form-control" name="user.phone"/>
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
				<div class="exam-head">
						<div class="searchbox">
							<form id="">
							
								<div id="search-button">
									<input type="submit" class=" search-button btn btn-primary" value="确认" />
								</div>
								<div id="search-input">
									<input type="text" class="search-input form-control" placeholder="请输入搜索的关键字" />
								</div>
							</form>
						</div>
					</div>
					<div class="score-list">
					<table class="score-table table table-striped " id="score-table">
						<thead>
							<tr>
							<th>序号</th>
							<th>科目名</th>
							<th>总分</th>
							<th>及格分</th>
							<th>我的得分</th>
							<th>正确率</th>
							<th>考试时间</th>
							</tr>
						</thead>
						<tbody>
						
						</tbody>
					</table>
					</div>
					<div class="exam-page">
					<!-- <ul class="pager">
						<li class="previous">
							<a href="javascript:prePage()">&larr; 上一页</a>
						</li>
						<li class="next">
							<a href="javascript:nextPage()">下一页&rarr;</a>
						</li>
					</ul> -->
					</div>
				</div>

			</section>

		</div>
		<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery-confirm.js"></script>
		<script type="text/javascript" src="js/com.js"></script>
		<script type="text/javascript" src="js/toastr.js"></script>
		<script>
	/* 获取我的历史成绩 */
	var paperSid=getParam("sid");
	loadMyHistoryGrades(paperSid);
		function loadMyHistoryGrades(paperSid){
			 $.post("loadMyHistoryGrades", {
				  "paper.sid":paperSid
			  }, function(data) {
				  var scoreList = data.list;
				  var htm = "";
				  for(var i=0;i<scoreList.length;i++) {
					  htm += getMyScore(scoreList[i].paper,scoreList[i].grade,i);
				  }
				  $('#score-table tbody').html(htm);
			  });
		}
		//获取url中的参数
		function getParam(name) {
		  var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i"); //匹配目标参数
		  var result = window.location.search.substr(1).match(reg); //匹配目标参数
		  if (result != null) 
		  	return decodeURIComponent(result[2]);
		  return null;
		}
		function getMyScore(paper,grade,i){
			var htm=
				"<tr>"
			+"<td>"+(i+1)+"</td>"
			+"<td>"+paper.subjectName+"</td>"
			+"<td>"+paper.totalScore+"</td>"
			+"<td>"+paper.totalScore*0.6+"</td>"
			+"<td>"+grade.point+"</td>"
			+"<td>"+Math.floor(grade.point/paper.totalScore * 100)+"%</td>"
			+"<td>"+grade.time+"</td>"
			+"</tr>"
			return htm;
		
		}
		</script>
		
</body>
<script type="text/javascript">
</script>
</html>