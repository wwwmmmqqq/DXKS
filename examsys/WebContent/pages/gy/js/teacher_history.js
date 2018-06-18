//	分页
var currentPage = 1;
	loadDatas(2);
	function loadDatas(page) {
		$.post("selectUserList",{"user.type":"Single","page":page},callback)
		currentPage = page;
	}
	
	function nextPage() {
		currentPage ++;
		loadDatas(currentPage);
	}
	function prevPage() {
		if(currentPage>=2) {
			currentPage --;
			loadDatas(currentPage);
		}
	}
//	获取历史成绩
	function callback(data) {
		var html = "";
		var li = data.gradeList;//
		for(var i=0;i<li.length; i++) {
			html += getHtmls(i+1, li[i].subjectName, li[i].collegeName, li[i].time);
		}
		$('#data-box').html(html);
	}
	
	function getHtmls(index, subjectName, collegeName, time) {
		var htm = "<tr>"
		+"	<td>"+index+"</td>"
		+"	<td>"+subjectName+"</td>"
		+"	<td>"+collegeName+"</td>"
		+"	<td>"+time+"</td>"
		+"	<td class='td_correct' data-toggle='modal' data-target='#myModal_correct'>"
		+"	<td>"
		+"		<i class='fa fa-eye' ></i>"
		+"	</td>"
		+"</tr>";
		return htm;
	}

	