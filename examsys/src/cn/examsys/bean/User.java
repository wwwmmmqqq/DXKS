package cn.examsys.bean;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.apache.struts2.json.annotations.JSON;
import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="user_tb")
public class User {
	@Id
	@GenericGenerator(name="userId", strategy="assigned")
	String userId;
	
	String psw;
	
	String name;
	
	String sex;
	
	String phone;
	
	String email;
	
	String idcard;//身份证号码
	
	String profession;//专业
	
	int collegeRef;
	
	String permission;//权限
	
	//@Formula("()")
	String collegeName;

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	@JSON(serialize=false)
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

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getCollegeRef() {
		return collegeRef;
	}

	public void setCollegeRef(int collegeRef) {
		this.collegeRef = collegeRef;
	}

	public String getPermission() {
		return permission;
	}

	public void setPermission(String permission) {
		this.permission = permission;
	}

	public String getCollegeName() {
		return collegeName;
	}

	public void setCollegeName(String collegeName) {
		this.collegeName = collegeName;
	}
	
	public String getProfession() {
		return profession;
	}
	
	public void setProfession(String profession) {
		this.profession = profession;
	}

	@Override
	public String toString() {
		return "User [userId=" + userId + ", psw=" + psw + ", name=" + name
				+ ", sex=" + sex + ", phone=" + phone + ", email=" + email
				+ ", idcard=" + idcard + ", profession=" + profession
				+ ", collegeRef=" + collegeRef + ", permission=" + permission
				+ ", collegeName=" + collegeName + "]";
	}
	
}
