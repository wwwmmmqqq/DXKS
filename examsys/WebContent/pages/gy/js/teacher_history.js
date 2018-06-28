	
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
	var paperid;
	function loadGradesByPaper(paperSid){
		paperid=paperSid;
		 $.post("loadGradesByPaper", {
			  "paper.sid":paperSid
		  }, function(data) {
			  var scoreList = data.list;
			  var htm = "";
			  for(var i=0;i<scoreList.length;i++) {
				  htm += getScore(scoreList[i].paper,scoreList[i].user,scoreList[i].grade,i,scoreList[i].order);
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

	/*导出*/
	function doExportExcel(){
        window.open("export.action?paper.sid="+paperid);
    }
	
	/*退出系统*/
	function Out() {
		if(confirm("确定要退出吗？")) {
			$.post("loginOut",null,function(data) {
				if(data.result=="成功退出") {
						location.href="../gy/login.jsp";
				}
		  });
		}  
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
	function getScore(paper,user,grade,i, order){
		if(order == '0' || order == 0) {
			order = "非本校";
		} else {
			order -= 1;
		}
		var htm=
			"<tr>"
		+"<td>"+i+"</td>"
		+"<td>"+user.userId+"</td>"
		+"<td>"+user.name+"</td>"
		+"<td>软件学院</td>"
		+"<td>"+user.profession+"</td>"
		+"<td>"+user.classroom+"</td>"
		+"<td>"+paper.subjectName+"</td>"
		+"<td>"+grade.point+"</td>"
		+"<td>"+(i+1)+"</td>"
		+"<td>"+order+"</td>"
		+"</tr>";
		return htm;
	}
	/*考试结果正确率判断*/
	$(function() {
		var scoreRate = echarts.init(document.getElementById("rate"));
		scoreRate.setOption({
			title : {
				text : "正确率"
			},
			backgroundColor : "transparent",
			itemStyle : {
				emphasis : {
					shadowBlur : 200,
					shadowColor : "rgb(254,67,101)"
				}
			},
			legend : {
				orient : 'vertical',
				x : 'left',
				top : 40,
				itemWidth : 20,
				itemHeight : 10,
				formatter : '{name}',
				textStyle : {
					color : '#00000'
				},
				data : [ {
					name : '正确',
					icon : 'rect'
				}, {
					name : '错误',
					icon : 'rect'
				} ]
			},
			series : [ {
				name : '正确率',
				type : 'pie',
				radius : '55%',
				center : [ '50%', '60%' ],
				label : { 
					normal : {
						show : true,
						position : 'inner', 
						textStyle : {
							fontWeight : 300,
							fontSize : 16
						
						},
						formatter : '{d}%'

					}
				},
				data : [ {
					value : 200,
					name : '正确'
				}, {
					value : 800,
					name : '错误'
				} ],

			} ]
		});
	});
	