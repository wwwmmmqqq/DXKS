package cn.examsys.bean;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="exam_tb")
public class Exam {
	@Id
	@GenericGenerator(name="sid", strategy="identity")
	int sid;
	
	String userId;//创建的用户
	
	int subjectRef;//指向科目
	
	String subjectName;//科目名称
	
	String fromTime;//开始
	
	String toTime;//结束
	
	String createdTime;//创建时间

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

	public String getSubjectName() {
		return subjectName;
	}

	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}

	public String getFromTime() {
		return fromTime;
	}

	public void setFromTime(String fromTime) {
		this.fromTime = fromTime;
	}

	public String getToTime() {
		return toTime;
	}

	public void setToTime(String toTime) {
		this.toTime = toTime;
	}

	public String getCreatedTime() {
		return createdTime;
	}

	public void setCreatedTime(String createdTime) {
		this.createdTime = createdTime;
	}

	@Override
	public String toString() {
		return "Exam [sid=" + sid + ", userId=" + userId + ", subjectRef="
				+ subjectRef + ", subjectName=" + subjectName + ", fromTime="
				+ fromTime + ", toTime=" + toTime + ", createdTime="
				+ createdTime + "]";
	}
	
}
