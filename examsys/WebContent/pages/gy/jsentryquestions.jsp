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
			<title></title>
			<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
            <meta name="description" content="Developed By M Abdur Rokib Promy">
            <meta name="keywords" content="Admin, Bootstrap 3, Template, Theme, Responsive">               
            <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
            <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" />
            <link href="css/ionicons.min.css" rel="stylesheet" type="text/css" />
            <link href='http://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
            <link href="css/lxhstyle1.css" rel="stylesheet" type="text/css" />
            <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
            <script type="text/javascript" src="js/jsentryquestions.js" ></script>
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
<<<<<<< HEAD
				    				<span>teacher <i class="caret"></i></span>
=======
				    				<span>Mary Doe <i class="caret"></i></span>
>>>>>>> origin/gy
				    			</a>    		
				    	    </button>
					<div class="dropdown-content">
						<a href="#" data-toggle="modal" data-target="#myModal-information">个人中心</a>
<<<<<<< HEAD
						<a href="#" >修改密码</a>
						<a href="#" onclick="myFunction()" value="退出系统">退出系统</a>
=======
						<a href="#">退出系统</a>
>>>>>>> origin/gy
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
<<<<<<< HEAD
							<a href="#" data-toggle="modal" data-target="#myModal-email">邀请通知</a>
							<a href="#" data-toggle="modal" data-target="#myModal_read">阅卷通知</a>
=======
						<a href="#" data-toggle="modal" data-target="#myModal-invite-notice">邀请通知</a>
						<a href="#" data-toggle="modal" data-target="#myModal-exam-notice">阅卷通知</a>
>>>>>>> origin/gy
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
<<<<<<< HEAD
					<a href="jsshowpaper.jsp"><li class="side_nav1 now">题库管理</li></a>
					<a href="history_teacher.jsp"><li class="side_nav1 ">查看成绩</li></a>
					<a href="teacher_read.jsp"><li class="side_nav1 ">批阅试卷</li></a>
				</ul>
=======
						<a href="jsshowpaper.jsp"><li class="side_nav1 now">题库管理</li></a>
						<a href="history_teacher.jsp"><li class="side_nav1 n">查看成绩</li></a>
						<a href="teacher_read.jsp"><li class="side_nav1 ">查看成绩</li></a>
						
					</ul>
>>>>>>> origin/gy
				</div>
			</nav>
			<!-- sidebar end -->
			
			<div class="cant">
		    	<div class="bred">
		    			<!--breadcrumbs start -->
		    			<ul class="breadcrumb mybread">
		    				<li>
		    					<a href="jsshowpaper.jsp"><i class="fa fa-home"></i> Home</a>
		    				</li>
		    				<li>
		    					<a href="jsshowpaper.jsp">题库管理</a>
		    				</li>
		    				<li class="active">录入题库</li>
		    			</ul>
		    			<!--breadcrumbs end -->	
		    	</div>
		    	<!--题库录入 start-->
		    	<div class="entryquestions">
		    		<div class="shaixuan">
		    			<ul>
		    				<li><button type="button" class="btn btn-danger newq">+新题目</button>
		    					<form>请选择题目类型 ：
<<<<<<< HEAD
		    						<input type="radio" name="radio" id="single-choice" value="single-choice" checked="checked" /><label>单选题</label>
		    						<input type="radio" name="radio" id="mutiple-choice" /><label>多选题</label>
		    						<input type="radio" name="radio" id="ture-or-false" /><label>判断题</label>
		    						<input type="radio" name="radio" id="fill-in"/><label>填空题</label>
		    						<input type="radio" name="radio" id="answer-questions"/><label>解答题</label>
=======
		    						<input type="radio"  id="single-choice" value="single-choice" name="1" checked="checked"/><label>单选题</label>
		    						<input type="radio"  id="mutiple-choice"  name="1"/><label>多选题</label>
		    						<input type="radio"  id="ture-or-false"  name="1"/><label>判断题</label>
		    						<input type="radio"  id="fill-in" name="1"/><label>填空题</label>
		    						<input type="radio"  id="answer-questions" name="1"/><label>解答题</label>
>>>>>>> origin/gy
		    					</form>
		    					
		    					<!--<select>
		    						<option>请选择题型</option>
		    						<option id="single-choice">单选题</option>
		    						<option id="mutiple-choice">多选题</option>
		    						<option id="ture-or-false">判断题</option>
		    						<option id="fill-in">填空题</option>
		    						<option id="answer-questions">解答题</option>
		    					</select>-->
		    				</li>
		    				<li>请选择科目：
		    					<select>
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
		    		<div class="entry">
<<<<<<< HEAD
		    			<!--单、多选题录入 start-->
		    			<div class="choices">
		    				<ul>
		    				    <li id="dry">题干:<textarea></textarea></li>
		    				    <li id="sa">选项A&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="form-control" type="text" id="" /></li>
		    				    <li id="sb">选项B&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="form-control" type="text" id="" /></li>
		    				    <li id="sc">选项C&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="form-control" type="text" id="" /></li>
		    				    <li id="sd">选项D&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="form-control" type="text" id="" /></li>
		    				    <li id="answer">答&nbsp;&nbsp;案:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="form-control" type="text" /></li>
		    				    <li id="knowledge">涉及知识点:<input class="form-control" type="text" /></li>
		    				    <li id="resolve">解析:<textarea ></textarea></li>	 
		    			    </ul>
		    			</div>		    		
		    			<!--单、多选题录入 end-->
