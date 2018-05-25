package cn.examsys.bean;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.Generated;

@Entity
@Table(name="Tag")
public class Tag {
	/*TagID	int
	TagName	Varchar(20)*/
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	int TagID;
	String TagName;



	public int getTagID() {
		return TagID;
	}



	public void setTagID(int tagID) {
		TagID = tagID;
	}



	public String getTagName() {
		return TagName;
	}



	public void setTagName(String tagName) {
		TagName = tagName;
	}



	@Override
	public String toString() {
		return "Tag [TagID=" + TagID + ", TagName=" +TagName
				+ "]";
	}
	
}
