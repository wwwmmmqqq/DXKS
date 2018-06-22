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
	/*function exportScore(){
		var tr=$('#studentScore tbody tr');
		tr.each(function(){
			$(this).find("td:first").empty().append('<input name="check" type="checkbox">');
		})
		$('.all-choose').show();
		$('.export').innerHTML="确认导出"
		$('.export').removeClass('btn-primary')
		$('.export').addClass('btn-success')
			
	}*/
	
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
	/*function allChoose(){
		$(' input[name="check"]').each(function(){
			if ($(this).attr("checked")) {
				$(this).removeAttr("checked");
			} else {
				$(this).attr("checked", "true");
			}
		})
	}*/

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

	