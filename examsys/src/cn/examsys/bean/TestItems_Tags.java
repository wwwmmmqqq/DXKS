package cn.examsys.bean;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.Generated;

@Entity
@Table(name="TestItems_Tags")
public class TestItems_Tags {
	/*TagID	int
	TestItemID	int*/
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	int TagID;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	int TestItemID;


	@Override
	public String toString() {
		return "TestItems_Tags [TagID=" + TagID + ", TestItemID=" +TestItemID
				+ "]";
	}
	
}
