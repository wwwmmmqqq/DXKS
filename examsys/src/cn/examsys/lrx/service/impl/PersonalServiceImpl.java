package cn.examsys.lrx.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.examsys.bean.User;
import cn.examsys.lrx.dao.PersonalDao;
import cn.examsys.lrx.service.PersonalService;
import cn.examsys.lrx.vo.PersonalHomePageVO;

@Service("personalService")
@Transactional
public class PersonalServiceImpl implements PersonalService {
	
	@Autowired
	PersonalDao dao;

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
	
}
