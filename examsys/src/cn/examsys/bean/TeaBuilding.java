package cn.examsys.bean;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.Generated;

@Entity
@Table(name="TeaBuilding")
public class TeaBuilding {
	/*TeaBuildingID	int
	UniversityID	int
	TeaBuildingName	Varchar(100)
	TeaBuildingCode	Varchar(6)*/
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	int TeaBuildingID;
	int UniversityID;
	String TeaBuildingName;
	String TeaBuildingCode;
	

	public int getTeaBuildingID() {
		return TeaBuildingID;
	}


	public void setTeaBuildingID(int teaBuildingID) {
		TeaBuildingID = teaBuildingID;
	}


	public int getUniversityID() {
		return UniversityID;
	}


	public void setUniversityID(int universityID) {
		UniversityID = universityID;
	}


	public String getTeaBuildingName() {
		return TeaBuildingName;
	}


	public void setTeaBuildingName(String teaBuildingName) {
		TeaBuildingName = teaBuildingName;
	}


	public String getTeaBuildingCode() {
		return TeaBuildingCode;
	}


	public void setTeaBuildingCode(String teaBuildingCode) {
		TeaBuildingCode = teaBuildingCode;
	}


	@Override
	public String toString() {
		return "TeaBuilding [TeaBuildingID=" + TeaBuildingID + ", UniversityID=" + UniversityID + ", TeaBuildingName=" + TeaBuildingName
				+ ", TeaBuildingCode=" + TeaBuildingCode +"]";
	}
	
}
