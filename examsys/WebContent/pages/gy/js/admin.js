var currentPage = 1;
loadDatas(2);
function loadDatas(page) {
	$.post("selectUserList", {
		"user.type" : "Single",
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
	var li = data.userList;// 学生列表
	for (var i = 0; i < li.length; i++) {
		html += getHtmls(i + 1, li[i].name, li[i].userId, li[i].collegeName,
				li[i].type, li[i].email);
	}
	$('#data-box').html(html);
}

function getHtmls(index, name, stuid, collegeName, type, email) {
	var htm = "<tr class='tb_width'>" + "	<td>"
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
			+ "		<i class='fa fa-eye see_information'  data-toggle='modal' data-target='#myModal_see_information'></i>"
			+ "		<i class='fa fa-pencil check' data-toggle='modal' data-target='#myModal_correct_information'></i>"
			+ "		<i class='fa fa-trash-o' onclick='myFunction1()'></i>"
			+ "	</td>" + "</tr>";
	return htm;
}

// 添加用户
function addJw() {
var jname=$('.add-jw input[name="name"]').val();
var juserid=$('.add-jw input[name="userid"]').val();
var jcollegeName=$('.add-jw input[name="collegeName"]').val();
var jsex=$("input[name='rd']:checked").val();
var jphone=$('.add-jw input[name="phone"]').val();
var jmail=$('.add-jw input[name="mail"]').val();
$.post("createUser",
		 {	"user.userId":juserid,   //用户名
	        "user.name":jname,
	        "user.collegeName":jcollegeName,
	 		"user.sex":jsex,						//用户性别
	 		"user.phone":jphone,
	 		"user.mail":jmail
	 	},function(data){
	 		alert(data.result);    //message为user返回信息
		 }
	)
	$("input[name='rd']:checked").val();

}

/*//admin条件搜索  gy也不清楚是不是这样写

function select(){
	var jname=$('#hide input[name="name"]').val();
	var jid=$('#hide input[name="id"]').val();
	$(".select_hide option:checked").val();
	var jschool=$('#hide input[name="school1"]').val();
	var jinstitute=$('#hide input[name="institute1"]').val();
	$.post("")
	
}
*/	
	
