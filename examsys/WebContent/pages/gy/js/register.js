function checkEmail(){    
	var id = $("#email").val();
	//焦点移除的时候进行验证
	var myid =/^\w+@[a-zA-Z0-9]{2,10}(?:\.[a-z]{2,4}){1,3}$/;
	if(!myid.test(id)) {
        	//如果邮箱的格式与正则的不符合，就提醒
        	toastr.error("邮箱格式有误");        
               return false;
           }
        return true;
      
    }

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
			if( !checkEmail() ){
    			return;
    		}
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
						//alert(data.result);//success fail exist
						if("exist"==data.result) {
							toastr.warning("用户已被注册！");
						} else if("fail"==data.result) {
							toastr.error("注册失败！");
						} else if("success"==data.result) {
							toastr.success("注册成功！");
							setTimeout(function(){
								location.href = "login.jsp";
							}, 500);
						}
					}
				});
			}else{
				alert("两次密码输入不一致！")
				
			}
		
			
		}
		
}

