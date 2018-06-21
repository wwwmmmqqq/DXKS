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
	function loadPapersByExam() {
		  $.post("loadInvitedExamPapers", {
			  "page":1
		  }, function(data) {
			  var list = data.list;
			  var htm = "";
			  for(var i=0;i<list.length;i++) {
				 htm+=getMyExam(i,list[i].exam,list[i].paper);
			  }
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
	function getMyExam(i,exam,paper) {
		var htm = "<tr>"
		+"	<td>"+(i+1)+"</td>"
		+"	<td>"+paper.subjectName+"</td>"
		+"	<td>"+exam.invitee+"</td>"
		+"	<td>"+exam.periodStart+"-"+exam.periodEnd+"</td>"
		+"	<td>"
		+"		<i class='fa fa-eye' data-toggle='modal' data-target='#myModal_correct' ></i>"
		+"	</td>"
		+"</tr>";
		return htm;
	}

	