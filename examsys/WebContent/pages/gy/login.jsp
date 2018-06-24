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
		<meta charset="UTF-8">
		<link rel="stylesheet" href="css/gy_login.css" />
		<link rel="stylesheet" href="css/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css"/>
		<link rel="stylesheet" href="css/ionicons.min.css" />
		
		<title></title>
	</head>
	<body>
		<div class="all">
			<div class="header">
				<div class="header_center">
					<img src="img/logo.png" class="header_logo">
					<img src="img/login.png" class="header_right">
				</div>
			</div>
			<div class="main">
				<!--<img src="img/login_left.jpg"  class="img_left"/>-->
				<!--登录-->
				<div class="title_line">
					<span class="tit" style="font-size: 38px;">登录</span>
				</div>
				
				<!--整体-->
				<div class="login_box clearfix">
					<div class="login_left">
						<img src="img/login_left.jpg"  class="img_left"/>
					</div>
					<div class="login_right">
						<input type="text" id="userId" class="form-control input_name" placeholder="请输入你的用户名" name="user.userId"/>
						<div class="input_bottom">
							<input type="password"  id="password" class="form-control input_password" placeholder="请输入你密码" name="user.psw"/>
						</div>
						<div class="input_checkbox">
							<!-- <input type="radio" name="1" id="admin" value="管理员"/>
							<span>管理员</span>
							<input type="radio" name="1" id="administration" value="教务"/>
							<span>教务</span>
							<input type="radio" name="1" id="teacher" value="教师"/>
							<span>教师</span>
							<input type="radio" name="1" id="student" value="学生"/>
							<span>学生</span> -->
						</div>
						<div class="yzm">
							<input name="XuasYzm" size="9" maxlength="5" class="form-control input_yzm">
							<div >
								<a href='javascript:refreshimg()' title='看不清楚，换个图片' ><img class="img_yzm" id='checkcode' src="http://www.cnhww.com/demo5/GetCode.asp " border="0" /></a>
							</div>
						</div>
						
						<div class="btn_bottom">
							<button type="button" class="btn btn-primary btn_login" onclick="login();">登录</button>
						</div>
					</div>
				</div>
			</div>
			
		</div>
		<script type="text/javascript" src="js/jquery-3.2.1.min.js" ></script>
		<script type="text/javascript" src="js/bootstrap.min.js" ></script>
		<script src="https://cdn.bootcss.com/popper.js/1.12.5/umd/popper.min.js"></script>
		<script type="text/javascript">
		function login() {
			var Id = $('#userId').val();
			var password = $('#password').val();
			//var studentType = $('#student').val();
			//var teacherType = $('#teacher').val();
			//var administrationType = $('#administration').val();
			//var adminType = $('#admin').val();
			if (Id=="" || password=="") {
				alert("请输入信息");
				return false;
			} else { 
				$.post("login",{"user.userId":Id,"user.psw":password},function(data) {
					var user = data.user;
				 	if(data.result=="未找到该账号！" ||data.result=="密码错误！" ){
				 		alert(data.result);
				 		return false;
				 	}
					if(user.type=="学生") {
						window.location.href = "../student/student-main.jsp";
					} else if(user.type=="教师") {
						window.location.href = "../gy/showItemBankListByUserJump";
					} else if(user.type=="教务") {
						window.location.href = "../lxh/affair_index.jsp";
					 }
					else if(user.type=="管理员") {
						window.location.href = "../gy/admin.jsp";
				 	}
				});
			}
		}
	</script>
	</body>

</html>
