
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

/*加入试题篮*/
 $(document).ready(function(){
   	$("#addtobasket").one("click", function() {
   		var amount=$("#subj-amount").text();
   		var a=parseInt(amount)+1;
   		$("#subj-amount").text(a);
   		$("#subject-amount").text(a);
   	});
 });

/*分页*/
$('#id').jqPaginator({
    totalPages: 100,
    visiblePages: 10,
    currentPage: 1,

    first: '<li class="first"><a href="javascript:void(0);">First</a></li>',
    prev: '<li class="prev"><a href="javascript:void(0);">Previous</a></li>',
    next: '<li class="next"><a href="javascript:void(0);">Next</a></li>',
    last: '<li class="last"><a href="javascript:void(0);">Last</a></li>',
    page: '<li class="page"><a href="javascript:void(0);">{{page}}</a></li>',
    onPageChange: function (num) {
        $('#text').html('当前第' + num + '页');
    }
});