package cn.examsys.bean;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.Generated;

@Entity
@Table(name="classroom")
public class Classroom {
	/*ClassroomID	int
	TeaBuildingID	int
	ClassMaxSize	int
	ClassIsUsed	int
	ClassroomName	Varchar(20)
	ClassroomCode	Varchar(6)*/
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	int ClassroomID;
	int TeaBuildingID;
	int ClassMaxSize;
	int ClassIsUsed;
	String ClassroomName;
	String ClassroomCode;
	


	public int getClassroomID() {
		return ClassroomID;
	}



	public void setClassroomID(int classroomID) {
		ClassroomID = classroomID;
	}



	public int getTeaBuildingID() {
		return TeaBuildingID;
	}



	public void setTeaBuildingID(int teaBuildingID) {
		TeaBuildingID = teaBuildingID;
	}



	public int getClassMaxSize() {
		return ClassMaxSize;
	}



	public void setClassMaxSize(int classMaxSize) {
		ClassMaxSize = classMaxSize;
	}



	public int getClassIsUsed() {
		return ClassIsUsed;
	}



	public void setClassIsUsed(int classIsUsed) {
		ClassIsUsed = classIsUsed;
	}



	public String getClassroomName() {
		return ClassroomName;
	}



	public void setClassroomName(String classroomName) {
		ClassroomName = classroomName;
	}



	public String getClassroomCode() {
		return ClassroomCode;
	}



	public void setClassroomCode(String classroomCode) {
		ClassroomCode = classroomCode;
	}



	@Override
	public String toString() {
		return "Classroom [ClassroomID=" + ClassroomID + ", TeaBuildingID=" + TeaBuildingID + ", ClassMaxSize=" + ClassMaxSize
				+ ", ClassIsUsed=" + ClassIsUsed +", ClassroomName=" + ClassroomName + ", ClassroomCode=" + ClassroomCode + "]";
	}
	
}
