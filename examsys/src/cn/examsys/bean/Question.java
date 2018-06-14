package cn.examsys.bean;

import java.util.Arrays;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name="question_tb")
public class Question {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	int sid;
	
	//int paperRef;//指向试卷
	
	String type;//题目类型
	
	String userId;
	
	String title;//题目内容
	
	int choiceCount;
	
	int difficultyValue;//难度值
	
	int subjectRef;//所属科目
	
	
	
	public int getSid() {
		return sid;
	}

	public void setSid(int sid) {
		this.sid = sid;
	}

	/*public int getPaperRef() {
		return paperRef;
	}

	public void setPaperRef(int paperRef) {
		this.paperRef = paperRef;
	}*/
	
	public int getSubjectRef() {
		return subjectRef;
	}
	
	public void setSubjectRef(int subjectRef) {
		this.subjectRef = subjectRef;
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

	/*@Override
	public String toString() {
		return "Question [sid=" + sid + ", type=" + type + ", userId=" + userId
				+ ", title=" + title + ", choiceCount=" + choiceCount
				+ ", difficultyValue=" + difficultyValue + ", subjectRef="
				+ subjectRef + "]";
	}*/
	
	@Transient
	List<Option> options;
	public List<Option> getOptions() {
		return options;
	}
	public void setOptions(List<Option> options) {
		this.options = options;
	}
	
	@Override
	public String toString() {
		return "q"+sid+" " + options!=null?Arrays.toString(options.toArray()):"nil";
	}
	
}
