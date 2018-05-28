package cn.examsys.bean;
/**
 * 选项
 * @author asus
 *
 */
public class Selection {
	
	int sid;
	
	String userId;
	
	int paperRef;//指向的试卷
	
	int questionRef;//指向的问题
	
	int subjectRef;//指向的科目
	
	String content;//选项内容
	
}
