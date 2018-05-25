package cn.examsys.bean;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.Generated;

@Entity
@Table(name="Chapter")
public class Chapter {
	/*ChapterID	int
	ChapterName	Varchar(20)
	ChapterNo	int*/
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	int ChapterID;
	String ChapterName;
	int ChapterNo;


	
	public int getChapterID() {
		return ChapterID;
	}



	public void setChapterID(int chapterID) {
		ChapterID = chapterID;
	}



	public String getChapterName() {
		return ChapterName;
	}



	public void setChapterName(String chapterName) {
		ChapterName = chapterName;
	}



	public int getChapterNo() {
		return ChapterNo;
	}



	public void setChapterNo(int chapterNo) {
		ChapterNo = chapterNo;
	}



	@Override
	public String toString() {
		return "Chapter [ChapterID=" + ChapterID + ", ChapterName=" + ChapterName 
				+ ", ChapterNo=" + ChapterNo + "]";
	}
	
}
