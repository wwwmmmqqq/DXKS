package cn.examsys.bean;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.Formula;

/**
 * 试卷
 * 
 * @author asus
 */
@Entity
@Table(name = "paper_tb")
public class Paper {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int sid;

	int examRef;// 指向哪堂考试

	int subjectRef;// 指向的科目

	String name;

	String time;

	int totalScore;

	String examStart;// 开始

	String examEnd;// 结束

	// 用Constitute表
	// String questionList;// 组好的题目序号 用逗号隔开
	// String scoreList;// 组好的题目对应的分数 用逗号隔开

	int totalTime;// 总时间，单位秒

	String subjectName;// 科目名称

	@Formula("(select tb.name from subject_tb tb where tb.sid=subjectRef)")
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

	public String getExamStart() {
		return examStart;
	}

	public void setExamStart(String examStart) {
		this.examStart = examStart;
	}

	public String getExamEnd() {
		return examEnd;
	}

	public void setExamEnd(String examEnd) {
		this.examEnd = examEnd;
	}

	public int getTotalScore() {
		return totalScore;
	}

	public void setTotalScore(int totalScore) {
		this.totalScore = totalScore;
	}

	public int getTotalTime() {
		return totalTime;
	}

	public void setTotalTime(int totalTime) {
		this.totalTime = totalTime;
	}

	public int getSubjectRef() {
		return subjectRef;
	}

	public void setSubjectRef(int subjectRef) {
		this.subjectRef = subjectRef;
	}

}
