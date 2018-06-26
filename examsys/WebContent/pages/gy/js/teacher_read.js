function importScore(){
	$('.num').find('input[type="hidden"]').each(function(){
		var answerid=$(this).val();
	})
	$('.num').find('input[type="text"]').each(function(){
		var sanswer=$(this).val();
	})
	$.post("checkQuestion",
			{
		  		"answer.sid":answerid,
		  		"answer.scoring":sanswer,   
		 	},
			 function(data){
		 		  if(data.result == 'fail') {
					  alert('提交失败');
				  } else {
					  alert('提交成功');
				  }
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