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
});
/* 题目序号点击 */
var currentItemId = 0;
function queClicked(obj, n) {
	currentItemId = n;
	$(obj).removeClass('que-num-color');
	$(obj).addClass('on-click');
	$(obj).siblings().removeClass('on-click');
	$(".exam-paper").hide();
	$("#q-" + n).show();
	$("#q-" + n).css({"display":"block"});
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

/* 倒计时 */
/*function startTimeCounting(t0, t1) {
	var a = new Date(t0);
	var b = new Date(t1);
	var dms = b.valueOf() - a.valueOf();//结束时间减去当前时间=剩余时间
	var dt = dms / 1000;
	document.getElementById("mss").value = "--:--:--";
	var iid = 0;
	iid = setInterval(function() {
		var hour = Math.floor(dt / 3600 % 60);
		var min = Math.floor(dt / 60 % 60);
		var sec = Math.floor(dt % 60);
		document.getElementById("mss").value 
		= displayTime(hour) + ":" + displayTime(min) + ":" + displayTime(sec);
		if(--dt<=0) {
			alert("时间到，自动提交试卷");
			window.clearInterval(iid);
			document.getElementById("mss").value = "00:00:00";
		} else {
			document.getElementById("mss").value 
				= displayTime(hour) + ":" + displayTime(min) + ":" + displayTime(sec);
		}
	}, 1000);
	function displayTime(n) {
		if(n<10) return "0" + n;
			else return n;
	}
}
<<<<<<< HEAD
*/
=======

>>>>>>> origin/lrx
