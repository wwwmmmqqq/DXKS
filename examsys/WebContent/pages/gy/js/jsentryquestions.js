$(document).ready(function(){
	$("#single-choice").click(function(){
		$(".choices").show();
		$(".choicesw").hide();
		$(".ture-or-false").hide();
		$(".fill-and-judgement").hide();
		$(".answer-question").hide();
	});
	$("#mutiple-choice").click(function(){
		$(".choicesw").show();
		$(".choices").hide();
		$(".ture-or-false").hide();
		$(".fill-and-judgement").hide();
		$(".answer-question").hide();
	});
	$("#ture-or-false").click(function(){
		$(".choices").hide();
		$(".choicesw").hide();
		$(".ture-or-false").show();
		$(".fill-and-judgement").hide();
		$(".answer-question").hide();
	});
	$("#fill-in").click(function(){
		$(".choices").hide();
		$(".choicesw").hide();
		$(".ture-or-false").hide();
		$(".fill-and-judgement").show();
		$(".answer-question").hide();
	});
	$("#answer-questions").click(function(){
		$(".choices").hide();
		$(".choicesw").hide();
		$(".ture-or-false").hide();
		$(".fill-and-judgement").hide();
		$(".answer-question").show();
	});
});
