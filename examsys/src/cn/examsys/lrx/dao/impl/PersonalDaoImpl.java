package cn.examsys.lrx.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import cn.examsys.adapters.DaoAdapter;
import cn.examsys.bean.User;
import cn.examsys.lrx.dao.ExamDao;
import cn.examsys.lrx.dao.LrxDao;
import cn.examsys.lrx.dao.PersonalDao;

@Repository("personalDao")
public class PersonalDaoImpl extends DaoAdapter implements PersonalDao {

	@Override
	public List<?> findExams() {
		return null;
	}

	@Override
	public void updateEntityFields(Class<User> claz, Object[] fields, Object[] values) {
		updateEntityFields(claz, fields, values);
	}
	
}
