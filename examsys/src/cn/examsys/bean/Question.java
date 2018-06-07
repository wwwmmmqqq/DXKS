package cn.examsys.bean;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="question_tb")
public class Question {
	@Id
	@GenericGenerator(name="sid", strategy="identity")
	int sid;
	
	int paperRef;//指向试卷
	
	String type;//题目类型
	
	String userId;
	
	String title;//题目内容
	
	int choiceCount;
	
	int difficultyValue;//难度值
	
}
