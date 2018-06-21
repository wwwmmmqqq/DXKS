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
        <!-- Theme style -->
        <link href="css/lxhstyle.css" rel="stylesheet" type="text/css" />
        
        <script type="text/javascript" src="js/jquery-3.2.1.min.js" ></script>
		<script type="text/javascript" src="js/bootstrap.min.js" ></script>
	    <script type="text/javascript" src="js/prepaper.js" ></script>
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
		    				<li class="active">
		    					<a href="jwindex.html"><i class="fa fa-home"></i>Home</a>
		    				</li>
		    	
		    			</ul>
		    			<!--breadcrumbs end -->	
		    	</div>
		    	<div class="papermanage">
		    		<!-- 试卷管理 start -->
		    		<div class="panel showpaperpanel">
		    			<header class="panel-heading" >
		    				样卷
		    			</header>
		    			<div class="panel-body ">
		    				<div class="yj-opration">
		    					<ul>
		    						<li>
		    							<a class="btn btn-default btn-sm pull-right" href="showpaper.html">查看</a>
		    						</li>
		    						<li><button class="btn btn-default btn-xs" onclick="deletefunction()"><i class="fa fa-times"></i></button></li>
		    						<li><button class="btn btn-default btn-xs" data-toggle="modal" data-target="#modify-paper"><i class="fa fa-pencil"></i></button></li>
		    					</ul>
		    				</div>
		    				<div class="exam-list">
		    					<ul>					
		    						<li><p>一.单选题</p></li>
		    						
		    						<li>
		    							<div class="exam-content">
		    								<div class="exam-question">
		    							    
		    								</div>
		    								<div class="exam-qlist">
		    									<div class="exam-content">
		    										<div class="exam-question">
		    											<input type="checkbox" />&nbsp;&nbsp;&nbsp;&nbsp;1.下列说法正确的是(<input type="text" class="xz-que" size="5" placeholder=""/>)
		    										</div>
		    							
		    										<div class="exam-selection">
		    											<span class="op-item">
		    									    	   <span>A.</span>
		    											   <span>Update software</span>
		    											</span>
		    										    <span class="op-item">
		    							                	<span>B.</span>
		    											   <span>Update software</span>
		    											</span>
		    											<span class="op-item">
		    									    	    <span>C.</span>
		    											<span>Update software</span>
		    											</span>
		    											<span class="op-item">
		    									    		<span>D.</span>
		    											<span>Update software</span>
		    											</span>
		    										</div>
		    									</div>
		    									
		    								</div>
		    							</div>
		    							
		      
                                    </li>
                                 
                                    <li>
		    							<div class="exam-content">
		    								<div class="exam-question">
		    							    
		    								</div>
		    								<div class="exam-qlist">
		    									<div class="exam-content">
		    										<div class="exam-question">
		    											<input type="checkbox" />&nbsp;&nbsp;&nbsp;&nbsp;1.下列说法正确的是(<input type="text" class="xz-que" size="5" placeholder=""/>)
		    										</div>
		    							
		    										<div class="exam-selection">
		    											<span class="op-item">
		    									    	   <span>A.</span>
		    											   <span>Update software</span>
		    											</span>
		    										    <span class="op-item">
		    							                	<span>B.</span>
		    											   <span>Update software</span>
		    											</span>
		    											<span class="op-item">
		    									    	    <span>C.</span>
		    											<span>Update software</span>
		    											</span>
		    											<span class="op-item">
		    									    		<span>D.</span>
		    											<span>Update software</span>
		    											</span>
		    										</div>
		    									</div>
		    									
		    								</div>
		    							</div>
		    							
		      
                                    </li>
                               </ul>
                               <ul>
                                    <li>二.填空题</li>
		    						<li>
		    							<div class="exam-content">
		    								<div class="exam-question">
		    						
		    								</div>
		    								<div class="exam-qlist">
		    									<div class="exam-content">
		    										<div class="exam-question">
		    											<input type="checkbox" />&nbsp;&nbsp;&nbsp;&nbsp;1.统一资源定位符URL完整格式是<input type="text" class="tk-que" size="12" placeholder=""/>
		    										</div>
		    						
		    										
		    									</div>
		    						
		    								</div>
		    							</div>
		    						
		    						</li>
		    						<li>
		    							<div class="exam-content">
		    								<div class="exam-question">
		    						
		    								</div>
		    								<div class="exam-qlist">
		    									<div class="exam-content">
		    										<div class="exam-question">
		    											<input type="checkbox" />&nbsp;&nbsp;&nbsp;&nbsp;1.统一资源定位符URL完整格式是<input type="text" class="tk-que" size="12" placeholder=""/>
		    										</div>
		    						
		    									</div>
		    						
		    								</div>
		    							</div>
		    						
		    						</li>
		    				    </ul>
		    				    <ul>
		    				    	<li>三 .解答题</li>	    	
		    						<li>
		    							<div class="exam-content">
		    								<div class="exam-question">
		    						            
		    								</div>
		    								<div class="exam-qlist">
		    									<div class="exam-content">
		    										<div class="exam-question">
		    											<input type="checkbox" />&nbsp;&nbsp;&nbsp;&nbsp;1.已知函数f(x)＝lnx²+2a/x(a∈R)
		    											<br>&nbsp;&nbsp;&nbsp;&nbsp;(1)当a=-2时，求曲线y=f(x)在点(1,f(1))处的切线方程. 
		    											<br>&nbsp;&nbsp;&nbsp;&nbsp;(2)当a＞0时.   
		    											<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（i）讨论函数f(x)的单调性；   
		    											<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（ii）若函数f(x)在区间[1,e]上最小的值是3，求a的值.  
		    										</div>
		    						
		    										
		    									</div>
		    						
		    								</div>
		    							</div>
		    						
		    						</li>
		    					</ul>
		    						
		    				</div>
		    	
		    			</div>
		    			<!-- 试卷管理 end -->
		    			
		    			
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
	    								<div class="tb_information">教师XXX</div>
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
		  <!-- 修改试题模态框 -->
	    <div class="modal fade "  id="modify-paper" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	    	<div class="modal-dialog">
	    		<div class="modal-content">
	    			<div class="modal-header">
	    				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
	    					&times;
	    				</button>
	    				<h4 class="modal-title" id="myModalLabel">
	    					修改试题
	    				</h4>
	    			</div>
	    			<div class="modal-body modify-body">
	    		        	<div>题&nbsp;&nbsp;干:<input type="text" /></div>	    		        	
	    		        	<div id="msa">选项A:<input type="text" /></div>
	    		        	<div id="msb">选项B:<input type="text" /></div>
	    		        	<div id="msc">选项C:<input type="text" /></div>
	    		        	<div id="msd">选项D:<input type="text" /></div>  
	    		        	<div><button type="button" class="btn btn-primary" id="add-selection">+新增选项</button></div>
	    		        	<div id="mse">选项E:<input type="text" /></div> 
	    		        	<div id="msf">选项F:<input type="text" /></div>   
	    		        	<div>答&nbsp;&nbsp;案:<input type="text" /></div>
	    		        	        
	    		           
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
</html>
