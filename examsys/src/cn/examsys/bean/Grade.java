package cn.examsys.bean;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.Formula;
import org.hibernate.annotations.GenericGenerator;

/**
 * 成绩
 * @author asus
 *
 */
@Entity
@Table(name="grade_tb")
public class Grade {
	@Id
	@GenericGenerator(name="sid", strategy="identity")
	int sid;
	
	String userId;
	
	int subjectRef;//指向科目
	
	int paperRef;//指向的试卷
	
	int point;//得分
	
	String time;
	
	/**
	 * ========以下为 非数据库字段==========
	 */
	String subjectName;
	@Formula("(select tb.name from subject_tb tb where tb.sid=subjectRef)") 
	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}
	public String getSubjectName() {
		return subjectName;
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
	public int getSubjectRef() {
		return subjectRef;
	}
	public void setSubjectRef(int subjectRef) {
		this.subjectRef = subjectRef;
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
	@Override
	public String toString() {
		return "Grade [sid=" + sid + ", userId=" + userId + ", subjectRef="
				+ subjectRef + ", paperRef=" + paperRef + ", point=" + point
				+ ", time=" + time + ", subjectName=" + subjectName + "]";
	}
	
}
