package cn.examsys.xy.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.examsys.bean.Grade;
import cn.examsys.xy.dao.GradeDao;
import cn.examsys.xy.service.GradeService;
@Service(value="gradeService")
@Transactional
public class GradeServiceImpl implements GradeService {
	@Autowired
	GradeDao gradeDao;
	
	@Override
	public Grade findGradeByUserId(String userId) {
		// TODO Auto-generated method stub
		return gradeDao.findGradeByUserId(userId);
	}

}
