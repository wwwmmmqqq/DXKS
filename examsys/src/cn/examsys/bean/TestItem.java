package cn.examsys.bean;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.Generated;

@Entity
@Table(name="testitem")
public class TestItem {
	/*TestItemID	int
	SubjectID	int
	TestItemType	int
	TestItemDesc	Varchar(500)
	Difficulty	int
	AdminID	int
	TestItemEnterDate	date
	ChapterID	int*/
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	int TestItemID;
	int SubjectID;
	int TestItemType;
	String TestItemDesc;
	int Difficulty;
	int AdminID;
	Date TestItemEnterDate;
	int ChapterID;
	


	public int getTestItemID() {
		return TestItemID;
	}



	public void setTestItemID(int testItemID) {
		TestItemID = testItemID;
	}



	public int getSubjectID() {
		return SubjectID;
	}



	public void setSubjectID(int subjectID) {
		SubjectID = subjectID;
	}



	public int getTestItemType() {
		return TestItemType;
	}



	public void setTestItemType(int testItemType) {
		TestItemType = testItemType;
	}



	public String getTestItemDesc() {
		return TestItemDesc;
	}



	public void setTestItemDesc(String testItemDesc) {
		TestItemDesc = testItemDesc;
	}



	public int getDifficulty() {
		return Difficulty;
	}



	public void setDifficulty(int difficulty) {
		Difficulty = difficulty;
	}



	public int getAdminID() {
		return AdminID;
	}



	public void setAdminID(int adminID) {
		AdminID = adminID;
	}



	public Date getTestItemEnterDate() {
		return TestItemEnterDate;
	}



	public void setTestItemEnterDate(Date testItemEnterDate) {
		TestItemEnterDate = testItemEnterDate;
	}



	public int getChapterID() {
		return ChapterID;
	}



	public void setChapterID(int chapterID) {
		ChapterID = chapterID;
	}



	@Override
	public String toString() {
		return "TestItem [TestItemID=" + TestItemID + ", SubjectID=" + SubjectID + ", TestItemType=" + TestItemType
				+ ", TestItemDesc=" + TestItemDesc +", Difficulty=" + Difficulty + ", AdminID=" + AdminID + ", TestItemEnterDate=" + TestItemEnterDate + ", ChapterID=" + ChapterID + "]";
	}
	
}
