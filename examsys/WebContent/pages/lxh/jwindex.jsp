<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
		<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <meta name="description" content="Developed By M Abdur Rokib Promy">
        <meta name="keywords" content="Admin, Bootstrap 3, Template, Theme, Responsive">
        <!-- bootstrap 3.0.2 -->
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- font Awesome -->
        <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <!-- Ionicons -->
        <link href="css/ionicons.min.css" rel="stylesheet" type="text/css" />
        <link href='http://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
        <script type="text/javascript" src="js/jquery-3.2.1.min.js" ></script>
		<script type="text/javascript" src="js/bootstrap.min.js" ></script>
        <!-- Theme style -->
        <link href="css/lxhstyle.css" rel="stylesheet" type="text/css" />
       
       <script type="text/javascript" src="js/jquery.min.js" ></script>  
       <script type="text/javascript" src="js/jwindex.js" ></script>
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
		    				<span>Jane Doe <i class="caret"></i></span>
		    			</a>    		
		    	    </button>
		    		<div class="dropdown-content">
		    			<a href="#" data-toggle="modal" data-target="#myModal-information">个人中心</a>
		    			<a href="#">退出系统</a>
		    		</div>
		    	</div>
		    	<div class="dropdown task">
		    		<button class="dropbtn">
		    			<a href="#" class="dropdown-toggle" data-toggle="dropdown">
		    				<i class="fa fa-tasks"></i>
		    			</a>
		    	    </button>
		    		<div class="dropdown-content">
		    			<a href="#" data-toggle="modal" data-target="#myModal-invite-teacher">邀请老师出卷</a>
		    			<a href="#" data-toggle="modal" data-target="#myModal-invite-school">邀请学校考试</a>
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
		    			<a href="#" data-toggle="modal" data-target="#myModal-exam-notice">考试通知</a>
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
		    			<p>Hello, 教务周</p>
		    		</div>
		    	</div>
		    	<div class="light_bottom">
		    		<ul class="side_nav">
		    			<li class="side_nav1">
							<a href="staffs_student.html">学生信息管理</a>
						</li>
						<li class="side_nav1">
							<a href="staffs_teacher.html">教师信息管理</a>
						</li>
						<li class="side_nav1">
							<a href="jwindex.html">试卷管理 </a>
						</li>
						<li class="side_nav1">
							<a href="jwhandzujuan.html">手动组卷</a>
						</li>
						<li class="side_nav1">
							<a href="jwintelzujuan.html">智能组卷</a>
						</li>
						<li class="side_nav1">
							<a href="history_staffs.html">历史成绩</a>
						</li>
						<li class="side_nav1">
							<a href="test.html">考次计划</a>
						</li>
		    		</ul>
		    	</div>
		    </nav>
		    <!-- sidebar end -->
		    
		    
		    <div class="cant">
		    	<div class="bred">
		    			<!--breadcrumbs start -->
		    			<ul class="breadcrumb mybread">
		    				<li class="active">
		    					<a href="#"><i class="fa fa-home"></i> 试卷管理</a>
		    				</li>
		    	
		    			</ul>
		    			<!--breadcrumbs end -->	
		    	</div>
		   
		    	
		    	<div class="papermanage">
		    		<div id="flip">条件搜索</div>
		    		<div id="panel">
		    			<form>
		    				<div class="searchpanel">
		    					<ul>
		    						<li><label>科目</label>
		    							<select>
		    								<option>高等数学</option>
		    								<option>大学英语</option>
		    								<option>大学物理</option>
		    								<option>计算机</option>
		    							</select>
		    						</li>
		    
		    						<li><label>开始时间</label>
		    							<input type="text" />
		    						</li>
		    						<li><label>结束时间</label>
		    							<input type="text" />
		    						</li>
		    						<li><button type="submit" class="btn btn-default searchbtn"><i class="fa fa-search"></i></button></li>
		    					</ul>
		    					
		    				</div>
		    				
		    				
		    				
		    			</form>
		    			
		    		</div>
		    		
		    		
		    		<div class="jwchaxun">
		    			<div class="operation"> 
		    				<ul>
		    					<li>
		    						<a class="btn btn-default btn-sm pull-right" href="showpaper.html">查看</a>
		    					</li>
		    					<li><button class="btn btn-default btn-xs" onclick="deletefunction()"><i class="fa fa-times"></i></button></li>
		    					<li><button class="btn btn-default btn-xs"  data-toggle="modal" data-target="#modify-paper"><i class="fa fa-pencil"></i></button></li>
		    				</ul>
		    			</div>
		    			<p>共查询到？条记录</p>
		    			<table class="table jwcxtable">
		    				<thead>
		    					<tr>
		    						<th>
		    							<input type="checkbox" class="flat-grey"/>全选 ID
		    						</th>
		    						<th>所在考次</th>
		    						<th>试卷科目</th>
		    						<th>标题</th>
		    						<th>总分</th>
		    						<th>总时间</th>
		    						<th>开始时间</th>
		    						<th>结束时间</th>
		    					</tr>
		    				</thead>
		    				<tbody id="paper-list-box">
		    					<!-- <tr id=''>
			    					<td id=''>
			    						<input type='checkbox' class='flat-grey' />1
			    					</td>
			    					<td id=''>第一次联考</td>
			    					<td id=''>高等数学</td>
			    					<td id=''>2018年高等数学第一次联考</td>
			    					<td id=''>100分</td>
			    					<td id=''>100分钟</td>
			    					<td id=''>2018年5月20日9：00</td>
			    					<td id=''>2018年5月20日9：40</td>
			    				</tr> -->
		    				</tbody>
		    			</table>
		    		  
		    			<div class="page_pagination">
		    				<ul class="pagination">
		    					<li class="page-item">
		    						<a class="page-link" href="#">上一页</a>
		    					</li>
		    					<li class="page-item">
		    						<a class="page-link" href="#">1</a>
		    					</li>
		    					<li class="page-item active">
		    						<a class="page-link " href="#">2</a>
		    					</li>
		    					<li class="page-item">
		    						<a class="page-link" href="#">3</a>
		    					</li>
		    					<li class="page-item">
		    						<a class="page-link" href="#">下一页</a>
		    					</li>
		    					<input class="jump">
		    					<button class="btn btn-primary btn_jump">跳转</button>
		    				</ul>
		    			</div>
		    		</div>
		        </div>  
		        <!--papermanange end -->	    
		    </div>
		    <!--cant end -->	
		   
	    </section>
	    
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
	    
	    <!--模态框邀请老师组卷-->
	    <div class="modal fade" id="myModal-invite-teacher">
	    	<div class="modal-dialog">
	    		<div class="modal-content">
	    			<!-- 模态框头部 -->
	    			<div class="modal-header">
	    				<h4 class="modal-title">邀请老师组卷</h4>
	    				<button type="button" class="close close1" data-dismiss="modal">&times;</button>
	    			</div>-->
	    
	    			<!-- 模态框主体 -->
	    			<div class="modal-body">
	    				<table>
	    					<tbody>
	    						<tr>
	    							<td>
	    								姓&nbsp;&nbsp;&nbsp;&nbsp;名&nbsp;&nbsp;&nbsp;&nbsp;
	    								<input type="text" class="hover">
	    							</td>
	    						</tr>
	    						<tr>
	    							<td>
	    								学&nbsp;&nbsp;&nbsp;&nbsp;校&nbsp;&nbsp;&nbsp;&nbsp;
	    								<input type="text" class="hover">
	    							</td>
	    						</tr>
	    						<tr>
	    							<td>
	    								学&nbsp;&nbsp;&nbsp;&nbsp;院&nbsp;&nbsp;&nbsp;&nbsp;
	    								<input type="text" class="hover">
	    							</td>
	    						</tr>
	    						<tr>
	    							<td>
	    								专&nbsp;&nbsp;&nbsp;&nbsp;业&nbsp;&nbsp;&nbsp;&nbsp;
	    								<input type="text" class="hover">
	    							</td>
	    						</tr>
	    						<tr>
	    							<td>
	    								专&nbsp;&nbsp;&nbsp;&nbsp;业&nbsp;&nbsp;&nbsp;&nbsp;
	    								<input type="text" class="hover">
	    							</td>
	    						</tr>
	    					</tbody>
	    				</table>
	    			</div>
	    
	    			<!-- 模态框底部 -->
	    			<div class="modal-footer">
	    				<button type="button" class="btn btn-primary add_invite">邀请</button>
	    				<button type="button" class="btn btn-secondary back_invite" data-dismiss="modal">关闭</button>
	    			</div>
	    
	    		</div>
	    	</div>
	    </div>
	    
	    <!--模态框邀请学校参加考试-->
	    <div class="modal fade" id="myModal-invite-school">
	    	<div class="modal-dialog">
	    		<div class="modal-content">
	    
	    			<!-- 模态框头部 -->
	    			<div class="modal-header">
	    				<h4 class="modal-title">邀请学校参加考试</h4>
	    				<button type="button" class="close close1" data-dismiss="modal">&times;</button>
	    			</div>
	    
	    			<!-- 模态框主体 -->
	    			<div class="modal-body">
	    				<table>
	    					<tbody>
	    						<tr>
	    							<td>
	    								学&nbsp;&nbsp;&nbsp;&nbsp;校&nbsp;&nbsp;&nbsp;&nbsp;
	    								<input type="text" class="hover">
	    							</td>
	    						</tr>
	    						<tr>
	    							<td>
	    								学&nbsp;&nbsp;&nbsp;&nbsp;院&nbsp;&nbsp;&nbsp;&nbsp;
	    								<input type="text" class="hover">
	    							</td>
	    						</tr>
	    						<tr>
	    							<td>
	    								专&nbsp;&nbsp;&nbsp;&nbsp;业&nbsp;&nbsp;&nbsp;&nbsp;
	    								<input type="text" class="hover">
	    							</td>
	    						</tr>
	    					</tbody>
	    				</table>
	    			</div>
	    
	    			<!-- 模态框底部 -->
	    			<div class="modal-footer">
	    				<button type="button" class="btn btn-primary add_invite">邀请</button>
	    				<button type="button" class="btn btn-secondary back_invite" data-dismiss="modal">关闭</button>
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
	    <div class="modal fade "  id="modify-paper" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	    	<div class="modal-dialog">
	    		<div class="modal-content">
	    			<div class="modal-header">
	    				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
	    					&times;
	    				</button>
	    				<h4 class="modal-title" id="myModalLabel">
	    					修改试卷信息
	    				</h4>
	    			</div>
	    			<div class="modal-body modify-body">
	    		        	<div>所在考次:<input type="text" /></div>
	    		        	<div>试卷科目:<input type="text" /></div>
	    		        	<div>标&nbsp;&nbsp;&nbsp;&nbsp;题:&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" /></div>
	    		        	<div>科&nbsp;&nbsp;&nbsp;&nbsp;目:&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" /></div>
	    		        	<div>总&nbsp;&nbsp;&nbsp;&nbsp;分:&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" /></div>
	    		        	<div>开始时间:<input type="text" /></div>
	    		        	<div>结束时间:<input type="text" /></div>           
	    		           
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
	
	
	<script type="text/javascript">
	showPaperList(1);
	
	function showPaperList(page) {
		$.post("showPaperList", {"page":page}, function(data) {
			var paperList = data.paperList;
			var htm = "";
	 		for(var i=0;i<paperList.length;i++) {
	 			htm += getItemHtml(i, paperList[i]);
	 		}
	 		$('#paper-list-box').html(htm);
		});
	}
	
	function getItemHtml(index, obj) {
		var htm = "<tr id=''>"
			+"	<td id=''>"
			+"		<input type='checkbox' class='flat-grey' />"
			+"	</td>"
			+"	<td>第一次联考</td>"
			+"	<td>"+obj.name+"</td>"
			+"	<td>2018年高等数学第一次联考</td>"
			+"	<td>"+obj.totalScore+"</td>"
			+"	<td>"+obj.totalTime+"</td>"
			+"	<td>"+obj.examStart+"</td>"
			+"	<td>"+obj.examEnd+"</td>"
			+"</tr>";
		return htm;
	}
	</script>
</html>
