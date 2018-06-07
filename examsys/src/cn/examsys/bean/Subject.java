package cn.examsys.bean;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="subject_tb")
public class Subject {
	@Id
	@GenericGenerator(name="sid", strategy="identity")
	int sid;
	
	String userId;//创建的用户
	
	String name;//科目名称
	
}
