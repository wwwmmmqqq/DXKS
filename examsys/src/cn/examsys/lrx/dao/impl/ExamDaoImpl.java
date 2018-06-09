package cn.examsys.lrx.dao.impl;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import cn.examsys.adapters.DaoAdapter;
import cn.examsys.lrx.dao.ExamDao;

@Repository("examDao")
public class ExamDaoImpl extends DaoAdapter implements ExamDao {

	@Override
	public <T> T findExamById(int sid) {
		return null;
	}
	
}
