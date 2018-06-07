package cn.examsys.bean;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

/**
 * 选项
 * @author asus
 *
 */
@Entity
@Table(name="selection_tb")
public class Selection {
	@Id
	@GenericGenerator(name="sid", strategy="identity")
	int sid;
	
	String userId;
	
	int paperRef;//指向的试卷
	
	int questionRef;//指向的问题
	
	int subjectRef;//指向的科目
	
	String content;//选项内容

	public int getSid() {
		return sid;
	}

	public void setSid(int sid) {
		this.sid = sid;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getPaperRef() {
		return paperRef;
	}

	public void setPaperRef(int paperRef) {
		this.paperRef = paperRef;
	}

	public int getQuestionRef() {
		return questionRef;
	}

	public void setQuestionRef(int questionRef) {
		this.questionRef = questionRef;
	}

	public int getSubjectRef() {
		return subjectRef;
	}

	public void setSubjectRef(int subjectRef) {
		this.subjectRef = subjectRef;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "Selection [sid=" + sid + ", userId=" + userId + ", paperRef="
				+ paperRef + ", questionRef=" + questionRef + ", subjectRef="
				+ subjectRef + ", content=" + content + "]";
	}
	
}
