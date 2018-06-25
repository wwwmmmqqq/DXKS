$(function (){
	/* $.fn.serializeObject = function(){
         var o = {};
         var a = this.serializeArray();
         $.each(a, function() {
             if (o[this.name] !== undefined) {
                 if (!o[this.name].push) {
                     o[this.name] = [o[this.name]];
                 }
                 o[this.name].push(this.value || '');
             } else {
                 o[this.name] = this.value || '';
             }
         });
         return o;
     };
     
     $('#modify-button').click(function(){
    	 $.ajax({
             url:"editUser", 
             type:"post",
             data:JSON.stringify($('#my-info').serializeObject()),
             contentType: 'application/json', 
             datatype:"json",
             success:function(data){
                alert("修改成功")
             },error: function(XMLHttpRequest) {
                 console.log("错误状态："+XMLHttpRequest.status);
               }
         })
     })*/
        


	
 
})
	/*function modifyInfo(){
	var sid=$('.info-body input[name="user.userId"]').val();
		var sname=$('.info-body input[name="user.name"]').val();
		var ssex=$('.info-body input[name="user.sex"]').val();
		var scollegeName=$('.info-body input[name="user.collegeName"]').val();
		var sdepartment=$('.info-body input[name="user.permission"]').val();
		var sprofession=$('.info-body input[name="user.profession"]').val();
		var sidcard=$('.info-body input[name="user.idcard"]').val();
		var sphone=$('.info-body input[name="user.phone"]').val();
		var semail=$('.info-body input[name="user.email"]').val();
		alert(sname)
		 $.post("updateStuInfos", {
		  fields:["userId","name","sex","collegeName","department","profession","idcard","phone","email"],
		  values:[sid,sname,ssex,scollegeName,sdepartment,sprofession,sidcard,sphone,semail]
	  }, function(data) {
		  if(data.result == 'success') {
			alert("修改成功")
		  } else {
		  }
	  });
	}*/
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
/*修改信息*/
/*function modifyInfosss(){
	var xhr = false;
	xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function() {
		var message;
		if (xhr.readyState == 4) {
			if (xhr.status == 200) {
				console.debug(xhr.responseText)
			} else {
			}
		}
	}
	 var myinfo=document.getElementById("my-info");
	 var formData = new FormData(myinfo);
	 
	 xhr.open("POST", "editUser");
	 alert(formData)
	 xhr.send(formData);
	 //表单转json函数
   
}*/
//获取url中的参数
	function getParam(name) {
	  var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i"); //匹配目标参数
	  var result = window.location.search.substr(1).match(reg); //匹配目标参数
	  if (result != null) 
	  	return decodeURIComponent(result[2]);
	  return null;
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