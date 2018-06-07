package cn.examsys.bean;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

/**
 * 专业表
 */
@Entity
@Table(name="profession_tb")
public class Profession {
	@Id
	@GenericGenerator(name="sid",strategy="identity")
	int sid;
	
	String professionName;//专业名称

	public int getSid() {
		return sid;
	}

	public void setSid(int sid) {
		this.sid = sid;
	}

	public String getProfessionName() {
		return professionName;
	}

	public void setProfessionName(String professionName) {
		this.professionName = professionName;
	}

	@Override
	public String toString() {
		return "Profession [sid=" + sid + ", professionName=" + professionName + "]";
	}
	
	
}
