package cn.examsys.lrx.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.examsys.bean.Grade;
import cn.examsys.bean.Question;
import cn.examsys.bean.User;
import cn.examsys.common.QuestionListTool;
import cn.examsys.lrx.dao.PersonalDao;
import cn.examsys.lrx.dao.impl.PersonalDaoImpl;
import cn.examsys.lrx.service.PersonalService;
import cn.examsys.lrx.vo.PersonalHomePageVO;

@Service("personalService")
@Transactional
public class PersonalServiceImpl implements PersonalService {
	
	@Autowired
	PersonalDaoImpl dao;

	@Override
	public PersonalHomePageVO searchExamsBy(User sessionUser, String filed, String words) {
		
		return null;
	}
	
	@Override
	public PersonalHomePageVO loadStuIndexDatas(User sessionUser) {
		
		return null;
	}

	@Override
	public void updateStuInfos(User sessionUser, Object[] fields, Object[] values) {
		dao.updateEntityFields(User.class, fields, values);
	}

	@Override
	public List<Grade> loadGradeList(User sessionUser, int page) {
		try {
			return dao.findByHql("from Grade where userId=?"
					, new Object[]{sessionUser.getUserId()}, page);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public boolean updatePsw(User sessionUser, String oldPsw, String newPsw) {
		try {
			User u = dao.findOneByHql("from User where userId=?", new Object[]{sessionUser.getUserId()});
			if (u.getPsw().equals(oldPsw)) {
				u.setPsw(newPsw);
				dao.updateEntity(u);
				return true;
			} else {
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public List<Question> loadResponsibleQuestions(User sessionUser, int page) {
		/*List<Question> questionList = dao.findByHql("from Question where ");
		StringBuilder qRefs = new StringBuilder();
		for (int i = 0; i < questionList.size(); i++) {
			qRefs.append(questionList.get(i).getSid() + ",");
		}
		return null;*/
		try {
			List<Question> questionList = dao.findByHql("from Question", 1);
			QuestionListTool.fillOptionsFromQuestionList(dao, questionList);
			return questionList;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
}
