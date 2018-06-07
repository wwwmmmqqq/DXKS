package cn.examsys.bean;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.Formula;
import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="question_tb")
public class Question {
	@Id
	@GenericGenerator(name="sid", strategy="identity")
	int sid;
	
	int paperRef;//指向试卷
	
	String type;//题目类型
	
	String userId;//出卷人
	
	String title;//题目内容
	
	int choiceCount;//选项个数
	
	int difficultyValue;//难度值
	
	//@Formula("(select subjectName from subject_tb subject where subject.sid=sid)")
	String subjectName;//科目名

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

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getChoiceCount() {
		return choiceCount;
	}

	public void setChoiceCount(int choiceCount) {
		this.choiceCount = choiceCount;
	}

	public int getDifficultyValue() {
		return difficultyValue;
	}

	public void setDifficultyValue(int difficultyValue) {
		this.difficultyValue = difficultyValue;
	}

	public String getSubjectName() {
		return subjectName;
	}

	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}

	@Override
	public String toString() {
		return "Question [sid=" + sid + ", paperRef=" + paperRef + ", type=" + type + ", userId=" + userId + ", title="
				+ title + ", choiceCount=" + choiceCount + ", difficultyValue=" + difficultyValue + ", subjectName="
				+ subjectName + "]";
	}
	
	
	
	
}
