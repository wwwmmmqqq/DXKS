package cn.examsys.bean;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

/**
 * 学生答题表
 */
@Entity
@Table(name="answersheet_tb")
public class Answersheet {
	@Id
	@GenericGenerator(name="sid",strategy="identity")
	int sid;
	
	int paperRef;//指向的试卷
	
	String type;//题目类型
	
	int questionRef;//指向哪题
	
	int isSelected;//是否已经选择
	
	String fillsAnswer;//填空题答案
	
	String SubjectiveAnswer;//填空题答案

	public int getSid() {
		return sid;
	}

	public void setSid(int sid) {
		this.sid = sid;
	}

	public int getPaperRef() {
		return paperRef;
	}

	public void setPaperRef(int paperRef) {
		this.paperRef = paperRef;
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
		return SubjectiveAnswer;
	}

	public void setSubjectiveAnswer(String subjectiveAnswer) {
		SubjectiveAnswer = subjectiveAnswer;
	}

	@Override
	public String toString() {
		return "Answersheet [sid=" + sid + ", paperRef=" + paperRef + ", type=" + type + ", questionRef=" + questionRef
				+ ", isSelected=" + isSelected + ", fillsAnswer=" + fillsAnswer + ", SubjectiveAnswer="
				+ SubjectiveAnswer + "]";
	}
	
	
}
