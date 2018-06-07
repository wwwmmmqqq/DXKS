package cn.examsys.bean;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

/**
 * 试卷
 * @author asus
 */
@Entity
@Table(name="paper_tb")
public class Paper {
	@Id
	@GenericGenerator(name="sid", strategy="identity")
	int sid;
	
	int examRef;//指向哪堂考试
	
	String name;
	
	String time;
	
	int totalScore;
	
	String questionList;//组好的题目序号  用逗号隔开
	String scoreList;//组好的题目对应的分数  用逗号隔开
	
	//@Formula("()")
	String subjectName;//科目名
	//@Formula("()")。
	
	int totalTime;//总时间，单位分钟
	
}
