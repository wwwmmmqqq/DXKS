
/**/


/*搜索jquery隐藏显示面板*/
$(document).ready(function() {
    $("#flip").click(function() {
        $("#panel").slideDown("slow");
    });
});

/*删除按钮*/
function deletefunction(){
	confirm("确定要删除吗");
}
