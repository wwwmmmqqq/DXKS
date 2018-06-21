function showItemBankList(){
	$.post("showItemBankListByUser",
			{
		  		"user.userId":"123546",
		  		"page":1
		 	},
			 function(data){
		 		var questionList = data.questionList;       //所有题目的列表
		 		var optionList = data.map;                  //所有选项的列表
		 		var totalPage= data.totalPage;				//列表总页数
		 		for( var i in questionList) {				//循环题目列表
		 			/**
		 				题目
		 			*/
		 			alert("第"+questionList[i].sid+"道题目："+questionList[i].title);     //获取到第i道题目的具体属性
		 			var option = optionList["option["+i+"]"];          //获取到的第i个选项对象
		 			for(var j in option) {                             //循环第i个选项对象
		 				/**
		 					选择题，判断题答案
		 				*/
		 				if(option[j].type=="Single"||option[j].type=="Mutiple"||option[j].type=="TrueOrFalse") {
		 					alert("第"+questionList[i].sid+"道题目的第"+j+"个选项内容是："+option[j].content);   //相应第i道题目的第j个选项的具体属性
		 					
		 					/* option[j].type;option[j].isAnswer */
		 					
		 					if(option[j].isAnswer==1) {
		 						alert("第"+questionList[i].sid+"道题的正确答案是："+option[j].content); //获取到第i道题的正确答案
		 					}
		 				}
		 				
		 				/**
		 					填空题答案
		 				*/
		 				else if(option[j].type=="Fills") {
		 					alert("第"+questionList[i].sid+"道题目的第"+j+"个选项答案是"+option[j].type+"："+option[j].fillText);   //相应第i道题目的第j个选项的具体属性,这里是填空题答案
		 				}
		 				/**
		 					主观题答案
		 				*/
		 				else if(option[j].type=="Subjective") {
		 					alert("第"+questionList[i].sid+"道题目的第"+j+"个选项答案是"+option[j].type+"："+option[j].subjectiveText);   //相应第i道题目的第j个选项的具体属性,这里是主观题答案
		 				}continue;
		 			}
		 		}
		})   
}
function getQuestionData(){
	var htm=
		"<div class='qtype'>"
		+"	<p class='information'>"
		+"		<span>选择题型：单选题</span>"
		+"		<span>难易度：简单</span>"
		+"		<span>知识点：英语阅读理解能力 </span>"
		+"	</p>"
		+"	<div class='operation'>"
		+"		<ul>"
		+"			<li>"
		+"				<button class='btn btn-default btn-xs' data-toggle='modal' data-target='#modify-'>"
		+"					<i class='fa fa-pencil'></i>"
		+"</button>"
		+"			</li>"
		+"			<li>" 
		+"				<button class='btn btn-default btn-xs' onclick='myFunction1()'>"
		+"					<i class='fa fa-times'></i>"
		+"				</button>"
		+"			</li>"
		+"		</ul>"
		+"	</div>"
		+"</div>"
		+"<ul>"
		+"	<li class='question'># 下列说法正确的是()</li>"
		+"	<li>A. Update software</li>"
		+"	<li>B. Clean database</li>"
		+"	<li>C. Cron job running</li>"
		+"	<li>D. Fix and squish bugs</li>"
		+"	<li>正确答案：D</li>"
		+"</ul>"
		return htm;
}
