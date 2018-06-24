package cn.examsys.xy.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.examsys.bean.Exam;

public interface ExamPlanService {
	/*创建考试计划*/
	boolean createExamPlan(Exam exam);
	/*修改考试计划*/
	boolean editExamPlan(Exam exam);
	/*查看一条考试信息*/
	Exam selectOneExamPlan(int sid);
	/*删除一条考试信息*/
	boolean deleteExamPlan(int sid);
	
}
