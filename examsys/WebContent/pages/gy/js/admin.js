var currentPage = 1;
loadDatas(1);
var totalPage=1;
function loadDatas(page) {
	$.post("selectUserList", {
		"user.type":"教务",
		"page" : page
	}, callback)
	currentPage = page;
}

function nextPage() {
	currentPage++;
	loadDatas(currentPage);
}
function prevPage() {
	if (currentPage >= 2) {
		currentPage--;
		loadDatas(currentPage);
	}
}

function callback(data) {
	var html = "";
	var ht="";
	totalPage=data.totalPage;
	var li = data.userList;// 学生列表
	for (var i = 0; i < li.length; i++) {
		var number=(currentPage-1)*10;
	  	number +=i+1;
		html += getHtmls(number, li[i].name, li[i].userId, li[i].collegeName,
				li[i].type, li[i].email);
	}
	$('#data-box').html(html);
	for(var j=1;j<=totalPage;j++) {
		 ht += getLiHtml(j);
	 }
	 $('.pagination').html(ht);
}

function getHtmls(index, name, stuid, collegeName, type, email) {
	var htm = "<tr class='tb_width'>" + "<td>"
			+ index
			+ "</td>"
			+ "	<td>"
			+ name
			+ "</td>"
			+ "	<td>"
			+ stuid
			+ "</td>"
			+ "	<td>"
			+ collegeName
			+ "</td>"
			+ "	<td>"
			+ type
			+ "</td>"
			+ "	<td>"
			+ email
			+ "</td>"
			+ "	<td class='see' data-toggle='modal' data-target='#myModal_see'>查看权限</td>"
			+ "	<td>"
			+ "		<i class='fa fa-eye see_information'  data-toggle='modal' data-target='#myModal_see_information' onclick='administrationInfo(this)'><input type='hidden' id='"+stuid+"' /></i>"
			+ "		<i class='fa fa-pencil check' data-toggle='modal' data-target='#myModal_correct_information' onclick='administrationInfo(this)'><input type='hidden' id='"+stuid+"' /></i>"
			+ "		<i class='fa fa-trash-o' onclick='deleteStudent(this)'><input type='hidden' id='"+stuid+"' /></i>"
			+ "	</td>" + "</tr>";
	return htm;
}

function getLiHtml(index) {
	if(index==1){
		var ht = "<li class='page-item'><a class='page-link' href='javascript:prevPage()'>上一页</a></li>"
			+"<li class='page-item'><a class='page-link' href='javascript:loadDatas(1)'>"+index+"</a></li>";
	}
	else if(index==totalPage){
		var ht = "<li class='page-item'><a class='page-link' href='javascript:loadDatas("+index+")'>"+index+"</a></li>"
			+"<li class='page-item'><a class='page-link' href='javascript:nextPage()'>下一页</a></li>";
	}
	else {
		var ht = "<li class='page-item active'><a class='page-link ' href='javascript:loadDatas("+index+")'>"+index+"</a></li>";
	}
	return ht;    
}
// 添加用户
function addJw() {
var jname=$('.add-jw input[name="name"]').val();
var juserid=$('.add-jw input[name="userid"]').val();
var jcollegeName=$('.add-jw input[name="collegeName"]').val();
var jsex=$("input[name='rd']:checked").val();
var jphone=$('.add-jw input[name="phone"]').val();
var jmail=$('.add-jw input[name="email"]').val();
$.post("createUser",
		 {	"user.userId":juserid,   //用户名
	        "user.name":jname,
	        "user.collegeName":jcollegeName,
	 		"user.sex":jsex,						//用户性别
	 		"user.phone":jphone,
	 		"user.email":jmail
	 	},function(data){
	 		if(data.result=="用户创建成功") {   //result为user返回信息
			  	alert(data.result);
	 			location.href="admin.jsp";
		  	}   
		 }
	)
	$("input[name='rd']:checked").val();
}

function administrationInfo(node) {
	var userId=node.childNodes ;
	$.post("showUser",{"user.userId":userId[0].id},function(data) {
		var user = data.user;
		var info = getInfoHtml(user);
		$('#administration-info-box').html(info);
		/*$('#administration_psw').val(user.psw);*/
		var permission = user.permission;
		var strs=permission.split(" ");
		var permission_answer = strs[0];
		var permission_paper = strs[1];
		$('#administration_name').html(user.name);
		$('#administration_sex').html(user.sex);
		$('#administration_userId').html(user.userId);
		$('#administration_collegeName').html(user.collegeName);
		$('#administration_email').html(user.email);
		$('#administration_permission_answer').val(permission_answer);
		$('#administration_permission_paper').val(permission_paper);
		$('#administration_phone').html(user.phone);
	})
}	

function getInfoHtml(obj) {
	var info = "<tr>"
		+"<td>"
		+"姓名"
		+"<div class='tb_information'>"+obj.name+"</div>"
		+"</td>"
		+"</tr>"
		+"<tr>"
		+"<td>"
		+"工号"
		+"<div class='tb_information'>"+obj.userId+"</div>"
		+"</td>"
		+"</tr>"
		+"<tr>"
		+"<td>"
		+"学校"
		+"<div class='tb_information'>"+obj.collegeName+"</div>"
		+"</td></tr>"
		+"<tr><td>"
		+"性别"
		+"<div class='tb_information'>"+obj.sex+"</div>"
		+"</td></tr>"
		+"<tr><td>"
		+"联系方式"
		+"<div class='tb_information'>"+obj.phone+"</div>"
		+"</td></tr>"
		+"<tr><td>"
		+"邮箱"
		+"<div class='tb_information'>"+obj.email+"</div>"
		+"</td></tr>"
		+"<tr><td>"
		+"权限"
		+"<div class='tb_information'>"+obj.permission+"</div>"
		+"</td></tr>"
		;
	return info;
}

function editStudent() {
	var permission = $('#administration_permission_answer').val()+" "+$('#administration_permission_paper').val();
	$.post("editUser",
				{	
					"user.name":$('#administration_name').text(),
					"user.sex":$('#administration_sex').text(),
					"user.userId":$('#administration_userId').text(),
					"user.collegeName":$('#administration_collegeName').text(),
					"user.email":$('#administration_email').text(),
					"user.permission":permission,
					"user.phone":$('#administration_phone').text()
				},function(data) {
					if(data.result=="编辑用户成功") {
						alert(data.result);
				  	location.href="admin.jsp";
			  	}
		  });
}

function deleteStudent(node) {
	var td = node.childNodes;
	var userId = td[0].id;
	if(confirm("确定要删除该用户吗？")) {
		$.post("deleteUser",{"user.userId":userId},function(data) {
			if(data.result=="删除成功") {
					location.href="admin.jsp";
			}
	  }); 
	}  
	return false;
}

function Out() {
	if(confirm("确定要退出吗？")) {
		$.post("loginOut",null,function(data) {
			if(data.result=="成功退出") {
					location.href="../gy/gy_login.jsp";
			}
	  });
	}  
}