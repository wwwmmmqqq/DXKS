package cn.examsys.xy.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.examsys.bean.Exam;
import cn.examsys.common.Tool;
import cn.examsys.xy.dao.ExamPlanDao;
import cn.examsys.xy.service.ExamPlanService;
@Service(value="examPlanService")
@Transactional
public class ExamPlanServiceImpl implements ExamPlanService {
	@Autowired
	ExamPlanDao examPlanDao;
	@Override
	public boolean createExamPlan(Exam exam) {
		// TODO Auto-generated method stub
		/*exam.setUserId(user.getUserId());
		exam.setState(0);
		exam.setTime(Tool.time());*/
		int u=examPlanDao.createExamPlan(exam);
		if(u >0) {
			return true;
		}else {
			return false;
		}
	}

}
