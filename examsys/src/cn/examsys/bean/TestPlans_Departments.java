package cn.examsys.bean;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.Generated;

@Entity
@Table(name="testplans_departments")
public class TestPlans_Departments {
	/*TestPlanID	int
	DepartmentID	int*/
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	int TestPlanID;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	int DepartmentID;


	public int getTestPlanID() {
		return TestPlanID;
	}


	public void setTestPlanID(int testPlanID) {
		TestPlanID = testPlanID;
	}


	public int getDepartmentID() {
		return DepartmentID;
	}


	public void setDepartmentID(int departmentID) {
		DepartmentID = departmentID;
	}


	@Override
	public String toString() {
		return "TestPlans_Departments [TestPlanID=" + TestPlanID + ", DepartmentID=" + DepartmentID  
				+ "]";
	}
	
}
