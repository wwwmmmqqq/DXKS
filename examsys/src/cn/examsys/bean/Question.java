package cn.examsys.bean;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="question_tb")
public class Question {
	@Id
	@GenericGenerator(name="sid", strategy="identity")
	int sid;
	
	int paperRef;//指向试卷
	
	String userId;
	
	int subjectRef;//指向科目
	
	int answerRef;//指向答案选项
	
	int choiceCount; //1 为单项选择(默认1) 2为两项选择 3为三项选择...

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

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getSubjectRef() {
		return subjectRef;
	}

	public void setSubjectRef(int subjectRef) {
		this.subjectRef = subjectRef;
	}

	public int getAnswerRef() {
		return answerRef;
	}

	public void setAnswerRef(int answerRef) {
		this.answerRef = answerRef;
	}

	public int getChoiceCount() {
		return choiceCount;
	}

	public void setChoiceCount(int choiceCount) {
		this.choiceCount = choiceCount;
	}

	@Override
	public String toString() {
		return "Question [sid=" + sid + ", paperRef=" + paperRef + ", userId="
				+ userId + ", subjectRef=" + subjectRef + ", answerRef="
				+ answerRef + ", choiceCount=" + choiceCount + "]";
	}
	
}
