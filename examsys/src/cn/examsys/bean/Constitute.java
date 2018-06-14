package cn.examsys.bean;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 组卷表
 * @author lrx
 * 2018年6月9日
 */
@Entity
@Table(name="constitute_tb")
public class Constitute {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	int sid;
	
	int paperRef;//指向哪个试卷
	
	int questionRef;//指向哪个题目
	
	String responsibleUser;//负责改卷的用户Id
	
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
	public int getQuestionRef() {
		return questionRef;
	}
	public void setQuestionRef(int questionRef) {
		this.questionRef = questionRef;
	}
	
}
