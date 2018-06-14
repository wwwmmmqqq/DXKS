/*考试结果正确率判断*/
$(function() {
	var scoreRate = echarts.init(document.getElementById("right-rate"));
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

})
/* 题目序号点击 */
var currentItemId = 1;
function queClicked(obj, n) {
	currentItemId = n;
	/* $(".que-num").css({"background-color":"white","color":"black"}); */
	/* $(obj).css({"background-color":"blue","color":"white"}); */
	/* s */
	$(obj).removeClass('que-num-color');
	$(obj).addClass('on-click');
	$(obj).siblings().removeClass('on-click');
	$(".exam-paper").hide();
	$("#q-" + n).show();
	$("#q-" + n).css({
		"display" : "block"
	});
}
/* 下一题 */
function nextPage() {
		currentItemId++;
		$('#abc' + currentItemId).click();

}
/* 上一题 */
function prePage() {
	currentItemId--;
	$('#abc' + currentItemId).click();
}

/* 点击标记图片 */
function markClick() {
	var n = currentItemId;
	if ($("#lable-img-" + n).attr('src') == "img/pre-lable.png") {
		$("#lable-img-" + n).attr('src', "img/lable.png");
		$("#abc" + n).addClass("has-labled");
	} else {
		$("#lable-img-" + n).attr('src', "img/pre-lable.png");
		$("#abc" + n).removeClass("has-labled");
	}
}
window.onload = function() {
	daojishi();
}
/* 倒计时 */
var counttime = 60 * 120;// 把120分钟化成总秒数
function daojishi() {
	if (counttime >= 0) {
		var seconds = counttime % 60;// 得到剩余的秒数 89%60==29秒
		var min = Math.floor(counttime / 60);// 分钟
		if (min >= 60) {
			var hour = Math.floor(min / 60);

			min = Math.floor((counttime - hour * 60 * 60) / 60);

			document.getElementById("mss").value = hour + ":" + min + ":"
					+ seconds;
		} else if (mis >= 1) {
			document.getElementById("mss").value = min + ":" + seconds;

		} else {
			document.getElementById("mss").value = seconds;
		}

		counttime--;
		vartt = window.setTimeout("daojishi()", 1000);
	} else {
		window.clearTimeout(vartt);
		window.confirm("考试时间结束,请单击提交");
		tijiao();

	}
}
/* 单选功能*/
function oneChoice(){
	$(':checkbox[type="checkbox"]').each(function(){
		$(this).parent().parent().click(function(){
			if($(this).attr('checked')){
				 $(':checkbox[type="checkbox"]').removeAttr('checked');
                 $(this).attr('checked','checked');
			}
		})
	})
}

