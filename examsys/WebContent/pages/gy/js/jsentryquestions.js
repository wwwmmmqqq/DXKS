$(function(){
	$("#single-choice").click();
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
	
})
//表单转json函数
           /* $.fn.serializeObject = function(){
                    var o = {};
                    var a = this.serializeArray();
                    $.each(a, function() {
                        if (o[this.name] !== undefined) {
                            if (!o[this.name].push) {
                                o[this.name] = [o[this.name]];
                            }
                            o[this.name].push(this.value || '');
                        } else {
                            o[this.name] = this.value || '';
                        }
                    });
                    return o;
                };*/
        //表单转json结束
function importQuestion(){
	/* var param = $.extend({},JSON.stringify($('#s-question').serializeObject()),
			 JSON.stringify($('#w-question').serializeObject()),
			 JSON.stringify($('#tf-question').serializeObject()),
			 JSON.stringify($('#fj-question').serializeObject()),
			 JSON.stringify($('#aquestion').serializeObject())); 
	  $.post( "createItemBank",param,function(data){
		  alert(data.result);	
			})	*/
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
	var squestion = document
			.getElementById("s-question");
	var formData = new FormData(squestion);
	xhr
			.open("POST",
					"createItemBank");
	xhr.send(formData);

	
}


