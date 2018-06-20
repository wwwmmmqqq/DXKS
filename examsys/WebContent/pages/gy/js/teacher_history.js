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
	var papsersid=getParam("sid");
	loadHistoryScore(papsersid);
	
	//获取url中的参数
function getParam(name) {
  var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i"); //匹配目标参数
  var result = window.location.search.substr(1).match(reg); //匹配目标参数
  if (result != null) 
  	return decodeURIComponent(result[2]);
  return null;
}
	function loadHistoryScore(){
		 $.post("loadHistoryScore", {
			  "paper.sid":paperSid
			  ,"page":currentPage
		  }, function(data) {
			  var scoreList = data.list;
			  var htm = "";
			  for(var i=0;i<paperList.length;i++) {
				  html += getScores(i+1, li[i].subjectName, li[i].collegeName, li[i].time);
			  }
			  $('#data-box').html(htm);
		  });
	}
	
	function getScores(obj) {
		var htm = "<tr>"
		+"	<td>"+obj.index+"</td>"
		+"	<td>"+obj.subjectName+"</td>"
		+"	<td>"+obj.collegeName+"</td>"
		+"	<td>"+obj.time+"</td>"
		+"	<td class='td_correct' data-toggle='modal' data-target='#myModal_correct'>"
		+"	<td>"
		+"		<i class='fa fa-eye' ></i>"
		+"	</td>"
		+"</tr>";
		return htm;
	}

	