var optionsHtml = "";
loadSubjects();
function loadSubjects() {
	$.post("loadSubjects", null, function(data) {
		var list = data.list;
		var s = "";
		for(var i=0;i<list.length;i++) {
			var item = list[i];
			s += "<option value='"+item.sid+"'>"+item.name+"</option>"
		}
		optionsHtml = s;
	});
}

//单选
$(function(){
	/*$("#single-choice").click();*/
	$('#single-choice').click(function(){
		getHtm();
	})
	
	function getHtm(){
		var htm="";
		htm+=getQuestion1(htm)
		$("#que").html(htm);
	}	

//多选
	$('#mutiple-choice').click(function(){
		getHtm1();
	})
	function getHtm1(){
		var htm1="";
		htm1 += getQuestion2(htm1)
		$("#que").html(htm1);
	}
//判断
	$('#ture-or-false').click(function(){
		getHtm2();
	})
	function getHtm2(){
		var htm2="";
		htm2 += getQuestion3(htm2)
		$("#que").html(htm2);
	}
//填空
	$('#fill-in').click(function(){
		getHtm3();
	})
	function getHtm3(){
		var htm3="";
		htm3 += getQuestion4(htm3)
		$("#que").html(htm3);
	}
	
//解答
	$('#answer-questions').click(function(){
		getHtm4();
	})
	function getHtm4(){
		var htm4="";
		htm4 += getQuestion5(htm4)
		$("#que").html(htm4);
	}
});

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
function getQuestion1(str){

	var htm=
		"<div class='choices'>"
			+"<form class='choose' id='s-question'>"
			+"<input type='hidden' value='Single' name='question.type'>"
			+"<ul>"
			+"<li>请选择科目："
			+"<select class='sub form-control' name='question.subjectRef'>"
			+ optionsHtml
			+"</select>"
			+"难易程度"
			+"<select class='sub form-control' name='question.difficultyValue'>"
			+"<option value='1'>简单</option>"
			+"<option value='2'>中等</option>"
			+"<option value='3'>一般</option>"
			+"<option value='4'>困难</option>"
			+"</select>"
			+"</li>"
				+"<li id='dry'>题干"
				+"<textarea name='question.title' id='question'></textarea></li>"
				    +"<li id='sa'>A&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class='form-control ' type='text' name='option[0].isAnswer' /></li>"
				    +"<li id='sb'>B&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class='form-control ' type='text' name='option[1].isAnswer' /></li>"
				    +"<li id='sc'>C&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class='form-control ' type='text' name='option[2].isAnswer' /></li>"
				    +"<li id='sd'>D&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class='form-control ' type='text' name='option[3].isAnswer' /></li>"
				    +"<li id='answer' class='answerw'>答&nbsp;&nbsp;案&nbsp;"
							+"<span>A</span><input type='radio' name='option[0].isAnswer' class='choose1'/>"
							+"<span>B</span><input type='radio' name='option[1].isAnswer' class='choose1'/>"
							+"<span>C</span><input type='radio' name='option[2].isAnswer' class='choose1'/>"
							+"<span>D</span><input type='radio' name='option[3].isAnswer' class='choose1'/>"
					+"</li>"
				    +"<li id='knowledge'>知识点<input class='form-control' type='text' name='question.knowledge'/></li>"
			    +"</ul>"
			+"</form>"
		+"</div>"
	return htm;
}
function getQuestion2(str){
	//多选
	var htm1=
		"<div class='choicesw'>"
			+"<form class='choose' id='w-question'>"
			+"<input type='hidden' value='Multiple' name='question.type'>"
				+"<ul>"
				+"<li>请选择科目："
				+"<select  class='sub form-control' name='question.subjectRef'>"
				+ optionsHtml
				+"</select>"
				+"难易程度"
				+"<select class='sub form-control' name='question.difficultyValue'>"
				+"<option value='1'>简单</option>"
				+"<option value='2'>中等</option>"
				+"<option value='3'>一般</option>"
				+"<option value='4'>困难</option>"
				+"</select>"
				+"</li>"
				+"<li id='dry'>题干&nbsp;<textarea name='question.title'></textarea></li>"
				   +" <li id='sa'>A&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class='form-control ' type='text' name='question.content'/></li>"
				    +"<li id='sb'>B&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class='form-control ' type='text' name='question.content'/></li>"
				    +"<li id='sc'>C&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class='form-control ' type='text' name='question.content' /></li>"
				    +"<li id='sd'>D&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class='form-control ' type='text' name='question.content' /></li>"
				    +"<li id='answer' class='answerw'>答案&nbsp;"
							+"<span>A</span><input type='checkbox'  class='choose1' name='question.isAnswer'/>"
							+"<span>B</span><input type='checkbox'  class='choose1'  name='question.isAnswer'/>"
							+"<span>C</span><input type='checkbox'  class='choose1'  name='question.isAnswer'/>"
							+"<span>D</span><input type='checkbox'  class='choose1' name='question.isAnswer'/>"
					+"</li>"
				    +"<li id='knowledge'>知识点<input class='form-control' type='text' name='question.knowlege'/></li>"
			    +"</ul>"
			+"</form>"
		+"</div>"
	return htm1;
}
function getQuestion3(str){
	//判断
	var htm2=
		"<div class='ture-or-false'>"
			+"<form class='choose' id='tf-question'>"
			+"<input type='hidden' value='TrueOrFalse' name='question.type'>"
			+"<ul>"
			+"<li>请选择科目："
			+"<select class='sub form-control' name='question.subjectRef'>"
			+ optionsHtml
			+"</select>"
			+"难易程度"
			+"<select class='sub form-control' name='question.difficultyValue'>"
			+"<option value='1'>简单</option>"
			+"<option value='2'>中等</option>"
			+"<option value='3'>一般</option>"
			+"<option value='4'>困难</option>"
			+"</select>"
			+"</li>"
					+"<li id='dry'>题干<textarea name='question.title'></textarea></li>"
				    +"<li id='sa'>A&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class='form-control ' type='text' name='question.content' /></li>"
				    +"<li id='sb'>B&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class='form-control ' type='text' name='question.content' /></li>"
				    +"<li id='answer' class='answerw'>答&nbsp;&nbsp;案&nbsp;"
							+"<span>A</span><input type='radio' name='question.isAnswer' class='choose1'/>"
							+"<span>B</span><input type='radio' name='question.isAnswer' class='choose1'/>"
					+"</li>"
				    +"<li id='knowledge'>知识点<input class='form-control' type='text' name='question.knowledge'/></li>"
			   +"</ul>"
		     +"</form>"
		 +"</div>"
	return htm2;
}
function getQuestion4(str){
	//填空
	var htm3=
		"<div class='fill-and-judgement'>"
			+"<form class='choose' id='fj-question'>"
			+"<input type='hidden' value='Fills' name='question.type'>"
			+"<ul>"
			+"<li>请选择科目："
			+"<select class='sub form-control' name='question.subjectRef'>"
			+ optionsHtml
			+"</select>"
			+"难易程度"
			+"<select class='sub form-control' name='question.difficultyValue'>"
			+"<option value='1'>简单</option>"
			+"<option value='2'>中等</option>"
			+"<option value='3'>一般</option>"
			+"<option value='4'>困难</option>"
			+"</select>"
			+"</li>"
					+"<li id='dry'>题&nbsp;&nbsp;干&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<textarea name='question.title'></textarea></li>"    					
					+"<li id='answer'>答&nbsp;&nbsp;案&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class='form-control' type='text' name='question.fillsText' /></li>"   
					+"<li id='knowledge'>涉及知识点<input class='form-control' type='text' name='question.knowledge'/></li>"   
				+"</ul>"   
			+"</form>"   
		+"</div>"   
	return htm3;
}
	//解答
