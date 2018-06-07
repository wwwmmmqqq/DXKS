package cn.examsys.bean;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.Formula;
import org.hibernate.annotations.GenericGenerator;

/**
 * 成绩
 * @author asus
 */
@Entity
@Table(name="grade_tb")
public class Grade {
	@Id
	@GenericGenerator(name="sid", strategy="identity")
	int sid;
	
	String userId;
	
	int paperRef;//指向的试卷
	
	int point;//得分
	
	String time;//交卷试卷
	
	int timeComsuming;//消耗时间
	
	//@Formula("()")
	String subjectName;
	
}
