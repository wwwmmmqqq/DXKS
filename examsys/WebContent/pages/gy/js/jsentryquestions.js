	
$(function() {

	$("#single-choice").click();
	$("#single-choice").click(function() {
		$(".choices").show();
		$(".choicesw").hide();
		$(".ture-or-false").hide();
		$(".fill-and-judgement").hide();
		$(".answer-question").hide();
	});
	$("#mutiple-choice").click(function() {
		$(".choicesw").show();
		$(".choices").hide();
		$(".ture-or-false").hide();
		$(".fill-and-judgement").hide();
		$(".answer-question").hide();
	});
	$("#ture-or-false").click(function() {
		$(".choices").hide();
		$(".choicesw").hide();
		$(".ture-or-false").show();
		$(".fill-and-judgement").hide();
		$(".answer-question").hide();
	});
	$("#fill-in").click(function() {
		$(".choices").hide();
		$(".choicesw").hide();
		$(".ture-or-false").hide();
		$(".fill-and-judgement").show();
		$(".answer-question").hide();
	});
	$("#answer-questions").click(function() {
		$(".choices").hide();
		$(".choicesw").hide();
		$(".ture-or-false").hide();
		$(".fill-and-judgement").hide();
		$(".answer-question").show();
	});

})

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
			alert("单选题录入成功！")
		}
		if(radios[1].checked){
			xhr.send(formData2);
			alert("多选题录入成功！")
		}
		if(radios[2].checked){
			xhr.send(formData3);
			alert("判断题录入成功！")
		}
		if(radios[3].checked){
			xhr.send(formData4);
			alert("填空题录入成功！");
		}
		if(radios[4].checked){
			xhr.send(formData5);
			alert("简答题录入成功！");
		}
	}
}