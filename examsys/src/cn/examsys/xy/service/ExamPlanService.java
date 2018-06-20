package cn.examsys.xy.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.examsys.bean.Exam;

public interface ExamPlanService {
	/*创建考试计划*/
	boolean createExamPlan(Exam exam);
	
}
