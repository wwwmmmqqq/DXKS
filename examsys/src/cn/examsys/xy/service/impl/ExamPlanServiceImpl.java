package cn.examsys.xy.service.impl;

import java.lang.reflect.Field;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.examsys.bean.Exam;
import cn.examsys.bean.User;
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

	@Override
	public boolean editExamPlan(Exam exam) {
		// TODO Auto-generated method stub
		Exam currentExam=examPlanDao.findOneExamPlan(exam.getSid());  
		Field[] field = currentExam.getClass().getDeclaredFields(); 
		Field[] f = exam.getClass().getDeclaredFields();	
		try {
				for(int i=0;i<field.length;i++) {
					field[i].setAccessible(true);     
					f[i].setAccessible(true);		
					Object vals = f[i].get(exam);
					Object val = field[i].get(currentExam);
					String type = f[i].getType().toString();
					if(vals==null || "".equals(vals)) {
						vals=val;
						f[i].set(exam, vals);
					}else if(type.endsWith("int")) {
							int va = f[i].getInt(exam);
							int v = f[i].getInt(currentExam);
							if(va==0) {
							f[i].set(exam, v);
						}
					}
				}
			} catch (IllegalArgumentException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return examPlanDao.editExamPlan(exam);
	}

	@Override
	public Exam selectOneExamPlan(int sid) {
		// TODO Auto-generated method stub
		return examPlanDao.findOneExamPlan(sid);
	}

	@Override
	public boolean deleteExamPlan(int sid) {
		// TODO Auto-generated method stub
		Exam exam = examPlanDao.findOneExamPlan(sid);
		examPlanDao.deleteExamPlan(exam);
		return false;
	}

}
