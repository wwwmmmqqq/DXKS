	var questionId=$('#questionid').val();
function deleteInfo(){
	var questionId = getParam("sid");
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
}
/*删除题库*/
function deleteQuestion(){
	deleteInfo();
}
/*修改题库*/
/*function editItemBankByUser(){
	alert("ddd")
	 $.post("editItemBankByUser",
				{
		 "question.sid":questionId
			 	},
				 function(data){
			 		$('#dry textarea').val(data.qustion);
			 		$('.que-option').find('input,textarea').each(function(){
			 		$(this).val(data.option);
			 		})
			}) 
	
}*/

//获取url中的参数

function getParam(name) {
  var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i"); //匹配目标参数
  var result = window.location.search.substr(1).match(reg); //匹配目标参数
  if (result != null) 
  	return decodeURIComponent(result[2]);
  return null;
}
function getQuestionData(){
	var htm=
		"<div class='qtype'>"
		+"	<p class='information'>"
		+"		<span>选择题型：单选题</span>"
		+"		<span>难易度：简单</span>"
		+"		<span>知识点：英语阅读理解能力 </span>"
		+"	</p>"
		+"	<div class='operation'>"
		+"		<ul>"
		+"			<li>"
		+"				<button class='btn btn-default btn-xs' data-toggle='modal' data-target='#modify-'>"
		+"					<i class='fa fa-pencil'></i>"
		+"</button>"
		+"			</li>"
		+"			<li>" 
		+"				<button class='btn btn-default btn-xs' onclick='myFunction1()'>"
		+"					<i class='fa fa-times'></i>"
		+"				</button>"
		+"			</li>"
		+"		</ul>"
		+"	</div>"
		+"</div>"
		+"<ul>"
		+"	<li class='question'># 下列说法正确的是()</li>"
		+"	<li>A. Update software</li>"
		+"	<li>B. Clean database</li>"
		+"	<li>C. Cron job running</li>"
		+"	<li>D. Fix and squish bugs</li>"
		+"	<li>正确答案：D</li>"
		+"</ul>"
		return htm;
}
