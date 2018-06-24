function register_ajax(){
	console.log("ajax");
	var user_name=$("input[name='user_name']").val();
	var user_psw=$("input[name='user_psw']").val();
	var user_email=$("input[name='user_email']").val();
	var user_psw1=$("input[name='user_psw1']").val();
	var formData=new FormData();
		formData.append("user.userId",user_name);
		formData.append("user.psw",user_psw);
		formData.append("user.email",user_email);
		
		if(user_name==""||user_psw==""||user_email==""||user_psw1==""){
			alert("请输入信息")
		}else{
			
			if(user_psw==user_psw1){
				
				$.ajax({
					url:"registUser",
					type:"post",
					data:formData,
					//报错加入以下三行，则ajax提交无问题
					cache:false,
					processData:false,
					contentType:false,
					success: function (data){
						alert(data.result);//success fail exist
					}
				});
			}else{
				alert("两次密码输入不一致！")
				
			}
		
			
		}
		
}