package cn.examsys.bean;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.Generated;

@Entity
@Table(name="Judge")
public class Judge {
	/*TestItemID	int
	JudgeAnswer	int*/
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	int TestItemID;
	int JudgeAnswer;


	

	public int getTestItemID() {
		return TestItemID;
	}




	public void setTestItemID(int testItemID) {
		TestItemID = testItemID;
	}




	public int getJudgeAnswer() {
		return JudgeAnswer;
	}




	public void setJudgeAnswer(int judgeAnswer) {
		JudgeAnswer = judgeAnswer;
	}




	@Override
	public String toString() {
		return "Judge [TestItemID=" + TestItemID + ", JudgeAnswer=" +JudgeAnswer+ "]";
	}
	
}
