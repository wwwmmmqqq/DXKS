package cn.examsys.bean;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.Generated;

@Entity
@Table(name="admin")
public class Admin {
	/*AdminID	int
	AdminName	Varchar(100)
	AdminSex	Char(1)
	AdminPassword	Varchar(20)
	AdminPhone	Char(11)
	AdminEmail	Char(20)
	AdminLevel	int
	CollegeID	int*/
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	int AdminID;
	String AdminName;
	String AdminSex;
	String AdminPassword;
	String AdminPhone;
	String AdminEmail;
	int AdminLevel;
	int CollegeID;
	
	
	
	public int getAdminID() {
		return AdminID;
	}



	public void setAdminID(int adminID) {
		AdminID = adminID;
	}



	public String getAdminName() {
		return AdminName;
	}



	public void setAdminName(String adminName) {
		AdminName = adminName;
	}



	public String getAdminSex() {
		return AdminSex;
	}



	public void setAdminSex(String adminSex) {
		AdminSex = adminSex;
	}



	public String getAdminPassword() {
		return AdminPassword;
	}



	public void setAdminPassword(String adminPassword) {
		AdminPassword = adminPassword;
	}



	public String getAdminPhone() {
		return AdminPhone;
	}



	public void setAdminPhone(String adminPhone) {
		AdminPhone = adminPhone;
	}



	public String getAdminEmail() {
		return AdminEmail;
	}



	public void setAdminEmail(String adminEmail) {
		AdminEmail = adminEmail;
	}



	public int getAdminLevel() {
		return AdminLevel;
	}



	public void setAdminLevel(int adminLevel) {
		AdminLevel = adminLevel;
	}



	public int getCollegeID() {
		return CollegeID;
	}



	public void setCollegeID(int collegeID) {
		CollegeID = collegeID;
	}



	@Override
	public String toString() {
		return "Admin [AdminID=" + AdminID + ", AdminName=" + AdminName + ", AdminSex=" + AdminSex
				+ ", AdminPassword=" + AdminPassword + ", AdminPhone=" + AdminPhone + ", AdminEmail="
				+ AdminEmail + ", AdminLevel=" + AdminLevel + ", CollegeID=" + CollegeID+ "]";
	}
	
}
