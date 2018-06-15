package cn.examsys.bean;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="notice_tb")
public class Notice {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	int sid;
	String type;
	String title;
	String content;
	String userId;
	String targetIds;//目标用户 逗号隔开
	String readsIds;//已读用户 逗号隔开
	String time;

	public int getSid() {
		return sid;
	}

	public void setSid(int sid) {
		this.sid = sid;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getTargetIds() {
		return targetIds;
	}

	public void setTargetIds(String targetIds) {
		this.targetIds = targetIds;
	}

	public String getReadsIds() {
		return readsIds;
	}

	public void setReadsIds(String readsIds) {
		this.readsIds = readsIds;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	@Override
	public String toString() {
		return "Notice [sid=" + sid + ", type=" + type + ", title=" + title
				+ ", content=" + content + ", userId=" + userId
				+ ", targetIds=" + targetIds + ", readsIds=" + readsIds
				+ ", time=" + time + "]";
	}
	
}
