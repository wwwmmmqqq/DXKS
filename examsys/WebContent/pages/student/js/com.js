$(function (){
	/*modifyInfo();
	function modifyInfo(){
		
		var sname=$('.basic-info input[name="name"]').val();
		var ssex=$('.basic-info input[name="sex"]').val();
		var scollegeName=$('.basic-info input[name="collegeName"]').val();
		var sdepartment=$('.basic-info input[name="department"]').val();
		var sprofession=$('.basic-info input[name="profession"]').val();
		var sidcard=$('.basic-info input[name="idcard"]').val();
		var sphone=$('.basic-info input[name="phone"]').val();
		var semail=$('.basic-info input[name="email"]').val();
		 $.post("updateStuInfos", {
		  fields:["name","sex","collegeName","department","profession","idcard","phone","email"],
		  values:[sname,ssex,scollegeName,sdepartment,sprofession,sidcard,sphone,semail]
	  }, function(data) {
		  alert("s")
		  if(data.result == 'success') {
			  toastr.success("修改成功！");
		  } else {
			  toastr.warning("修改失败！");
		  }
	  });
	}
 */
})
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
		'<td><input type="text"class="form-control"name="user.newpwd"/></td>' +
		'</tr>' +
		'<tr>' +
		'<td>确认密码</td>' +
		'<td><input type="text"class="form-control"name="user.repwd"/></td>' +
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
					toastr.success("密码修改成功！");
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

function modiInfo(){
	var sid=$('.info-body input[name="user.userId"]').val();
	var sname=$('.info-body input[name="user.name"]').val();
	var ssex=$('.info-body input[name="user.sex"]').val();
	var scollegeName=$('.info-body input[name="user.collegeName"]').val();
	var sdepartment=$('.info-body input[name="user.permission"]').val();
	var sprofession=$('.info-body input[name="user.profession"]').val();
	var sidcard=$('.info-body input[name="user.idcard"]').val();
	var sphone=$('.info-body input[name="user.phone"]').val();
	var semail=$('.info-body input[name="user.email"]').val();
	
	$.post("editUser", {
		"user.userId" : sid,
		"user.name" : sname,
		"user.sex":ssex,
		"user.collegeName":scollegeName,
		"user.permission":sdepartment,
		"user.profession":sprofession,
		"user.idcard":sidcard,
		"user.phone":sphone,
		"user.email":semail
	}, function(data) {
		toastr.success("密码修改成功！");
	})
}


/*修改信息前显示信息*/
function showInfo(){
	var userid=$('.basic-info input').val();
	$.post("showUser", {
		"user.userId" :userid
	}, function(data) {
		$('#my-info').find('input').each(function(){
			var na = $(this).attr('name').split(".")[1];
			$(this).val(data.user[na]);
		})
	})
}
