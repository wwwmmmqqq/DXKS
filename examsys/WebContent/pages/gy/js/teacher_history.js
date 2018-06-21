//	分页
var currentPage = 1;

	
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
/*	var papsersid=getParam("sid");
	loadHistoryScore(papsersid);
	function loadHistoryScore(paperSid){
		 $.post("loadHistoryScore", {
			  "paper.sid":paperSid
			  ,"page":currentPage
		  }, function(data) {
			  var scoreList = data.list;
			  var htm = "";
			  for(var i=0;i<paperList.length;i++) {
				  html += getScores(i+1, li[i].subjectName, li[i].collegeName, li[i].time);
			  }
			  $('#studentScore').html(htm);
		  });
	}*/
	
/*	获取教师所接受参加过得考试*/
	var examSid = getParam("sid");
	loadPapersByExam(examSid);
	function loadPapersByExam(examSid) {
		  $.post("loadMyExamList", {
			  "exam.sid":examSid
			  ,"page":currentPage
		  }, function(data) {
			  var paperList = data.list;
			  var htm = "";
			  for(var i=0;i<paperList.length;i++) {
				 htm+=getMyExam(paperList[i]);
			  }
			  alert(htm)
			  $('#data-box').html(htm);
		  });
	  }
	
	
	//获取url中的参数
	function getParam(name) {
	  var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i"); //匹配目标参数
	  var result = window.location.search.substr(1).match(reg); //匹配目标参数
	  if (result != null) 
	  	return decodeURIComponent(result[2]);
	  return null;
	}
	function getMyExam(obj) {
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

	