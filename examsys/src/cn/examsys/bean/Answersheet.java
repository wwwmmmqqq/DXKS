package cn.examsys.bean;

/**
 * 学生答题表
 */
public class Answersheet {
	int sid;
	
	int paperRef;//指向的试卷
	
	String type;//题目类型
	
	int questionRef;//指向哪题
	
	int isSelected;//是否已经选择
	
	String fillsAnswer;//填空题答案
	
	String SubjectiveAnswer;//填空题答案
	
}
