
/*退出登录*/
function exit(){
	confirm("确定要退出系统吗？");
}
/*点击隐藏试题篮*/
    fun();
    function fun(){
		$('#basketbtn').click(function(){
  		   $('#basketright').toggle("slide");
    	});
	}

/*加入试题篮
 $(document).ready(function(){
   	$("#addtobasket").one("click", function() {
   		var amount=$("#subj-amount").text();
   		var a=parseInt(amount)+1;
   		$("#subj-amount").text(a);
   		$("#subject-amount").text(a);
   		$("#addtobasket").html("--选题");
   	});
 });*/

    /*加入试题篮*/
    $(document).ready(function(){
    	$("#addtobasket").click(function() {
      		var amount=$("#subj-amount").text();
      		if($("#addtobasket").text()=="+选题"){
          		var a=parseInt(amount)+1;
          		$("#subj-amount").text(a);
          		$("#subject-amount").text(a);
          		$("#addtobasket").html("--选题");
    	}else{
    		var a=parseInt(amount)-1;
    		$("#subj-amount").text(a);
      		$("#subject-amount").text(a);
      		$("#addtobasket").html("+选题");
    	}
      	});
    	
      	
    });
