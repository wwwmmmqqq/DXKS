package cn.examsys.bean;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.Generated;

@Entity
@Table(name="department")
public class Department {
	/*DepartmentID	int
	CollegeID	int
	DepartmentName	Varchar(100)
	DepartmentCode	Varchar(20)*/
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	int DepartmentID;
	int CollegeID;
	String DepartmentName;
	String DepartmentCode;
	
	

	public int getDepartmentID() {
		return DepartmentID;
	}



	public void setDepartmentID(int departmentID) {
		DepartmentID = departmentID;
	}



	public int getCollegeID() {
		return CollegeID;
	}



	public void setCollegeID(int collegeID) {
		CollegeID = collegeID;
	}



	public String getDepartmentName() {
		return DepartmentName;
	}



	public void setDepartmentName(String departmentName) {
		DepartmentName = departmentName;
	}



	public String getDepartmentCode() {
		return DepartmentCode;
	}



	public void setDepartmentCode(String departmentCode) {
		DepartmentCode = departmentCode;
	}



	@Override
	public String toString() {
		return "Department [DepartmentID=" + DepartmentID + ", CollegeID=" + CollegeID + ", DepartmentName=" + DepartmentName
				+ ", DepartmentCode=" + DepartmentCode +"]";
	}
	
}
