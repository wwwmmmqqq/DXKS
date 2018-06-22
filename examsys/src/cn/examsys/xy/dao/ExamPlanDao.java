package cn.examsys.xy.dao;

import cn.examsys.bean.Exam;

public interface ExamPlanDao {
	/*创建考试计划*/
	int createExamPlan(Exam exam);
	/*修改考试计划*/
	boolean editExamPlan(Exam exam);

}
