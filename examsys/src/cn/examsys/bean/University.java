package cn.examsys.bean;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.Generated;

@Entity
@Table(name="University")
public class University {
	/*UniversityID	int
      UniversityName	Varchar(100)
      UniversityCode	int*/
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	int UniversityID;
	String UniversityName;
	int UniversityCode;
	
	
	public int getUniversityID() {
		return UniversityID;
	}


	public void setUniversityID(int universityID) {
		UniversityID = universityID;
	}


	public String getUniversityName() {
		return UniversityName;
	}


	public void setUniversityName(String universityName) {
		UniversityName = universityName;
	}


	public int getUniversityCode() {
		return UniversityCode;
	}


	public void setUniversityCode(int universityCode) {
		UniversityCode = universityCode;
	}


	@Override
	public String toString() {
		return "University [UniversityID=" + UniversityID + ", UniversityName=" + UniversityName +  ", UniversityCode=" + UniversityCode 
				+ "]";
	}
	
}
