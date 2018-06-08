package cn.examsys.lrx.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.examsys.bean.Paper;
import cn.examsys.bean.User;
import cn.examsys.lrx.dao.ExamDao;
import cn.examsys.lrx.service.ExamService;
import cn.examsys.lrx.vo.ExamPageVO;

@Service("examService")
public class ExamServiceImpl implements ExamService {
	
	@Autowired
	ExamDao dao;

	@Override
	public ExamPageVO startExam(User user, int sid) {
		
		return null;
	}

	
}
