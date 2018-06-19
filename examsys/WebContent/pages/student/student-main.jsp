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
<title>首页-考次</title>
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/student.css" />
<link rel="stylesheet" href="css/ionicons.min.css" />
<link rel="stylesheet" href="css/font-awesome.min.css" />
</head>
<body>
		<header>
			<nav id="top-nav">
				<div id="main-nav-content">
					<a href="student-index.html" clas="logo">
						<img class="logo-img" src="<%=basePath%>img/logo.png" />
					</a>

					<div class="navbar-right">
						<ul>
							<li class="dropdown user user-menu">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">
									<i class="fa fa-user"></i>
									<span>wmq </span>
								</a>
							</li>
						</ul>
					</div>
				</div>
			</nav>
		</header>
		<div class="main-content">
			<div class="breadcrumb">
				<i class="fa fa-circle-o"></i> 位置：
				<a href="student-index.jsp">首页</a>
				<b>></b>
				<a href="/">在线考试</a>
			</div>
			<section class="left-section">
				<div class="left-menu">
					<div class="user-panel">
						<div class="pull-left image">
							<img src="<%=basePath%>img/user.jpg" class="img-circle" alt="User Image" />
						</div>
						<div class="pull-left info">
							<p>Hello, wmq</p>
							<a href="#"><i class="fa fa-circle text-success"></i> Online</a>
						</div>
					</div>
					<ul class="sider-menu">
						<li class="active">
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
						<li  onclick="javascript:window.location.href='student-exam-score.jsp'">
							<span>
								历史成绩
							</span>
						</li>

						<li data-toggle="modal" data-target="#myinfo">
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
										<input type="text" class="form-control"/>
									</td>
								</tr>
								<tr>
									<td>姓名：</td>
									<td>
										<input type="text" class="form-control"/>
									</td>
								</tr>
								<tr>
									<td>性别：</td>
									<td>
										<input type="text" class="form-control"/>
									</td>
								</tr>
								<tr>
									<td>邮箱：</td>
									<td>
										<input type="text" class="form-control"/>
									</td>
								</tr>
								<tr>
									<td>电话：</td>
									<td>
										<input type="text" class="form-control"/>
									</td>
								</tr>
								<tr>
									<td>密码：</td>
									<td>
										<input type="text" class="form-control"/>
									</td>
								</tr>
								<tr>
									<td>身份证号：</td>
									<td>
										<input type="text" class="form-control"/>
									</td>
								</tr>
								<tr>
									<td>注册日期：</td>
									<td>
										<input type="text" class="form-control"/>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
				<button type="button" id="modify-button"class="btn btn-primary" data-dismiss="modal">确认修改
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
						<div class="exam-title">
							<ul>
								<li class="exam-title-active ">
									待参加的考次
								</li>
							</ul>
						</div>
					</div>
					<div class="student-exam">
						<div class="all-student-exam">
							<ul class="exam-box">
								
							</ul>
						</div>
						<ul class="exam-page pagination pagination-sm">
						<li>
							<a href="#">&laquo;</a>
						</li>
						<li>
							<a href="#">1</a>
						</li>
						<li>
							<a href="#">2</a>
						</li>
						<li>
							<a href="#">3</a>
						</li>
						<li>
							<a href="#">4</a>
						</li>
						<li>
							<a href="#">5</a>
						</li>
						<li>
							<input type="text" class="form-control page-input" />
							<button class=" btn btn-primary fa fa-search sure-search-btn"></button>
						</li>
						<li>
							<a href="#">&raquo;</a>
						</li>
					</ul>
					</div>
				</div>
			</section>
		</div>
		<footer>
	<div class="footer-section">
	</div>
</footer>
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript">
loadMyExamList(0);
/*加载考次列表*/
function loadMyExamList(page) {
	  $.post("loadMyExamList", {"page":page}, function(data){
		  var examList = data.list;
		  var htm = "";
		  for(var i=0;i<examList.length;i++){
			  htm+=getExam(examList[i]);  
		  }
		  $('.exam-box').html(htm);
	  });
}

function getExam(obj){
	var htm=
		"		<li onclick='javascript:location.href=\"student-index.jsp?sid="+obj.sid+"\"'>"
		+"			<div class='exam-type'>"
		+"				<div class='icon paper-picture-qm '>"
		+"				</div>"
		+"				<div class='exam-type-title'>"
		+"					<span>"+obj.title+"</span>"
		+"				</div>"
		+"				<div class='exam-type-info'>"
		+"					<p>参与学校：<span>萍乡学院，南昌大学，湖南大学</span></p>"
		+"					<p>考试时间：<span>"+obj.periodStart+" - "+obj.periodEnd+"</span></p>"
		+"				</div>"
		+"			</div>"
		+"		</li>";
	return htm;
}



</script>
</body>
</html>