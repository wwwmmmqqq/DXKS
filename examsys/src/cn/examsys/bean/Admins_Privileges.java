package cn.examsys.bean;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.Generated;

@Entity
@Table(name="admins_Privileges")
public class Admins_Privileges {
	/*AdminID   int
    PrivilegeID   int*/
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	int AdminID;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	int PrivilegeID;


	
	public int getAdminID() {
		return AdminID;
	}



	public void setAdminID(int adminID) {
		AdminID = adminID;
	}



	public int getPrivilegeID() {
		return PrivilegeID;
	}



	public void setPrivilegeID(int privilegeID) {
		PrivilegeID = privilegeID;
	}



	@Override
	public String toString() {
		return "Admins_Privileges [AdminID=" + PrivilegeID + ", PrivilegeID=" +PrivilegeID 
				+ "]";
	}
	
}
