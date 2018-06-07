package cn.examsys.bean;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
/**
 * 考试计划表
 */
@Entity
@Table(name="exam_tb")
public class Exam {
	@Id
	@GenericGenerator(name="sid", strategy="identity")
	int sid;
	
	String userId;//创建的用户
	
	String title;//考试名字
	
	int subjectRef;//指向科目
	
	String subjectName;//科目名称
	
	String examStart;//开始
	
	String examEnd;//结束

	String periodStart;//考试阶段开始时间

	String periodEnd;//考试阶段结束时间
	
	/**邀请的学校*/
	String invitee;//创建时立刻把本校加入到本字段
	
	String explication;//考试说明
	
	/**
	 * 0 初始创建
	 * 1 邀请了学校
	 * 2 已组卷
	 * 3 考试ing
	 * 4 考试完成
	 */
	int state;
	
	//int together;//受邀学校是否参与出题
	
	String time;//创建时间

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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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

	public String getPeriodStart() {
		return periodStart;
	}

	public void setPeriodStart(String periodStart) {
		this.periodStart = periodStart;
	}

	public String getPeriodEnd() {
		return periodEnd;
	}

	public void setPeriodEnd(String periodEnd) {
		this.periodEnd = periodEnd;
	}

	public String getInvitee() {
		return invitee;
	}

	public void setInvitee(String invitee) {
		this.invitee = invitee;
	}

	public String getExplain() {
		return explain;
	}

	public void setExplain(String explain) {
		this.explain = explain;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	@Override
	public String toString() {
		return "Exam [sid=" + sid + ", userId=" + userId + ", title=" + title + ", subjectRef=" + subjectRef
				+ ", subjectName=" + subjectName + ", examStart=" + examStart + ", examEnd=" + examEnd
				+ ", periodStart=" + periodStart + ", periodEnd=" + periodEnd + ", invitee=" + invitee + ", explain="
				+ explain + ", state=" + state + ", time=" + time + "]";
	}
	
	
	
	
}
