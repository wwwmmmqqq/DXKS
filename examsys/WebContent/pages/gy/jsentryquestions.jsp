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
            <link href="css/jquery-confirm.css" rel="stylesheet" type="text/css" />
            <link href="css/toastr.css" rel="stylesheet" type="text/css" />
            
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
				    				<span>teacher <i class="caret"></i></span>
				    			</a>    		
				    	    </button>
					<div class="dropdown-content">
						<a href="#" data-toggle="modal" data-target="#myModal-information">个人中心</a>
						<a href="javascript:modifyPassword()" >修改密码</a>
						<a href="#" onclick="myFunction()" value="退出系统">退出系统</a>
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
						<p>Hello, teacher</p>
					</div>
				</div>
				<div class="light_bottom">
					<ul class="side_nav">
						<a href="showItemBankListByUserJump?page=1"><li class="side_nav1 now">题库管理</li></a>
						<a href="history_teacher.jsp"><li class="side_nav1 n">查看成绩</li></a>
						<a href="teacher_read.jsp"><li class="side_nav1 ">查看成绩</li></a>
					</ul>
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
		    			<ul class="question-type">
		    			<li>
		    					<form >请选择题目类型 ：
		    						<input type="radio"  id="single-choice" value="single" name="1" checked="checked"/><label>单选题</label>
		    						<input type="radio"  id="mutiple-choice" value="mutiple" name="1"/><label>多选题</label>
		    						<input type="radio"  id="ture-or-false" value="TrueOrFalse" name="1"/><label>判断题</label>
		    						<input type="radio"  id="fill-in" name="1" value="Fills"/><label>填空题</label>
		    						<input type="radio"  id="answer-questions" name="1" value="Subjective"/><label>解答题</label>
		    					</form>
		    				</li>
		    				
		    			</ul>
		    		</div>
		    		<div class="entry">

		    			<!--单选题录入 start-->
		    			<div class="choices">
		    			<form class="choose" id="s-question">
		    			<input type="hidden" value="single" name="question.type">
		    				<ul>
		    				<li>请选择科目：
		    					<select name="question.subjectName">
		    						<option value="高等数学">高等数学</option>
		    						<option value="大学英语">大学英语</option>
		    						<option value="思想政治">"思想政治"</option>
		    						<option value="计算机">计算机</option>
		    						<option value="大学物理">"大学物理"</option>
		    					</select>
		    				</li>
		    				<li id="dry">题干<br>
		    				<textarea name="question.title" id="question"></textarea></li>	
		    				    <li id="sa">A&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="form-control " type="text" name="question.content" /></li>
		    				    <li id="sb">B&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="form-control " type="text" name="question.content" /></li>
		    				    <li id="sc">C&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="form-control " type="text" name="question.content" /></li>
		    				    <li id="sd">D&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="form-control " type="text" name="question.content" /></li>
		    				    <li id="answer" class="answerw">答&nbsp;&nbsp;案&nbsp;
		    							<span>A</span><input type="radio" name="question.isAnswer" class="choose1"/>
			    						<span>B</span><input type="radio" name="question.isAnswer" class="choose1"/>
			    						<span>C</span><input type="radio" name="question.isAnswer" class="choose1"/>
			    						<span>D</span><input type="radio" name="question.isAnswer" class="choose1"/>
		    					</li>
		    					
		    				    <li id="knowledge">知识点<input class="form-control" type="text" name="question.knowledge"/></li>
		    			    </ul>
		    			    </form>
		    			</div>	
		    			<!-- 多选录入 -->
		    			<div class=" choicesw">
		    			<form class="choose" id="w-question">
		    			<input type="hidden" value="Multiple" name="question.type">
		    				<ul>
		    				<li>请选择科目：
		    					<select name="question.subjectName">
		    						<option value="高等数学">高等数学</option>
		    						<option value="大学英语">大学英语</option>
		    						<option value="思想政治">"思想政治"</option>
		    						<option value="计算机">计算机</option>
		    						<option value="大学物理">"大学物理"</option>
		    					</select>
		    				</li>
		    				<li id="dry">题干<br><textarea name="question.title"></textarea></li>	
		    				    <li id="sa">A<input class="form-control " type="text" name="question.content"/></li>
		    				    <li id="sb">B<input class="form-control " type="text" name="question.content"/></li>
		    				    <li id="sc">C<input class="form-control " type="text" name="question.content" /></li>
		    				    <li id="sd">D<input class="form-control " type="text" name="question.content" /></li>
		    				    <li id="answer" class="answerw">答案&nbsp;
		    							<span>A</span><input type="checkbox"  class="choose1" name="question.isAnswer"/>
			    						<span>B</span><input type="checkbox"  class="choose1"  name="question.isAnswer"/>
			    						<span>C</span><input type="checkbox"  class="choose1"  name="question.isAnswer"/>
			    						<span>D</span><input type="checkbox"  class="choose1" name="question.isAnswer"/>
		    					
		    					</li>
		    				    <li id="knowledge">知识点<input class="form-control" type="text" name="question.knowlege"/></li>
		    			    </ul>
		    			    	</form>
		    			</div>
		    			
		    					    			<!--多选题录入 end-->
		    			
		    			<!--判断-->
		    			<div class="ture-or-false">
		    			<form class="choose" id="tf-question">
		    			<input type="hidden" value="TrueOrFalse" name="question.type">
		    				<ul>
		    				<li>请选择科目：
		    					<select name="question.subjectName">
		    						<option value="高等数学">高等数学</option>
		    						<option value="大学英语">大学英语</option>
		    						<option value="思想政治">"思想政治"</option>
		    						<option value="计算机">计算机</option>
		    						<option value="大学物理">"大学物理"</option>
		    					</select>
		    				</li>
		    					<li id="dry">题干<br><textarea name="question.title"></textarea></li>	
		    				    <li id="sa">A&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="form-control " type="text" name="question.content" /></li>
		    				    <li id="sb">B&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="form-control " type="text" name="question.content" /></li>
		    				    <li id="answer" class="answerw">答&nbsp;&nbsp;案&nbsp;
		    							<span>A</span><input type="radio" name="question.isAnswer" class="choose1"/>
			    						<span>B</span><input type="radio" name="question.isAnswer" class="choose1"/>
		    					</li>
		    				    <li id="knowledge">知识点<input class="form-control" type="text" name="question.knowledge"/></li>
		    			    </ul>
		    			    </form>
		    			</div>	
		    			
		    			
		    			<!--填空、判断题录入 start-->
		    			<div class="fill-and-judgement">
		    			<form id="fj-question">
		    			<input type="hidden" value="Fills" name="question.type">
		    				<ul>
		    				<li>请选择科目：
		    					<select name="question.subjectName">
		    						<option value="高等数学">高等数学</option>
		    						<option value="大学英语">大学英语</option>
		    						<option value="思想政治">"思想政治"</option>
		    						<option value="计算机">计算机</option>
		    						<option value="大学物理">"大学物理"</option>
		    					</select>
		    				</li>
		    					<li id="dry">题干<br><textarea name="question.title"></textarea></li>		    					
		    					<li id="answer">答&nbsp;&nbsp;案&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="form-control" type="text" name="question.fillsText" /></li>
		    					<li id="knowledge">涉及知识点:<input class="form-control" type="text" name="question.knowledge"/></li>
		    				</ul>
		    				</form>
		    			</div>
		    			
		    			<!--填空、判断题录入 end-->
		    			
		    			<!--解答题录入 start-->
		    			<div class="answer-question">
		    			<form id="aquestion">
		    			<input type="hidden" value="Subjective" name="question.type">
		    				<ul>
		    				<li>请选择科目：
		    					<select name="question.subjectName">
		    						<option value="高等数学">高等数学</option>
		    						<option value="大学英语">大学英语</option>
		    						<option value="思想政治">"思想政治"</option>
		    						<option value="计算机">计算机</option>
		    						<option value="大学物理">"大学物理"</option>
		    					</select>
		    				</li>
		    					<li id="dry">题干<br><textarea name="question.title"></textarea></li>
		    					<li id="answer">答案<br><textarea name="question.subjectiveText"></textarea></li>
		    					<li id="knowledge">涉及知识点:<input class="form-control" type="text" name="question.knowledge"/></li>
		    				</ul>
		    				</form>
		    			</div>
		    			<div>
		    				<button type="submit" class="btn btn-primary submitbtn" onclick="importQuestion()">提交</button>
		    			</div>
		    		</div>
		    		<!--解答题录入 end-->
		    		
		    	</div>
		    	<!--题库录入 end-->
		    </div>	
		    
		    <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
		    <script type="text/javascript" src="js/jquery-confirm.js"></script>
		    <script type="text/javascript" src="js/toastr.js"></script>
            <script type="text/javascript" src="js/jsentryquestions.js" ></script>
            <script>
            
            
              /* 修改密码 */
            function modifyPassword(){
             	var str = '<form id="user_setting" action="">' +
         		'<table style="width:100%;">' +
         		'<tbody>' +
         		'<tr>' +
         		'<td>旧密码</td>' +
         		'<td><input type="text"class="form-control" name="oldpwd"/></td>' +
         		'</tr>' +
         		'<tr>' +
         		'<td>新密码</td>' +
         		'<td><input type="text"class="form-control"name="newpwd"/></td>' +
         		'</tr>' +
         		'<tr>' +
         		'<td>确认密码</td>' +
         		'<td><input type="text"class="form-control"name="repwd"/></td>' +
         		'</tr>' +
         		'</tbody>' +
         		'</table>' +
         		'</form>'
         		$.confirm({
        	title : '修改密码',
        	smoothContent : false,
        	content : str,
        	buttons : {
        		deleteUser : {
        			btnClass : 'btn-blue',
        			text : '修改',
        			action : function() {
        				var oldpwd=$('#user_setting input[name="user.oldpwd"]').val();
        				var newpwd=$('#user_setting input[name="user.newpwd"]').val();
        				var repwd=$('#user_setting input[name="user.repwd"]').val();
        				$.post("changePsw",{"user.psw":oldpwd,"rePsw":newpwd},function(data) {
        					toastr.success("密码修改成功");
        			  })
        			}
        		},
        		cancelAction : {
        			btnClass : 'btn-default',
        			text : '取消',
        		}
        	}
        });
             }
           
        </script>  
	</body>
</html>
