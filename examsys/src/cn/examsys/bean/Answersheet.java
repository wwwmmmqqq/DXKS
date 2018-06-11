package cn.examsys.bean;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 学生答题表
 */
@Entity
@Table(name="answersheet_tb")
public class Answersheet {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	int sid;
	
	String userId;
	
	//int paperRef;//指向的试卷
	
	String type;//题目类型
	
	int questionRef;//指向哪题
	
	int isSelected;//是否已经选择
	
	String fillsAnswer;//填空题答案
	
	String subjectiveAnswer;//填空题答案

	public String getUserId() {
		return userId;
	}
	
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	public int getSid() {
		return sid;
	}

	public void setSid(int sid) {
		this.sid = sid;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getQuestionRef() {
		return questionRef;
	}

	public void setQuestionRef(int questionRef) {
		this.questionRef = questionRef;
	}

	public int getIsSelected() {
		return isSelected;
	}

	public void setIsSelected(int isSelected) {
		this.isSelected = isSelected;
	}

	public String getFillsAnswer() {
		return fillsAnswer;
	}

	public void setFillsAnswer(String fillsAnswer) {
		this.fillsAnswer = fillsAnswer;
	}

	public String getSubjectiveAnswer() {
		return subjectiveAnswer;
	}
	
	public void setSubjectiveAnswer(String subjectiveAnswer) {
		this.subjectiveAnswer = subjectiveAnswer;
	}
	
}
