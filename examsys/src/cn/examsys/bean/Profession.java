package cn.examsys.bean;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

/**
 * 专业
 * @author lrx
 * 2018年6月7日
 */
@Entity
@Table(name="profession_tb")
public class Profession {
	@Id
	@GenericGenerator(name="sid", strategy="identity")
	int sid;
	
	String name;

	public int getSid() {
		return sid;
	}

	public void setSid(int sid) {
		this.sid = sid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
}
