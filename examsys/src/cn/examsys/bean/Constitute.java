package cn.examsys.bean;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 组卷表
 */
@Entity
@Table(name="constitute_tb")
public class Constitute {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	int sid;
	
	int paperRef;//指向哪个试卷
	
	String type;//题目类型
	
	int questionRef;//指向哪个题目
	
	String responsibleUser;//负责改卷的用户Id
	
	int point;//此题分值
	
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
	public String getResponsibleUser() {
		return responsibleUser;
	}
	public void setResponsibleUser(String responsibleUser) {
		this.responsibleUser = responsibleUser;
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
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	
}
