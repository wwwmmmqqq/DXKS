package cn.examsys.xy.dao;

import cn.examsys.bean.Exam;

public interface ExamPlanDao {
	/*创建考试计划*/
	int createExamPlan(Exam exam);
	/*修改考试计划*/
	boolean editExamPlan(Exam exam);
	/*查询一条考试计划*/
	Exam findOneExamPlan(int sid);
	/*删除一条考试计划*/
	void deleteExamPlan(Exam exam);

}
