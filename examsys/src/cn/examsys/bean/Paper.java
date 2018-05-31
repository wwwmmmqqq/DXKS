package cn.examsys.bean;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

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
	
	int subjectRef;//指向的科目
	
	String subjectName;//科目名
	
	String name;
	
	String time;

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

	public int getSubjectRef() {
		return subjectRef;
	}

	public void setSubjectRef(int subjectRef) {
		this.subjectRef = subjectRef;
	}

	public String getSubjectName() {
		return subjectName;
	}

	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
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

	@Override
	public String toString() {
		return "Paper [sid=" + sid + ", examRef=" + examRef + ", subjectRef="
				+ subjectRef + ", subjectName=" + subjectName + ", name="
				+ name + ", time=" + time + "]";
	}
	
}
