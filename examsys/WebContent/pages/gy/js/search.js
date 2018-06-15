//条件搜索
$(document).ready(function(){
	$("#find").click(function(){
		$("#hide").slideToggle("slow");
			$("#school").click(function(){
				$("#school1").slideToggle("slow");
			});
			$("#institute").click(function(){
				$("#institute1").slideToggle("slow");
			});
			$("#profession").click(function(){
				$("#profession1").slideToggle("slow");
			});
			$("#class").click(function(){
				$("#class1").slideToggle("slow");
			});
	});
});

//导出历史成绩
//$(function(){  
//  $("#selectAll").click(function(){  
// 		$("#checkBoxList :checkbox").attr("checked", true);  
//  });  
//  $("#unSelect").click(function(){  
//      $("#checkBoxList :checkbox").attr("checked", false);  
//  });  
//  $("#reverseSelect").click(function(){  
//      $("#checkBoxList :checkbox").each(function(){  
//          $(this).attr("checked", !$(this).attr("checked"));  
//          });  
//      });  
//  });
    
//导出历史成绩

	//获取全选框复选框
	//var checkbox_all_select=document.getElementById("checkbox_all_select");
	$("#checkbox_all_select").click(function(){
		var checkbox_select=document.getElementsByName("checkbox_select");
		for(var i=0;i<checkbox_select.length;i++){
			checkbox_select[i].checked=true;
		}
	});
	//获取全不选框复选框
	$("#checkbox_select").click(function(){
		var checkbox_select=document.getElementsByName("checkbox_select");
		for(var i=0;i<checkbox_select.length;i++){
			checkbox_select[i].checked=false;
		}
	});
	//获取反选框复选框
	$("#reverseSelect").click(function(){
		var checkbox_select=document.getElementsByName("checkbox_select");
		for(var i=0;i<checkbox_select.length;i++){
			if(checkbox_select[i].checked== true){
				checkbox_select[i].checked=false;
			}else{
				checkbox_select[i].checked=true;
			}
		}
	});


//警告框
//退出登陆
function myFunction(){
	confirm("确认退出吗？")
}
function myFunction1(){
	confirm("确认删除")
}

//清空搜索
$(document).ready(function(e){
    /*点击删除 清空输入框的内容*/
    $('.clean').click(function(){
        $('.search_hide input').val('');
    });
});