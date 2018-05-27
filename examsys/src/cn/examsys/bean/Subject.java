package cn.examsys.bean;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.Generated;

@Entity
@Table(name="subject")
public class Subject {
	/*SubjectID	int
	SubjectName	Varchar(100)*/
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	int SubjectID;
	String SubjectName;



	public int getSubjectID() {
		return SubjectID;
	}



	public void setSubjectID(int subjectID) {
		SubjectID = subjectID;
	}



	public String getSubjectName() {
		return SubjectName;
	}



	public void setSubjectName(String subjectName) {
		SubjectName = subjectName;
	}



	@Override
	public String toString() {
		return "Subject [SubjectID=" + SubjectID + ", SubjectName=" +SubjectName
				+ "]";
	}
	
}
