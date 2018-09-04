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
            <link href="css/lxhstyle.css" rel="stylesheet" type="text/css" />
            <link href="css/jquery-confirm.css" rel="stylesheet" type="text/css" />
          <link href="css/toastr.css" rel="stylesheet" type="text/css" />
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
				    				<span>${session.user.userId} <i class="caret"></i></span>
				    			</a>    		
				    	    </button>
					<div class="dropdown-content">
						<a href="#" data-toggle="modal" data-target="#myModal-information">个人中心</a>
						<a href="javascript:setPassword()">修改密码</a>
						<a href="#" onclick="Out()">退出系统</a>
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
						<p>Hello, ${session.user.userId}</p>
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
		    				<li><button type="button" class="btn btn-danger newq">+新题目</button>
		    					<form>请选择题目类型 ：
		    						<input type="radio" name="radio" id="single-choice" value="single-choice" checked="checked" /><label>单选题</label>
		    						<input type="radio" name="radio" id="mutiple-choice" /><label>多选题</label>
		    						<input type="radio" name="radio" id="ture-or-false" /><label>判断题</label>
		    						<input type="radio" name="radio" id="fill-in"/><label>填空题</label>
		    						<input type="radio" name="radio" id="answer-questions"/><label>解答题</label>
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
		    			
		    			<!--填空、判断题录入 start-->
		    			<div class="fill-and-judgement">
		    				<ul>
		    					<li id="dry">题干:<textarea></textarea></li>		    					
		    					<li id="answer">答&nbsp;&nbsp;案:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="form-control" type="text" /></li>
		    					<li id="knowledge">涉及知识点:<input class="form-control" type="text" /></li>
		    					<li id="resolve">解析:<textarea></textarea></li>
		    				</ul>
		    			</div>
		    			
		    			<!--填空、判断题录入 end-->
		    			
		    			<!--解答题录入 start-->
		    			<div class="answer-question">
		    				<ul>
		    					<li id="dry">题干:<textarea></textarea></li>
		    					<li id="answer">答案:<textarea></textarea></li>
		    					<li id="knowledge">涉及知识点:<input class="form-control" type="text" /></li>
		    					<li id="resolve">解析:<textarea></textarea></li>
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
		    										用户名
		    										<div class="tb_information">Mary Doe</div>
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
		    										姓名
		    										<div class="tb_information">教务XXX</div>
		    									</td>
		    								</tr>
		    								<tr>
		    									<td>
		    										性别
		    										<div class="tb_information">女 </div>
		    									</td>
		    								</tr>
		    								<tr>
		    									<td>
		    										电话
		    										<div class="tb_information">15574014263</div>
		    									</td>
		    								</tr>
		    								<tr>
		    									<td>
		    										所属大学
		    										<div class="tb_information">萍乡学院</div>
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
		    						<button type="button" class="btn btn-secondary back_information" data-dismiss="modal">关闭</button>
		    					</div>
		    				</div>
		    			</div>
		    		</div>
		    		
		    		<!--模态框查看通知-->
		    		<div class="modal fade" id="myModal-invite-notice">
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
		        
		    		<!-- 修改试卷信息模态框 -->
		    		<div class="modal fade " id="modify-subject" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		    			<div class="modal-dialog">
		    				<div class="modal-content">
		    					<div class="modal-header">
		    						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
		    			    					&times;
		    			    				</button>
		    						<h4 class="modal-title" id="myModalLabel">
		    			    					修改题目
		    			    				</h4>
		    					</div>
		    					<div class="modal-body modify-body">
		    						<div>题&nbsp;&nbsp;目:<input type="text" /></div>
		    						<div>选项A:<input type="text" /></div>
		    						<div>选项B<input type="text" /></div>
		    						<div>选项C<input type="text" /></div>
		    						<div>选项D<input type="text" /></div>
		    						<div>答&nbsp;&nbsp;案:<input type="text" /></div>
		    						<div>:<input type="text" /></div>
		    		
		    					</div>
		    					<div class="modal-footer">
		    						<button type="button" class="btn btn-default" data-dismiss="modal">关闭
		    			    				</button>
		    						<button type="button" class="btn btn-primary">
		    			    					提交更改
		    			    				</button>
		    					</div>
		    				</div>
		    				<!-- /.modal-content -->
		    			</div>
		    			<!-- /.modal -->
		    		</div>	
	</body>
	<script type="text/javascript" src="js/jquery-confirm.js" ></script>
		<script type="text/javascript" src="js/toastr.js"></script>
	<script type="text/javascript">
	if("${session.user}" == '') {
		alert("请登录");
		location.href = '../gy/login.jsp';
	}
	function setPassword(){
		   var str = '<form id="user_setting" action="">' +
			'<table style="width:100%;">' +
			'<tbody>' +
			'<tr>' +
			'<td>旧密码</td>' +
			'<td><input type="text"class="form-control" name="user.oldpwd"/></td>' +
			'</tr>' +
			'<tr>' +
			'<td>新密码</td>' +
			'<td><input type="password"class="form-control"name="user.newpwd"/></td>' +
			'</tr>' +
			'<tr>' +
			'<td>确认密码</td>' +
			'<td><input type="password"class="form-control"name="user.repwd"/></td>' +
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
					if(repwd!=newpwd) {
						toastr.error("确认密码不正确！");
						return false;
					}
						 $.post("changePsw",{"user.psw":oldpwd,"rePsw":newpwd},function(data) {
							if(data.result=="密码修改成功") {
								toastr.success(data.result);
							}else{
								toastr.error(data.result);
								return false;
							}
					  });
					
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
</html>
