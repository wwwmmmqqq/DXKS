package cn.examsys.bean;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.Generated;

@Entity
@Table(name="Test")
public class Test {
	/*TestID	int
	SubjectID	int
	TestName	Varchar(200)
	TestTotalScore	int
	AdminID	int
	TestLast	int
	TestUseCount	int
	TestEnterDate	date*/
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	int TestID;
	String SubjectID;
	String TestName;
	String TestTotalScore;
	String AdminID;
	String TestLast;
	String TestUseCount;
	Date TestEnterDate;
	
	
	public int getTestID() {
		return TestID;
	}


	public void setTestID(int testID) {
		TestID = testID;
	}


	public String getSubjectID() {
		return SubjectID;
	}


	public void setSubjectID(String subjectID) {
		SubjectID = subjectID;
	}


	public String getTestName() {
		return TestName;
	}


	public void setTestName(String testName) {
		TestName = testName;
	}


	public String getTestTotalScore() {
		return TestTotalScore;
	}


	public void setTestTotalScore(String testTotalScore) {
		TestTotalScore = testTotalScore;
	}


	public String getAdminID() {
		return AdminID;
	}


	public void setAdminID(String adminID) {
		AdminID = adminID;
	}


	public String getTestLast() {
		return TestLast;
	}


	public void setTestLast(String testLast) {
		TestLast = testLast;
	}


	public String getTestUseCount() {
		return TestUseCount;
	}


	public void setTestUseCount(String testUseCount) {
		TestUseCount = testUseCount;
	}


	public Date getTestEnterDate() {
		return TestEnterDate;
	}


	public void setTestEnterDate(Date testEnterDate) {
		TestEnterDate = testEnterDate;
	}


	@Override
	public String toString() {
		return "Test [TestID=" + TestID + ", SubjectID=" + SubjectID + ", TestName=" + TestName
				+ ", TestTotalScore=" + TestTotalScore + ", AdminID=" + AdminID + ", TestLast="
				+ TestLast + ", TestUseCount=" + TestUseCount + ", TestEnterDate=" + TestEnterDate
				+ "]";
	}
	
}
