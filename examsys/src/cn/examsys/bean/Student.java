package cn.examsys.bean;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="student")
public class Student {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	int StudentID;
	String StudentName;
	String StudentSex;
	String StudentEmail;
	String StudentPhone;
	String StudentPassword;
	String StudentCardID;
	String StudentPhoto;
	Date StudentRegisterDate;
	int ClassID;
	String StudentNo;
	
	public int getStudentID() {
		return StudentID;
	}
	public void setStudentID(int studentID) {
		StudentID = studentID;
	}
	public String getStudentName() {
		return StudentName;
	}
	public void setStudentName(String studentName) {
		StudentName = studentName;
	}
	public String getStudentSex() {
		return StudentSex;
	}
	public void setStudentSex(String studentSex) {
		StudentSex = studentSex;
	}
	public String getStudentEmail() {
		return StudentEmail;
	}
	public void setStudentEmail(String studentEmail) {
		StudentEmail = studentEmail;
	}
	public String getStudentPhone() {
		return StudentPhone;
	}
	public void setStudentPhone(String studentPhone) {
		StudentPhone = studentPhone;
	}
	public String getStudentPassword() {
		return StudentPassword;
	}
	public void setStudentPassword(String studentPassword) {
		StudentPassword = studentPassword;
	}
	public String getStudentCardID() {
		return StudentCardID;
	}
	public void setStudentCardID(String studentCardID) {
		StudentCardID = studentCardID;
	}
	public String getStudentPhoto() {
		return StudentPhoto;
	}
	public void setStudentPhoto(String studentPhoto) {
		StudentPhoto = studentPhoto;
	}
	public Date getStudentRegisterDate() {
		return StudentRegisterDate;
	}
	public void setStudentRegisterDate(Date studentRegisterDate) {
		StudentRegisterDate = studentRegisterDate;
	}
	public int getClassID() {
		return ClassID;
	}
	public void setClassID(int classID) {
		ClassID = classID;
	}
	public String getStudentNo() {
		return StudentNo;
	}
	public void setStudentNo(String studentNo) {
		StudentNo = studentNo;
	}
	@Override
	public String toString() {
		return "Student [StudentID=" + StudentID + ", StudentName=" + StudentName + ", StudentSex=" + StudentSex
				+ ", StudentEmail=" + StudentEmail + ", StudentPhone=" + StudentPhone + ", StudentPassword="
				+ StudentPassword + ", StudentCardID=" + StudentCardID + ", StudentPhoto=" + StudentPhoto
				+ ", StudentRegisterDate=" + StudentRegisterDate + ", ClassID=" + ClassID + ", StudentNo=" + StudentNo
				+ "]";
	}
	
}
