<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="css/rigister.css" />
		<link rel="stylesheet" href="css/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css"/>
		<link rel="stylesheet" href="css/ionicons.min.css" />
		<script type="text/javascript" src="js/rigister.js" ></script>
		<script type="text/javascript" src="js/jquery-3.2.1.min.js" ></script>
		<script type="text/javascript" src="js/bootstrap.min.js" ></script>
		<script src="js/popper.min.js"></script>
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
				<!--注册-->
				<div class="title_line">
					<span class="tit" style="font-size: 38px;">注册</span>
				</div>
				
				<!--整体-->
				<div class="login_box clearfix">
					<div class="login_left">
						<img src="img/login_left.jpg"  class="img_left"/>
					</div>
					<div class="login_right">
						<input type="text" class="form-control input_name" placeholder="请输入用户名"/>
						<div class="input_bottom">
							<input type="text" class="form-control input_password" placeholder="请输入密码"/>
						</div>
						<div class="input_bottom">
							<input type="text" class="form-control input_password" placeholder="确认密码"/>
						</div>
						<div class="input_bottom">
							<input type="text" class="form-control input_password" placeholder="请输入邮箱密码"/>
						</div>
						
						<div class="yzm">
							<input name="XuasYzm" size="9" maxlength="5" class="form-control input_yzm">
							<div>
								<a href='javascript:refreshimg()' title='看不清楚，换个图片' ><img class="img_yzm" id='checkcode' src="http://www.cnhww.com/demo5/GetCode.asp" border="0" /></a>
							</div>
						</div>
						
						<div class="btn_bottom">
							<button type="button" class="btn btn-primary btn_login">注册</button>
						</div>
					</div>
				</div>
			</div>
			
		</div>
	</body>
	<script type="text/javascript" src="js/login.js" ></script>
</html>