function getQuestion5(str){
	var htm4=
		"<div class='answer-question'>"
			+"<form class='choose' id='aquestion'>"
			+"<input type='hidden' value='Subjective' name='question.type'>"
			+"<ul>"
			+"<li>请选择科目："
			+"<select class='sub form-control' name='question.subjectRef'>"
			+ optionsHtml
			+"</select>"
			+"难易程度"
			+"<select class='sub form-control' name='question.difficultyValue'>"
			+"<option value='1'>简单</option>"
			+"<option value='2'>中等</option>"
			+"<option value='3'>一般</option>"
			+"<option value='4'>困难</option>"
			+"</select>"
			+"</li>"
					+"<li id='dry'>题&nbsp;&nbsp;干&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<textarea name='question.title'></textarea></li>"
					+"<li id='answer'>答&nbsp;&nbsp;案&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<textarea name='question.subjectiveText'></textarea></li>"
					+"<li id='knowledge'>涉及知识点<input class='form-control' type='text' name='question.knowledge'/></li>"
				+"</ul>"
			+"</form>"
		+"</div>"
	return htm4;
}
	








function importQuestion() {
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
	var squestion = document.getElementById("s-question");
	var wquestion = document.getElementById("w-question");
	var tfquestion = document.getElementById("tf-question");
	var fjquestion=document.getElementById("fj-question");
	var answerquestion=document.getElementById("answer-question");
	
	var formData1 = new FormData(squestion);
	var formData2 = new FormData(wquestion);
	var formData3 = new FormData(tfquestion);
	var formData4 = new FormData(fjquestion);
	var formData5 = new FormData(answerquestion);
	xhr.open("POST", "createItemBank");
	
	var radios=document.getElementsByName("1");
	for(i=0;i<radios.length;i++){
		if(radios[0].checked){
			xhr.send(formData1);
			toastr.success("单选题录入成功");
			//squestion.reset();
		}
		if(radios[1].checked){
			xhr.send(formData2);
			toastr.success("多选题录入成功");
			//wquestion.reset();
		}
		if(radios[2].checked){
			xhr.send(formData3);
			toastr.success("判断题录入成功");
			//tfquestion.reset();
		}
		if(radios[3].checked){
			xhr.send(formData4);
			toastr.success("填空题录入成功");
			//fjquestion.reset();
		}
		if(radios[4].checked){
			xhr.send(formData5);
			toastr.success("简答题录入成功");
			//answerquestion.reset();
		}
	}
}


