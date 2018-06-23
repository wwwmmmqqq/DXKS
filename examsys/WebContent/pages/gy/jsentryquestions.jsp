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
						<a href="#" data-toggle="modal" data-target="#myModal-email">邀请通知</a>
						<a href="#" data-toggle="modal" data-target="#myModal_read">阅卷通知</a>
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
						<a href="teacher_read_jump.jsp"><li class="side_nav1 ">批阅试卷</li></a>
					</ul>
				</div>
			</nav>
			<!-- sidebar end -->
			
			<div class="cant">
		    	<div class="bred">
		    			<!--breadcrumbs start -->
		    			<ul class="breadcrumb mybread">
		    				<li>
		    					<a href="showItemBankListByUserJump?page=1"><i class="fa fa-home"></i> Home</a>
		    				</li>
		    				<li>
		    					<a href="showItemBankListByUserJump?page=1">题库管理</a>
		    				</li>
		    				<li class="active">录入题库</li>
		    			</ul>
		    			<!--breadcrumbs end -->	
		    	</div>
		    	<!--题库录入 start-->
		    	<div class="entryquestions">
		    		<div class="shaixuan">
		    			<ul class="question-type">

		    					<form>请选择题目类型 ：
		    						<input type="radio"  id="single-choice" value="single-choice" name="1" checked="checked" /><label>单选题</label>
		    						<input type="radio"  id="mutiple-choice"  name="1"/><label>多选题</label>
		    						<input type="radio"  id="ture-or-false"  name="1"/><label>判断题</label>
		    						<input type="radio"  id="fill-in" name="1"/><label>填空题</label>
		    						<input type="radio"  id="answer-questions" name="1"/><label>解答题</label>
		    					</form>
		    				</li>

		    				<li>请选择科目：
		    					<select class="sub form-control">
		    						<option>高数</option>
		    						<option>英语</option>
		    						<option>政治</option>
		    						<option>计算机</option>
		    						<option>物理</option>
		    						<option>化学</option>
		    					</select>
		    				
		    					难易程度
		    					<select class="sub form-control">
		    						<option>简单</option>
		    						<option>中等</option>
		    						<option>一般</option>
		    						<option>困难</option>
		    					</select>
		    				</li>
		    			</ul>
		    		</div>
		    		<div class="entry" >
						<div class=entryw id="que">
		    			<!--单选题录入 start-->
		    			 <div class="choices">
		    			<form class="choose" id="s-question">
		    			<input type="hidden" value="single" name="question.type">
		    				<ul>
		    				<li>请选择科目：
		    					<select name="question.subjectName">
		    						<option >高等数学</option>
		    						<option >大学英语</option>
		    						<option>思想政治</option>
		    						<option>计算机</option>
		    						<option >大学物理</option>
		    					</select>
		    					难易程度
		    					<select class="sub form-control">
		    						<option>简单</option>
		    						<option>中等</option>
		    						<option>一般</option>
		    						<option>困难</option>
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
		    			

		    </div>	
		    
		    			<!--模态框-->
			<!--模态框查看个人信息-->
			<div class="modal fade" id="myModal-information">
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
											<div class="tb_information">慕雪</div>
										</td>
									</tr>
									<tr>
										<td>
											工号
											<div class="tb_information">17001</div>
										</td>
									</tr>
									<tr>
										<td>
											密码
											<div class="tb_information">123456</div>
										</td>
									</tr>
									<tr>
										<td>
											学校
											<div class="tb_information">萍乡学院</div>
										</td>
									</tr>
									<tr>
										<td>
											学院
											<div class="tb_information">信计学院</div>
										</td>
									</tr>
									<tr>
										<td>
											性别
											<div class="tb_information">女</div>
										</td>
									</tr>
									<tr>
										<td>
											联系方式
											<div class="tb_information">1770313147</div>
										</td>
									</tr>
									<tr>
										<td>
											邮箱
											<div class="tb_information">1770313147@qq.com</div>
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

			<!--模态框查看通知-->
			<div class="modal fade" id="myModal-email">
				<div class="modal-dialog">
					<div class="modal-content">

						<div class="modal-header">
							<h4 class="modal-title">通知</h4>
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

			<!--模态框阅卷邀请通知-->
			<div class="modal fade" id="myModal_read">
				<div class="modal-dialog">
					<div class="modal-content">

						<div class="modal-header">
							<h4 class="modal-title">通知</h4>
							<button type="button" class="close close1" data-dismiss="modal">&times;</button>
						</div>

						<div class="modal-body">
							<div class="email">
								来自xx学校xx学院xx老师的邀请
								<button class="btn btn-primary accept" id="accept" onclick="window.location='teacher_read.jsp'">接受</button>
								<button class="btn btn-danger refuse" data-toggle="modal" data-target="#myModal_read_refuse">拒绝</button>
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

			<!--拒绝阅卷模态框-->
			<div class="modal fade" id="myModal_read_refuse">
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
		    
		    
		    <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
		    <script type="text/javascript" src="js/jquery-confirm.js"></script>
		    <script type="text/javascript" src="js/toastr.js"></script>
            <script type="text/javascript" src="js/jsentryquestions.js" ></script>
            <script type="text/javascript" src="js/jquery-confirm.js" ></script>
            <script type="text/javascript" src="js/bootstrap.min.js"></script>
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
