/*选择题型后显示录入题库输入框 */
$(document).ready(function(){
//	$("input[name='radio'][value=single-choice]").attr("checked",true);
	
	$("#single-choice").click(function() {
		$(".choices").show();
	});
	$("#mutiple-choice").click(function() {
		$(".choices").show();
		$(".fill-and-judgement").hide();
		$(".answer-question").hide();
	});
	$("#ture-or-false").click(function() {
		$(".choices").hide();
		$(".fill-and-judgement").show();
		$(".answer-question").hide();
	});
	$("#fill-in").click(function() {
		$(".choices").hide();
		$(".fill-and-judgement").show();
		$(".answer-question").hide();
	});
	$("#answer-questions").click(function() {
		$(".choices").hide();
		$(".fill-and-judgement").hide();
		$(".answer-question").show();
	});
})
 


