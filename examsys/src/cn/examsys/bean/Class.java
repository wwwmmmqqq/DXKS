package cn.examsys.bean;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.Generated;

@Entity
@Table(name="Class")
public class Class {
	/*ClassID	int
	GradeNo	int
	ClassNo	int
	DepartmentID	int*/
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	int ClassID;
	int GradeNo;
	int ClassNo;
	int DepartmentID;
	


	public int getClassID() {
		return ClassID;
	}



	public void setClassID(int classID) {
		ClassID = classID;
	}



	public int getGradeNo() {
		return GradeNo;
	}



	public void setGradeNo(int gradeNo) {
		GradeNo = gradeNo;
	}



	public int getClassNo() {
		return ClassNo;
	}



	public void setClassNo(int classNo) {
		ClassNo = classNo;
	}



	public int getDepartmentID() {
		return DepartmentID;
	}



	public void setDepartmentID(int departmentID) {
		DepartmentID = departmentID;
	}



	@Override
	public String toString() {
		return "Class [ClassID=" + ClassID + ", GradeNo=" + GradeNo + ", ClassNo=" + ClassNo
				+ ", DepartmentID=" + DepartmentID + "]";
	}
	
}
