package cn.examsys.bean;

public class Question {
	
	int sid;
	
	int paperRef;//指向试卷
	
	String userId;
	
	int subjectRef;//指向科目
	
	int answerRef;//指向答案选项
	
	int choiceCount; //1 为单项选择(默认1) 2为两项选择 3为三项选择...
	
	
}
