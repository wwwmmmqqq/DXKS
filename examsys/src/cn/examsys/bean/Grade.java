package cn.examsys.bean;

import org.hibernate.annotations.Formula;

/**
 * 成绩
 * @author asus
 *
 */
public class Grade {
	
	int sid;
	
	String userId;
	
	int subjectRef;//指向科目
	
	int paperRef;//指向的试卷
	
	int point;//得分
	
	String time;
	
	/**
	 * ========以下为 非数据库字段==========
	 */
	String subjectName;
	@Formula("(select tb.name from subject_tb tb where tb.sid=subjectRef)") 
	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}
	public String getSubjectName() {
		return subjectName;
	}
	
}
