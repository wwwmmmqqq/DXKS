package cn.examsys.xy.dao.impl;

import java.io.Serializable;

import org.springframework.stereotype.Repository;

import cn.examsys.adapters.DaoAdapter;
import cn.examsys.bean.Exam;
import cn.examsys.xy.dao.ExamPlanDao;
@Repository("examPlanDao")
public class ExamPlanDaoImpl extends DaoAdapter implements ExamPlanDao{

	@Override
	public int createExamPlan(Exam exam) {
		// TODO Auto-generated method stub
		try {
			Serializable ex=saveEntity(exam);
			return (Integer) ex;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		}
	}

}
