package cn.examsys.bean;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.Generated;

@Entity
@Table(name="TestPlans_Tests")
public class TestPlans_Tests {
	/*TestPlanID	int
	TestID	int
	StudentID	int
	StudentScore	int
	StudentSubmit	int*/
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	int TestPlanID;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	int TestID;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	int StudentID;
	int StudentScore;
	int StudentSubmit;
	

	public int getTestPlanID() {
		return TestPlanID;
	}


	public void setTestPlanID(int testPlanID) {
		TestPlanID = testPlanID;
	}


	public int getTestID() {
		return TestID;
	}


	public void setTestID(int testID) {
		TestID = testID;
	}


	public int getStudentID() {
		return StudentID;
	}


	public void setStudentID(int studentID) {
		StudentID = studentID;
	}


	public int getStudentScore() {
		return StudentScore;
	}


	public void setStudentScore(int studentScore) {
		StudentScore = studentScore;
	}


	public int getStudentSubmit() {
		return StudentSubmit;
	}


	public void setStudentSubmit(int studentSubmit) {
		StudentSubmit = studentSubmit;
	}


	@Override
	public String toString() {
		return "TestPlans_Tests [TestPlanID=" + TestPlanID + ", TestID=" + TestID + ", StudentID=" + StudentID
				+ ", StudentScore=" + StudentScore +", StudentSubmit=" + StudentSubmit + "]";
	}
	
}