=======
		    			<!--单选题录入 start-->
		    			<div class="choices">
		    				<ul>
		    				<li id="dry">题干<br><textarea></textarea></li>	
		    				    <li id="sa">A&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="form-control " type="text" id="" /></li>
		    				    <li id="sb">B&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="form-control " type="text" id="" /></li>
		    				    <li id="sc">C&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="form-control " type="text" id="" /></li>
		    				    <li id="sd">D&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="form-control " type="text" id="" /></li>
		    				    <li id="answer" class="answerw">答&nbsp;&nbsp;案&nbsp;
	    							<form class="choose">
		    							<span>A</span><input type="checkbox"  class="choose1"/>
			    						<span>B</span><input type="checkbox"  class="choose1"/>
			    						<span>C</span><input type="checkbox"  class="choose1"/>
			    						<span>D</span><input type="checkbox"  class="choose1"/>
		    						</form>
		    					</li>
		    				    <li id="knowledge">知识点<input class="form-control" type="text" /></li>
		    				    <li id="resolve">解析<br/><textarea ></textarea></li>	 
		    			    </ul>
		    			</div>	
		    			<div class=" choicesw">
		    				<ul>
		    				<li id="dry">题干<br><textarea></textarea></li>	
		    				    <li id="sa">A&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="form-control " type="text" id="" /></li>
		    				    <li id="sb">B&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="form-control " type="text" id="" /></li>
		    				    <li id="sc">C&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="form-control " type="text" id="" /></li>
		    				    <li id="sd">D&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="form-control " type="text" id="" /></li>
		    				    <li id="answer" class="answerw">答&nbsp;&nbsp;案&nbsp;
	    							<form class="choose">
		    							<span>A</span><input type="checkbox"  class="choose1"/>
			    						<span>B</span><input type="checkbox"  class="choose1"/>
			    						<span>C</span><input type="checkbox"  class="choose1"/>
			    						<span>D</span><input type="checkbox"  class="choose1"/>
		    						</form>
		    					</li>
		    				    <li id="knowledge">知识点<input class="form-control" type="text" /></li>
		    				    <li id="resolve">解析<br/><textarea ></textarea></li>	 
		    			    </ul>
		    			</div>
		    			
		    					    			<!--多选题录入 end-->
		    			
		    			<!--判断-->
		    			<div class="ture-or-false">
		    				<ul>
		    					<li id="dry">题干<br><textarea></textarea></li>	
		    				    <li id="sa">A&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="form-control " type="text" id="" /></li>
		    				    <li id="sb">B&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="form-control " type="text" id="" /></li>
		    				    <li id="answer" class="answerw">答&nbsp;&nbsp;案&nbsp;
	    							<form class="choose">
		    							<span>A</span><input type="radio" name="w" class="choose1"/>
			    						<span>B</span><input type="radio" name="w" class="choose1"/>
		    						</form>
		    					</li>
		    				    <li id="knowledge">知识点<input class="form-control" type="text" /></li>
		    				    <li id="resolve">解析<br/><textarea ></textarea></li>	 
		    			    </ul>
		    			</div>	
		    			
>>>>>>> origin/gy
		    			
		    			<!--填空、判断题录入 start-->
		    			<div class="fill-and-judgement">
		    				<ul>
<<<<<<< HEAD
		    					<li id="dry">题干:<textarea></textarea></li>		    					
		    					<li id="answer">答&nbsp;&nbsp;案:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="form-control" type="text" /></li>
		    					<li id="knowledge">涉及知识点:<input class="form-control" type="text" /></li>
		    					<li id="resolve">解析:<textarea></textarea></li>
=======
		    					<li id="dry">题干<br><textarea></textarea></li>		    					
		    					<li id="answer">答&nbsp;&nbsp;案&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="form-control" type="text" /></li>
		    					<li id="knowledge">涉及知识点:<input class="form-control" type="text" /></li>
		    					<li id="resolve">解析<br><textarea></textarea></li>
>>>>>>> origin/gy
		    				</ul>
		    			</div>
		    			
		    			<!--填空、判断题录入 end-->
		    			
		    			<!--解答题录入 start-->
		    			<div class="answer-question">
		    				<ul>
<<<<<<< HEAD
		    					<li id="dry">题干:<textarea></textarea></li>
		    					<li id="answer">答案:<textarea></textarea></li>
		    					<li id="knowledge">涉及知识点:<input class="form-control" type="text" /></li>
		    					<li id="resolve">解析:<textarea></textarea></li>
=======
		    					<li id="dry">题干<br><textarea></textarea></li>
		    					<li id="answer">答案<br><textarea></textarea></li>
		    					<li id="knowledge">涉及知识点:<input class="form-control" type="text" /></li>
		    					<li id="resolve">解析<br><textarea></textarea></li>
>>>>>>> origin/gy
		    				</ul>
		    			</div>
		    			<div>
		    				<button type="button" class="btn btn-warning clearall">清空</button>
		    				<button type="submit" class="btn btn-primary submitbtn">提交</button>
		    			</div>
		    		</div>
		    		<!--解答题录入 end-->
		    		
		    	</div>
		    	<!--题库录入 end-->
		    </div>	
	</body>
<<<<<<< HEAD
=======
	<script type="text/javascript" src="js/jsentryquestions.js" ></script>
>>>>>>> origin/gy
</html>
