package cn.examsys.bean;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
@Entity
@Table(name="admin_tb")
public class Admin {
	
	@Id
	@GenericGenerator(name="userId", strategy="assigned")
	String userId;
	
	String psw;
	
	String name;
	
	String sex;
	
	int collegeRef;
	String collegeName;
	
	int permission;//权限

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

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public int getCollegeRef() {
		return collegeRef;
	}

	public void setCollegeRef(int collegeRef) {
		this.collegeRef = collegeRef;
	}

	public String getCollegeName() {
		return collegeName;
	}

	public void setCollegeName(String collegeName) {
		this.collegeName = collegeName;
	}

	public int getPermission() {
		return permission;
	}

	public void setPermission(int permission) {
		this.permission = permission;
	}

	@Override
	public String toString() {
		return "Admin [userId=" + userId + ", psw=" + psw + ", name=" + name
				+ ", sex=" + sex + ", collegeRef=" + collegeRef
				+ ", collegeName=" + collegeName + ", permission=" + permission
				+ "]";
	}
	
	
}
