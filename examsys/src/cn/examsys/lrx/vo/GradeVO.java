package cn.examsys.lrx.vo;

import cn.examsys.bean.Grade;
import cn.examsys.bean.Paper;
import cn.examsys.bean.User;

public class GradeVO {
	
	private User user;
	private Grade grade;
	private Paper paper;
	
	
	public GradeVO(Grade grade, User user, Paper paper) {
		this.grade = grade;
		this.user = user;
		this.paper = paper;
	}
	
	public Grade getGrade() {
		return grade;
	}
	
	public void setGrade(Grade grade) {
		this.grade = grade;
	}
	
	public User getUser() {
		return user;
	}
	
	public void setUser(User user) {
		this.user = user;
	}
	
	public Paper getPaper() {
		return paper;
	}
	
	public void setPaper(Paper paper) {
		this.paper = paper;
	}
	
}
