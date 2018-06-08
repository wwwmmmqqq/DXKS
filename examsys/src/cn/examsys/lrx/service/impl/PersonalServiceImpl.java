package cn.examsys.lrx.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.examsys.bean.Paper;
import cn.examsys.bean.User;
import cn.examsys.lrx.dao.ExamDao;
import cn.examsys.lrx.dao.PersonalDao;
import cn.examsys.lrx.service.ExamService;
import cn.examsys.lrx.service.PersonalService;
import cn.examsys.lrx.vo.ExamPageVO;
import cn.examsys.lrx.vo.PersonalHomePageVO;

@Service("personalService")
public class PersonalServiceImpl implements PersonalService {
	
	@Autowired
	PersonalDao dao;

	@Override
	public PersonalHomePageVO loadHomePageDatas(User sessionUser) {
		PersonalHomePageVO vo = new PersonalHomePageVO();
		return null;
	}

}
