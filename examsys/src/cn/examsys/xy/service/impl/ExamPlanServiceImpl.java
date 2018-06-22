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
		/*User currentUser=examPlanDao.findOneExam(exam.getSid());  
		Field[] field = currentUser.getClass().getDeclaredFields(); 
		Field[] f = user.getClass().getDeclaredFields();	
		try {
				for(int i=0;i<field.length;i++) {
					field[i].setAccessible(true);     
					f[i].setAccessible(true);		
					Object vals = f[i].get(user);
					Object val = field[i].get(currentUser);
					String type = f[i].getType().toString();
					if(vals==null || "".equals(vals)) {
						vals=val;
						f[i].set(user, vals);
					}else if(type.endsWith("int")) {
							int va = f[i].getInt(user);
							int v = f[i].getInt(currentUser);
							if(va==0) {
							f[i].set(user, v);
						}
					}
				}
			} catch (IllegalArgumentException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}*/
		return examPlanDao.editExamPlan(exam);
	}

	@Override
	public Exam selectOneExamPlan(int sid) {
		// TODO Auto-generated method stub
		return null;
	}

}
