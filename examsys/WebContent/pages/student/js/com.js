$(function (){
	modifyInfo();
	function modifyInfo(){
		
		var sname=$('.basic-info input[name="n    ame"]').val();
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
			  alert('修改成功');
		  } else {
			  alert('修改失败');
		  }
	  });
	}
	

})