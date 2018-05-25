package cn.examsys.bean;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.Generated;

@Entity
@Table(name="Selection")
public class Selection {
	/*TestItemID	int
	SelectA	Varchar(200)
	SelectB	Varchar(200)
	SelectC	Varchar(200)
	SelectD	Varchar(200)
	Answer	int*/
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	int TestItemID;
	String SelectA;
	String SelectB;
	String SelectC;
	String SelectD;
	int Answer;
	


	public int getTestItemID() {
		return TestItemID;
	}



	public void setTestItemID(int testItemID) {
		TestItemID = testItemID;
	}



	public String getSelectA() {
		return SelectA;
	}



	public void setSelectA(String selectA) {
		SelectA = selectA;
	}



	public String getSelectB() {
		return SelectB;
	}



	public void setSelectB(String selectB) {
		SelectB = selectB;
	}



	public String getSelectC() {
		return SelectC;
	}



	public void setSelectC(String selectC) {
		SelectC = selectC;
	}



	public String getSelectD() {
		return SelectD;
	}



	public void setSelectD(String selectD) {
		SelectD = selectD;
	}



	public int getAnswer() {
		return Answer;
	}



	public void setAnswer(int answer) {
		Answer = answer;
	}



	@Override
	public String toString() {
		return "Selection [TestItemID=" + TestItemID + ", SelectA=" + SelectA + ", SelectB=" + SelectB
				+ ", SelectC=" + SelectC +", SelectD=" + SelectD + ", Answer=" + Answer + "]";
	}
	
}
