package cn.examsys.bean;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.Formula;

/**
 * 成绩
 * @author asus
 */
@Entity
@Table(name="grade_tb")
public class Grade {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	int sid;
	
	String userId;
	
	int paperRef;//指向的试卷
	
	int point;//得分
	
	String time;//交卷试卷
	
	int timeComsuming;//消耗时间 秒
	
	@Formula("(select tb.name from subject_tb tb where tb.sid=(select tb.subjectRef from paper_tb tb where tb.sid=paperRef))")
	String subjectName;
	
	int state;//成绩的状态 0:waiting 1:checked
	
	
	public int getState() {
		return state;
	}
	
	public void setState(int state) {
		this.state = state;
	}
	
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
	
	@Formula("(select tb1.name from subject_tb tb1 where tb1.sid=(select tb.subjectRef from paper_tb tb.paperRef=tb.sid))")
	public String getSubjectName() {
		return subjectName;
	}
	
	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}

	@Override
	public String toString() {
		return "Grade [sid=" + sid + ", userId=" + userId + ", paperRef="
				+ paperRef + ", point=" + point + ", time=" + time
				+ ", timeComsuming=" + timeComsuming + ", subjectName="
				+ subjectName + "]";
	}
	
}
