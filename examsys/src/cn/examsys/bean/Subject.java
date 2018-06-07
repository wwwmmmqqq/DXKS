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

	public int getSid() {
		return sid;
	}
	public void setSid(int sid) {
		this.sid = sid;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "Subject [sid=" + sid + ", userId=" + userId + ", name=" + name
				+ "]";
	}
	
}
