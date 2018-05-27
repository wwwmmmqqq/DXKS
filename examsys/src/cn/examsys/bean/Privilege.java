package cn.examsys.bean;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.Generated;

@Entity
@Table(name="privilege")
public class Privilege {
	/*PrivilegeID	int
	PrivilegeName	Varchar(20)
	PrivilegeUrl	Varchar(100)*/
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	int PrivilegeID;
	String PrivilegeName;
	String PrivilegeUrl;

	



	public int getPrivilegeID() {
		return PrivilegeID;
	}





	public void setPrivilegeID(int privilegeID) {
		PrivilegeID = privilegeID;
	}





	public String getPrivilegeName() {
		return PrivilegeName;
	}





	public void setPrivilegeName(String privilegeName) {
		PrivilegeName = privilegeName;
	}





	public String getPrivilegeUrl() {
		return PrivilegeUrl;
	}





	public void setPrivilegeUrl(String privilegeUrl) {
		PrivilegeUrl = privilegeUrl;
	}





	@Override
	public String toString() {
		return "Privilege [PrivilegeID=" + PrivilegeID + ", PrivilegeName=" + PrivilegeName + ", PrivilegeUrl=" + PrivilegeUrl
				+ "]";
	}
	
}
