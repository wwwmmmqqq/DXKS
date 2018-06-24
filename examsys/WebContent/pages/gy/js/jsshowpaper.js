$(function(){
	/*删除题库*/
	$('.delete-btn').click(function(){
		var questionId = $(this).siblings('input').val();
		$.confirm({
			title : '确认删除？',
			smoothContent : false,
			content : "若确认删除该题将从题库中删除，请小心操作！",
			buttons : {
				deleteUser : {
					btnClass : 'btn-blue',
					text : '确定',
					action : function() {
						$.post("deleteItemBank",
								{
							
							  		"question.sid":questionId
							 	},
								 function(data){
							 		if(data.result=="题目删除成功！"){
							 			toastr.success("题目删除成功！")
							 			 location.reload();
							 		}
							})
					}
				},
				cancelAction : {
					btnClass : 'btn-default',
					text : '取消',
				}
			}
		});

	})
})

