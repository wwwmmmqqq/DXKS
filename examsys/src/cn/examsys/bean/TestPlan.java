package cn.examsys.bean;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.Generated;

@Entity
@Table(name="testplan")
public class TestPlan {
	/*TestPlanID	int
	TestPlanName	Varchar(100)
	TestPlanStart	date
	TestPlanLast	int
	TestPlanState	int*/
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	int TestPlanID;
	String TestPlanName;
	Date TestPlanStart;
	int TestPlanLast;
	int TestPlanState;
	


	public int getTestPlanID() {
		return TestPlanID;
	}



	public void setTestPlanID(int testPlanID) {
		TestPlanID = testPlanID;
	}



	public String getTestPlanName() {
		return TestPlanName;
	}



	public void setTestPlanName(String testPlanName) {
		TestPlanName = testPlanName;
	}



	public Date getTestPlanStart() {
		return TestPlanStart;
	}



	public void setTestPlanStart(Date testPlanStart) {
		TestPlanStart = testPlanStart;
	}



	public int getTestPlanLast() {
		return TestPlanLast;
	}



	public void setTestPlanLast(int testPlanLast) {
		TestPlanLast = testPlanLast;
	}



	public int getTestPlanState() {
		return TestPlanState;
	}



	public void setTestPlanState(int testPlanState) {
		TestPlanState = testPlanState;
	}



	@Override
	public String toString() {
		return "TestPlan [TestPlanID=" + TestPlanID + ", TestPlanName=" + TestPlanName + ", TestPlanStart=" + TestPlanStart
				+ ",TestPlanLast=" + TestPlanLast +", TestPlanState=" + TestPlanState + "]";
	}
	
}
