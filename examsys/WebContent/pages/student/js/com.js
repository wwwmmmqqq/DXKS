$(function (){

})
  function setPassword(){
	   var str = '<form id="user_setting" action="">' +
		'<table style="width:100%;">' +
		'<tbody>' +
		'<tr>' +
		'<td>旧密码</td>' +
		'<td><input type="text" class="form-control" name="user.oldpwd"/></td>' +
		'</tr>' +
		'<tr>' +
		'<td>新密码</td>' +
		'<td><input type="password" class="form-control"name="user.newpwd"/></td>' +
		'</tr>' +
		'<tr>' +
		'<td>确认密码</td>' +
		'<td><input type="password" class="form-control"name="user.repwd"/></td>' +
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

function checkPhone(){    
	var mobile = $("#student_phone").val();
	//焦点移除的时候进行验证
	var myreg =/^[1][3,4,5,7,8][0-9]{9}$/; 
	console.log(myreg.test(mobile));
	//手机的格式
        if (!myreg.test(mobile)) {   			//如果手机号码的格式与正则的不符合，就提醒
       
        	toastr.error("手机号格式有误");        
               return false;
           }
	
        return true;
    }
function checkIdCard(){   
	
	var id = $("#student_idcard").val();
	//焦点移除的时候进行验证
	var myid = /^[1-9]{1}[0-9]{14}$|^[1-9]{1}[0-9]{16}([0-9]|[xX])$/;
	if(!myid.test(id)) {
        	//如果手机号码的格式与正则的不符合，就提醒
        	toastr.error("身份证格式有误");        
               return false;
           }
        return true;
      
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
	if(!checkPhone()||!checkIdCard() ){
		return;
	}
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
/*退出系统*/
function Out() {
	if(confirm("确定要退出吗？")) {
		$.post("loginOut",null,function(data) {
			if(data.result=="成功退出") {
					location.href="../gy/login.jsp";
			}
	  });
	}  
}

