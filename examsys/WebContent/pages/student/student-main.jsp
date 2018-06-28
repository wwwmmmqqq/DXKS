<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>首页-考次</title>
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
		    			<a href="javascript:Out()">退出系统</a>
		    		</div>
						</ul>
						
					</div>
				</div>
			</nav>
		</header>
		<div class="main-content">
			<div class="breadcrumb">
				<i class="fa fa-circle-o"></i> 位置：
				<a >首页</a>
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
							<p>Hello, ${session.user.name}</p>
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

						<li data-toggle="modal" data-target="#myinfo"  onclick="showInfo()">
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
										<input type="text" onblur="checkPhone()" id="student_phone" class="form-control" name="user.phone"/>
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
			<button type="button" id="modify-button" class="btn btn-primary" data-dismiss="modal" onclick="modiInfo()">确认修改
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
<script type="text/javascript" src="js/jquery-confirm.js"></script>
<script type="text/javascript" src="js/com.js"></script>
<script type="text/javascript" src="js/toastr.js"></script>


<script type="text/javascript">
$('.user-info').hover(function(){
	$('.dropdown-content').css("display","block")
},function(){
	$('.dropdown-content').css("display","none")
}) 
loadMyExamList(0);
/*加载考次列表*/
function loadMyExamList(page) {
	  $.post("loadMyExamList", {"page":page}, function(data){
		  if(data.result == "did not login") {
			  location.replace('../gy/login.jsp');
		  }
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
		+"					<p>参与学校：<span>"+obj.invitee+"</span></p>"
		+"					<p>考试时间：<span>"+obj.periodStart+" - "+obj.periodEnd+"</span></p>"
		+"				</div>"
		+"			</div>"
		+"		</li>";
	return htm;
}

</script>
</body>
</html>