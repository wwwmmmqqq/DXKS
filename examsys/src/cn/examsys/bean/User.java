package cn.examsys.bean;

import javax.persistence.Id;

import org.hibernate.annotations.GenericGenerator;

public class User {
	@Id
	@GenericGenerator(name="userId", strategy="assigned")
	String userId;
	
	String psw;
	
	String name;
	
	String sex;
	
	String phone;
	
	String email;
	
	int collegeRef;
	
	String permission;//权限
	
	//@Formula("()")
	String collegeName;
}
