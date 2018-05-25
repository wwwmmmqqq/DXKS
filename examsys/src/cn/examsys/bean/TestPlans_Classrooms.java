package cn.examsys.bean;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.Generated;

@Entity
@Table(name="TestPlans_Classrooms")
public class TestPlans_Classrooms {
	/*TestPlanID	int
	ClassroomID	int
	StudentID	int
	StudentState	int*/
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	int TestPlanID;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	int ClassroomID;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	int StudentID;
	int StudentState;
	

	public int getTestPlanID() {
		return TestPlanID;
	}


	public void setTestPlanID(int testPlanID) {
		TestPlanID = testPlanID;
	}


	public int getClassroomID() {
		return ClassroomID;
	}


	public void setClassroomID(int classroomID) {
		ClassroomID = classroomID;
	}


	public int getStudentID() {
		return StudentID;
	}


	public void setStudentID(int studentID) {
		StudentID = studentID;
	}


	public int getStudentState() {
		return StudentState;
	}


	public void setStudentState(int studentState) {
		StudentState = studentState;
	}


	@Override
	public String toString() {
		return "TestPlans_Classrooms [TestPlanID=" + TestPlanID + ", ClassroomID=" + ClassroomID + ", StudentID=" + StudentID
				+ ", StudentState=" + StudentState + "]";
	}
	
}
