<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
            <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" />
            <link href="css/ionicons.min.css" rel="stylesheet" type="text/css" />
            <link href='http://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
            <link href="css/jsentryquestions.csss" rel="stylesheet" type="text/css" />
            <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
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
				    				<span>Mary Doe <i class="caret"></i></span>
				    			</a>    		
				    	    </button>
					<div class="dropdown-content">
						<a href="#" data-toggle="modal" data-target="#myModal-information">个人中心</a>
						<a href="#">退出系统</a>
					</div>
				</div>
		
				<div class="dropdown notice">
					<button class="dropbtn">
				    			    			<a href="#" class="dropdown-toggle" data-toggle="dropdown">
				    			    				<i class="fa fa-envelope"></i>
				    			    				<span class="label label-success noticelabel">4</span>
				    			    			</a>
				    			    	    </button>
					<div class="dropdown-content">
						<a href="#" data-toggle="modal" data-target="#myModal-invite-notice">邀请通知</a>
						<a href="#" data-toggle="modal" data-target="#myModal-exam-notice">阅卷通知</a>
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
						<p>Hello, 教师郭</p>
					</div>
				</div>
				<div class="light_bottom">
					<ul class="side_nav">
						<li class="side_nav1">
							<a href="jsshowpaper.html">题库管理 </a>
						</li>
						
						<li class="side_nav1">
							<a href="history_teacher.html">历史成绩</a>
						</li>
						
					</ul>
				</div>
			</nav>
			<!-- sidebar end -->
			
			<div class="cant">
		    	<div class="bred">
		    			<!--breadcrumbs start -->
		    			<ul class="breadcrumb mybread">
		    				<li>
		    					<a href="#"><i class="fa fa-home"></i> Home</a>
		    				</li>
		    				<li>
		    					<a href="#">题库管理</a>
		    				</li>
		    				<li class="active">录入题库</li>
		    			</ul>
		    			<!--breadcrumbs end -->	
		    	</div>
		    	<!--题库录入 start-->
		    	<div class="entryquestions">
		    		<div class="shaixuan">
		    			<ul>
		    				<li>
		    					<select>
		    						<option>请选择题型</option>
		    						<option id="ones">单选题</option>
		    						<option >多选题</option>
		    						<option>判断题</option>
		    						<option>填空题</option>
		    						<option>解答题</option>
		    					</select>
		    				</li>
		    				<li>
		    					<select>
		    						<option>请选择难易程度</option>
		    						<option>简单</option>
		    						<option>一般</option>
		    						<option>难</option>
		    						<option>较难</option>
		    					</select>
		    				</li>
		    				<li>
		    					<select>
		    						<option>请选择所属科目</option>
		    						<option>高数</option>
		    						<option>英语</option>
		    						<option>政治</option>
		    						<option>计算机</option>
		    						<option>物理</option>
		    						<option>化学</option>
		    					</select>
		    				</li>
		    			</ul>
		    		</div>
		    		
		    		<!--单、多选题录入 start-->
		    		<div class="entry">
		    			<ul>
		    				<li>题目:<textarea></textarea></li>
		    				<li id="sa">选项A&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="form-control" type="text" id="" /></li>
		    				<li id="sb">选项B&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="form-control" type="text" id="" /></li>
		    				<li id="sc">选项C&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="form-control" type="text" id="" /></li>
		    				<li id="sd">选项D&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="form-control" type="text" id="" /></li>
		    				<li>答&nbsp;&nbsp;案:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="form-control" type="text" /></li>
		    				<li>涉及知识点:<input class="form-control" type="text" /></li>
		    				<li>解析:<textarea class="" id=""></textarea></li>	 
		    			</ul>
		    			<!--单、多选题录入 end-->
		    			
		    			<!--填空、判断题录入 start-->
		    			<!--<ul>
		    				<li>题目：<textarea></textarea> </li>
		    				<li>答案：<input type="text"  /></li>
		    				<li>涉及知识点：<input type="text" /></li>
		    				<li>解析：<textarea class="" id=""></textarea></li>		    			
		    			</ul>-->
		    			<!--填空、判断题录入 end-->
		    			
		    			<!--解答题录入 start-->
		    			<!--<ul>
		    				<li>题目：<textarea></textarea></li>
		    				<li>答案：<textarea></textarea></li>
		    				<li>涉及知识点：<input type="text" /></li>
		    				<li>解析：<textarea class="" id=""></textarea></li>			    			
		    			</ul>-->
		    			<button type="submit" class="btn btn-primary">提交</button>
		    		</div>
		    		<!--解答题录入 end-->
		    		
		    	</div>
		    	<!--题库录入 end-->
		    </div>	
	</body>
</html>
