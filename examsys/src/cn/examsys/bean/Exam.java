package cn.examsys.bean;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="exam_tb")
public class Exam {
	@Id
	@GenericGenerator(name="sid", strategy="identity")
	int sid;
	
	String userId;//创建的用户
	
	String title;//考试名字
	
	int subjectRef;//指向科目
	
	String subjectName;//科目名称
	
	String examStart;//开始
	
	String examEnd;//结束

	String periodStart;//考试阶段开始时间

	String periodEnd;//考试阶段结束时间
	
	/**邀请的学校*/
	String invitee;//创建时立刻把本校加入到本字段
	
	String explain;//考试说明
	/**
	 * 0 初始创建
	 * 1 邀请了学校
	 * 2 已组卷
	 * 3 考试ing
	 * 4 考试完成
	 */
	int state;
	
	//int together;//受邀学校是否参与出题
	
	String time;//创建时间
	
	
	
	
}
