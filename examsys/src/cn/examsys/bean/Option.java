package cn.examsys.bean;

public class Option {
	
	int sid;
	
	//选择题Single，判断题TrueOrFalse，多选题Multiple，填空题Fills，解答题Subjective
    String type;
	
	String content;//选项内容
	
	int isAnswer;//选择题答案 0 和  1
	
	String fillsText;//填空题答案
	
	String SubjectiveText;//主观题答案
	
}
