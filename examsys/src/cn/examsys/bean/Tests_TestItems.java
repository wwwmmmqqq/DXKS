package cn.examsys.bean;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.Generated;

@Entity
@Table(name="Tests_TestItems")
public class Tests_TestItems {
	/*TestItemID	int
	TestID	int
	TestItemOrder	int*/
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	int TestItemID;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	int TestID;
	int TestItemOrder;


	
	public int getTestItemID() {
		return TestItemID;
	}



	public void setTestItemID(int testItemID) {
		TestItemID = testItemID;
	}



	public int getTestID() {
		return TestID;
	}



	public void setTestID(int testID) {
		TestID = testID;
	}



	public int getTestItemOrder() {
		return TestItemOrder;
	}



	public void setTestItemOrder(int testItemOrder) {
		TestItemOrder = testItemOrder;
	}



	@Override
	public String toString() {
		return "Tests_TestItems [TestItemID=" + TestItemID + ", TestID=" + TestID + ", TestItemOrder=" + TestItemOrder 
				+ "]";
	}
	
}
