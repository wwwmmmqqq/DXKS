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
	var papsersid=getParam("sid");
	function loadGradesByPaper(paperSid){
		 $.post("loadGradesByPaper", {
			  "paper.sid":paperSid
		  }, function(data) {
			  var scoreList = data.list;
			  var htm = "";
			  for(var i=0;i<scoreList.length;i++) {
				  htm += getScore(scoreList[i].paper,scoreList[i].user,scoreList[i].grade,i);
			  }
			  $('#studentScore tbody').html(htm);
		  });
	}
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
		+"		<i class='fa fa-eye' data-toggle='modal' data-target='#myModal_correct' onclick='loadGradesByPaper("+paper.sid+")' ></i>"
		+"	</td>"
		+"</tr>";
		return htm;
	}
	function getScore(paper,user,grade,i){
		var htm=
			"<tr>"
		+"<td>1</td>"
		+"<td>"+user.userId+"</td>"
		+"<td>"+user.name+"</td>"
		+"<td>软件学院</td>"
		+"<td>"+user.profession+"</td>"
		+"<td>一班</td>"
		+"<td>"+paper.subjectName+"</td>"
		+"<td>"+grade.point+"</td>"
		+"<td>"+i+"</td>"
		+"<td>"+(i+1)+"</td>"
		+"</tr>"
		return htm;
	}
/*成绩导出*/
	function exportScore(){
		var tr=$('#studentScore tbody tr');
		tr.each(function(){
			$(this).find("td:first").empty().append('<input name="check" type="checkbox">');
		})
		$('.all-choose').show();
		$(this).html("确认导出 ");
		$(this).addClss('.sure-export');
	}
	