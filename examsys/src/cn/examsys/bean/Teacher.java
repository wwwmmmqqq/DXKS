package cn.examsys.bean;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="teacher_tb")
public class Teacher {
	@Id
	@GenericGenerator(name="sid", strategy="assigned")
	String userId;
	
	String psw;
	
	String name;
	
	String collegeRef;//属于哪个大学

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPsw() {
		return psw;
	}

	public void setPsw(String psw) {
		this.psw = psw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCollegeRef() {
		return collegeRef;
	}

	public void setCollegeRef(String collegeRef) {
		this.collegeRef = collegeRef;
	}

	@Override
	public String toString() {
		return "Teacher [userId=" + userId + ", psw=" + psw + ", name=" + name
				+ ", collegeRef=" + collegeRef + "]";
	}
	
}
