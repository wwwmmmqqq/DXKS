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
		+"<td>"+(i+1)+"</td>"
		+"<td>"+order+"</td>"
		+"</tr>";
		return htm;
	}
/*成绩导出*/
	$('.export').click(function(){
			var tr=$('#studentScore tbody tr');
		tr.each(function(){
			$(this).find("td:first").empty().append('<input name="check" type="checkbox">');
		})
		$(this).hide();
		$('.sureexport').show();
		$('.all-choose').show();
		$('.export').removeClass('btn-primary')
		$('.export').addClass('btn-success sure-export')
	})
	
	
/*全选*/
	$('.all-choose').click(function(){
		$(' input[name="check"]').each(function(){
			if ($(this).attr("checked")) {
				$(this).removeAttr("checked");
			} else {
				$(this).attr("checked", "true");
			}
		})
	})
	
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
				label : { // 饼图图形上的文本标签
					normal : {
						show : true,
						position : 'inner', // 标签的位置
						textStyle : {
							fontWeight : 300,
							fontSize : 16
						// 文字的字体大小
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
	