package cn.examsys.bean;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="stu_tb")
public class Student {
	@Id
	@GenericGenerator(name="userId", strategy="assigned")
	String userId;//学号
	String psw;
	String name;
	String sex;
	String idCard;//身份证
	String headImg;//头像
	String time;//注册时间
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
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getIdCard() {
		return idCard;
	}
	public void setIdCard(String idCard) {
		this.idCard = idCard;
	}
	public String getHeadImg() {
		return headImg;
	}
	public void setHeadImg(String headImg) {
		this.headImg = headImg;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getCollegeRef() {
		return collegeRef;
	}
	public void setCollegeRef(String collegeRef) {
		this.collegeRef = collegeRef;
	}
	@Override
	public String toString() {
		return "Student [userId=" + userId + ", psw=" + psw + ", name=" + name
				+ ", sex=" + sex + ", idCard=" + idCard + ", headImg="
				+ headImg + ", regTime=" + time + ", collegeRef="
				+ collegeRef + "]";
	}
	
}
