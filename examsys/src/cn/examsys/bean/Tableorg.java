package cn.examsys.bean;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="table_org")
public class Tableorg {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	int orgID;
	String orgName;
	int parentId;
	
	public int getOrgID() {
		return orgID;
	}
	public void setOrgID(int orgID) {
		this.orgID = orgID;
	}
	public String getOrgName() {
		return orgName;
	}
	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}
	public int getParentId() {
		return parentId;
	}
	public void setParentId(int parentId) {
		this.parentId = parentId;
	}
	
}
