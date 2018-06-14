package cn.examsys.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="question_tb")
public class Question {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	int sid;
	
	int paperRef;//指向试卷
	
	String type;//题目类型
	
	String userId;
	
	String title;//题目内容
	
	int choiceCount;
	
	int difficultyValue;//难度值

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
	
}
