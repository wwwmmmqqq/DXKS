package cn.examsys.bean;

<<<<<<< HEAD
import java.sql.Date;

=======
>>>>>>> origin/wmq
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
<<<<<<< HEAD
@Table(name="subject")
=======
@Table(name="subject_tb")
>>>>>>> origin/wmq
public class Subject {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
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
	
}
