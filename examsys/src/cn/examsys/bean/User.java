package cn.examsys.bean;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.apache.struts2.json.annotations.JSON;
import org.hibernate.annotations.Formula;
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
	
	String type;
	
	int collegeRef;
	
	String permission;//权限
	
	//@Formula("()")
	String collegeName;
	
	String department;//学院
	
	String classroom;//班级
	
	String status;
	
	@Transient
	Grade grade;
	public Grade getGrade() {
		return grade;
	}

	@Transient
	public void setGrade(Grade grade) {
		this.grade = grade;
	}
	


	public String getStatus() {
		return status;
	}



	public void setStatus(String status) {
		this.status = status;
	}



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



	public String getIdcard() {
		return idcard;
	}



	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}



	public String getProfession() {
		return profession;
	}



	public void setProfession(String profession) {
		this.profession = profession;
	}



	public String getType() {
		return type;
	}



	public void setType(String type) {
		this.type = type;
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


	@Formula(value="(select name from college_tb tb where tb.sid=collegeRef)")
	public String getCollegeName() {
		return collegeName;
	}



	public void setCollegeName(String collegeName) {
		this.collegeName = collegeName;
	}



	public String getDepartment() {
		return department;
	}



	public void setDepartment(String department) {
		this.department = department;
	}

	public String getClassroom() {
		return classroom;
	}

	public void setClassroom(String classroom) {
		this.classroom = classroom;
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
