package cn.examsys.lrx.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.examsys.bean.Grade;
import cn.examsys.bean.User;
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
	
}
