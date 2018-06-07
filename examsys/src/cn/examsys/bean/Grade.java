package cn.examsys.bean;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.Formula;
import org.hibernate.annotations.GenericGenerator;

/**
 * 成绩
 * @author asus
 */
@Entity
@Table(name="grade_tb")
public class Grade {
	@Id
	@GenericGenerator(name="sid", strategy="identity")
	int sid;
	
	String userId;//用户ID
	
	int paperRef;//指向的试卷
	
	int point;//得分
	
	String time;//交卷时间
	
	int timeComsuming;//消耗时间
	
	//@Formula("(select name from subject_tb subject where subject.sid=)")
	String subjectName;//试卷科目

	public int getSid() {
		return sid;
	}

	public void setSid(int sid) {
		this.sid = sid;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getPaperRef() {
		return paperRef;
	}

	public void setPaperRef(int paperRef) {
		this.paperRef = paperRef;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public int getTimeComsuming() {
		return timeComsuming;
	}

	public void setTimeComsuming(int timeComsuming) {
		this.timeComsuming = timeComsuming;
	}

	public String getSubjectName() {
		return subjectName;
	}

	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}

	@Override
	public String toString() {
		return "Grade [sid=" + sid + ", userId=" + userId + ", paperRef=" + paperRef + ", point=" + point + ", time="
				+ time + ", timeComsuming=" + timeComsuming + ", subjectName=" + subjectName + "]";
	}
	
	
}
