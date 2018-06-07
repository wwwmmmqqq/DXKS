package cn.examsys.bean;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="option_tb")
public class Option {
	@Id
	@GenericGenerator(name="sid", strategy="identity")
	int sid;
	
	//选择题Single，判断题TrueOrFalse，多选题Multiple，填空题Fills，解答题Subjective
    String type;
	
	String content;//选项内容
	
	int isAnswer;//选择题答案 0 和  1
	
	String fillsText;//填空题答案
	
	String SubjectiveText;//主观题答案

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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getIsAnswer() {
		return isAnswer;
	}

	public void setIsAnswer(int isAnswer) {
		this.isAnswer = isAnswer;
	}

	public String getFillsText() {
		return fillsText;
	}

	public void setFillsText(String fillsText) {
		this.fillsText = fillsText;
	}

	public String getSubjectiveText() {
		return SubjectiveText;
	}

	public void setSubjectiveText(String subjectiveText) {
		SubjectiveText = subjectiveText;
	}
	
}
