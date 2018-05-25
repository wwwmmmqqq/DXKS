package cn.examsys.bean;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.Generated;

@Entity
@Table(name="College")
public class College {
	/*CollegeID	int
      UniversityID	int
      CollegeName	Varchar(100)
      CollegeCode	Varchar(10)*/
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	int CollegeID;
	int UniversityID;
	String CollegeName;
	String CollegeCode;
	
	
	
	public int getCollegeID() {
		return CollegeID;
	}



	public void setCollegeID(int collegeID) {
		CollegeID = collegeID;
	}



	public int getUniversityID() {
		return UniversityID;
	}



	public void setUniversityID(int universityID) {
		UniversityID = universityID;
	}



	public String getCollegeName() {
		return CollegeName;
	}



	public void setCollegeName(String collegeName) {
		CollegeName = collegeName;
	}



	public String getCollegeCode() {
		return CollegeCode;
	}



	public void setCollegeCode(String collegeCode) {
		CollegeCode = collegeCode;
	}



	@Override
	public String toString() {
		return "College [CollegeID=" + CollegeID + ", UniversityID=" + UniversityID + ", CollegeName=" + CollegeName
				+ ", CollegeCode=" + CollegeCode +"]";
	}
	
}
