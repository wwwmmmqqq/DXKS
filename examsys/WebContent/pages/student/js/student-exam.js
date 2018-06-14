$(function(){
	
			var scoreRate = echarts.init(document.getElementById("right-rate"));
            scoreRate.setOption({
                title:{
                        text:"正确率"
                    },
                backgroundColor:"transparent",
                itemStyle:{
                    emphasis:{
                        shadowBlur:200,
                        shadowColor:"rgb(254,67,101)"
                    }
                },
                 legend: {  
                orient : 'vertical',  
                x : 'left',  
                top:40,
                itemWidth:20,
                itemHeight:10,
                formatter: '{name}',
                textStyle:{
                    color: '#00000'
                },
                data:[{name:'正确',icon:'rect'},{name:'错误',icon:'rect'}]  },
                series:[
                        {
                            name: '正确率',
                            type: 'pie',
                            radius: '55%',
                             center: ['50%', '60%'],
                               label:{            //饼图图形上的文本标签
                            normal:{
                                show:true,
                                position:'inner', //标签的位置
                                textStyle : {
                                    fontWeight : 300 ,
                                    fontSize : 16    //文字的字体大小
                                },
                                formatter:'{d}%'

                                
                            }
                        },
                            data:[
                                {value:200, name:'正确'},
                                {value:800, name:'错误'}
                            ],
                            
                        }
                    ]
            });
            
            

    		var currentItemId = 1;
    		function func(obj,n) {
    			currentItemId = n;
    			$(".que-num").removeClass('has-labled');
    			$(obj).addClass('has-labled');
    			$(".exam-paper").hide();
    			$(".q-"+n).css({"display":"block"});
    		}
    		function markClick() {
    			var n = currentItemId;
    			$("#lable-img-"+n).src = $("#lable-img-"+n).src=="img/pre-lable.png"?"img/lable.png":"img/pre-lable.png";
    		}
            
            
})
