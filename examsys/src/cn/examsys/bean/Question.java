package cn.examsys.bean;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.Formula;

@Entity
@Table(name="question_tb")
public class Question {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	int sid; 
	
	String type;//题目类型
	
	String userId;
	
	String title;//题目内容
	
	int choiceCount;
	
	int difficultyValue;//难度值
	
	int subjectRef;//所属科目
	
	@Formula(value="(select tb.name from subject_tb tb where tb.sid=subjectRef)")
	String subjectName;//科目名称 formula
	
	String knowledge;//涉及知识点
	
	String time;
	
	@Formula(value="(select count(tb1.sid) / (select if(count(tb2.sid)=0,999999,count(tb2.sid)) from answersheet_tb tb2 where tb2.questionRef=sid) * 100 from answersheet_tb tb1 where tb1.scoring>0 and tb1.questionRef=sid)")
	int accuracy;//正确率
	
	public int getAccuracy() {
		return accuracy;
	}
	
	public void setAccuracy(int accuracy) {
		this.accuracy = accuracy;
	}
	
	public String getSubjectName() {
		return subjectName;
	}
	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}
	
	public int getSid() {
		return sid;
	}

	public void setSid(int sid) {
		this.sid = sid;
	}

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
	
	public String getKnowledge() {
		return knowledge;
	}

	public void setKnowledge(String knowledge) {
		this.knowledge = knowledge;
	}
	
	public String getTime() {
		return time;
	}

	public void setTime(String string) {
		this.time = string;
	}

	/*@Override
	public String toString() {
		return "Question [sid=" + sid + ", type=" + type + ", userId=" + userId
				+ ", title=" + title + ", choiceCount=" + choiceCount
				+ ", difficultyValue=" + difficultyValue + ", subjectRef="
				+ subjectRef + "]";
	}*/
	

	@Transient
	List<Option> options = new ArrayList<Option>();
	@Transient
	public List<Option> getOptions() {
		return options;
	}
	@Transient
	public void setOptions(List<Option> options) {
		this.options = options;
	}

	@Override
	public String toString() {
		return "q"+sid+" "+ subjectRef ;//+ "," + ((options!=null)?Arrays.toString(options.toArray()):"nil");
	}
	
}
