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
	/*修改考试计划*/
	@Override
	public boolean editExamPlan(Exam exam) {
		// TODO Auto-generated method stub
		try {
			updateEntity(exam);
			return true;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}
	/*查询一条考试计划*/
	@Override
	public Exam findOneExamPlan(int sid) {
		// TODO Auto-generated method stub
		String hql = "from Exam where sid=?";
		try {
			return findOneByHql(hql, new Object[]{sid});
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	
	@Override
	public void deleteExamPlan(Exam exam) {
		// TODO Auto-generated method stub
		try {
			deleteEntity(exam);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
