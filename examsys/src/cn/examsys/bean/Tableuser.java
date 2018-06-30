package cn.examsys.bean;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="table_user")
public class Tableuser {
	@Id
	@GenericGenerator(name="userId", strategy="assigned")
	String realname;
	
	
	String password;
	int orgID;
	String phonenumber;
	String phonenumber2;
	int verion;
	int state;
	int updated;
	String shortnumber1;
	String shortnumber2;
	public int getOrgID() {
		return orgID;
	}
	public void setOrgID(int orgID) {
		this.orgID = orgID;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRealname() {
		return realname;
	}
	public void setRealname(String realname) {
		this.realname = realname;
	}
	public String getPhonenumber() {
		return phonenumber;
	}
	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}
	public String getPhonenumber2() {
		return phonenumber2;
	}
	public void setPhonenumber2(String phonenumber2) {
		this.phonenumber2 = phonenumber2;
	}
	public int getVerion() {
		return verion;
	}
	public void setVerion(int verion) {
		this.verion = verion;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public int getUpdated() {
		return updated;
	}
	public void setUpdated(int updated) {
		this.updated = updated;
	}
	public String getShortnumber1() {
		return shortnumber1;
	}
	public void setShortnumber1(String shortnumber1) {
		this.shortnumber1 = shortnumber1;
	}
	public String getShortnumber2() {
		return shortnumber2;
	}
	public void setShortnumber2(String shortnumber2) {
		this.shortnumber2 = shortnumber2;
	}
}
