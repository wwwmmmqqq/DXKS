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
		html += getHtmls(i + 1, li[i].name, li[i].userId, li[i].collegeName,
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
			
			+ "	<td>"
			+ "		<i class='fa fa-eye see_information'  data-toggle='modal' data-target='#myModal_see_information' onclick='administrationInfo(this)'><input type='hidden' id='"+stuid+"' /></i>"
			+ "		<i class='fa fa-pencil check' data-toggle='modal' data-target='#myModal_correct_information' onclick='administrationInfo(this)'><input type='hidden' id='"+stuid+"' /></i>"
			+ "		<i class='fa fa-trash-o' onclick='myFunction1()'></i>"
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
	 			toastr.success("成功添加用户");
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
		
		$('#administration_name').val(user.name);
		$('#administration_sex').val(user.sex);
		$('#administration_userId').val(user.userId);
		$('#administration_collegeName').val(user.collegeName);
		$('#administration_email').val(user.email);
		$('#administration_permission').val(user.permission);
		$('#administration_phone').val(user.phone);
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