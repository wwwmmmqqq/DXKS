package cn.examsys.bean;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
@Entity
@Table(name="user_tb")
public class User {
	@Id
	@GenericGenerator(name="userId", strategy="assigned")
	//save() 之前必须指定一个主键，hibernate不会自动生成
	String userId;
	
	String psw;
	
	String name;//用户真实姓名
	
	String sex;//用户性别
	
	String phone;//用户联系方式
	
	String email;//用户电子邮件
	
	int collegeRef;//指向学校
	
	int professionRef;//指向专业
	
	String permission;//权限
	
	//@Formula("()")
	String collegeName;
}
