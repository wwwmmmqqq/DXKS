package cn.examsys.bean;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.Formula;
import org.hibernate.annotations.GenericGenerator;

/**
 * 试卷
 * @author asus
 */
@Entity
@Table(name="paper_tb")
public class Paper {
	@Id
	@GenericGenerator(name="sid", strategy="identity")
	int sid;
	
	int examRef;//指向哪堂考试
	
	String name;//试卷标题
	
	String time;//当前时间
	
	int totalScore;//总分值
	
	String questionList;//组好的题目序号  用逗号隔开
	
	String scoreList;//组好的题目对应的分数  用逗号隔开
	
	//@Formula("(select subjectName from subject_tb subject where subject.sid=sid)")
	String subjectName;//科目名
	//@Formula("()")。
	
	int totalTime;//总时间，单位分钟

	public int getSid() {
		return sid;
	}

	public void setSid(int sid) {
		this.sid = sid;
	}

	public int getExamRef() {
		return examRef;
	}

	public void setExamRef(int examRef) {
		this.examRef = examRef;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public int getTotalScore() {
		return totalScore;
	}

	public void setTotalScore(int totalScore) {
		this.totalScore = totalScore;
	}

	public String getQuestionList() {
		return questionList;
	}

	public void setQuestionList(String questionList) {
		this.questionList = questionList;
	}

	public String getScoreList() {
		return scoreList;
	}

	public void setScoreList(String scoreList) {
		this.scoreList = scoreList;
	}

	public String getSubjectName() {
		return subjectName;
	}

	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}

	public int getTotalTime() {
		return totalTime;
	}

	public void setTotalTime(int totalTime) {
		this.totalTime = totalTime;
	}

	@Override
	public String toString() {
		return "Paper [sid=" + sid + ", examRef=" + examRef + ", name=" + name + ", time=" + time + ", totalScore="
				+ totalScore + ", questionList=" + questionList + ", scoreList=" + scoreList + ", subjectName="
				+ subjectName + ", totalTime=" + totalTime + "]";
	}
	
	
}
