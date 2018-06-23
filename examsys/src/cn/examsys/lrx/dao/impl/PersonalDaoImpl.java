package cn.examsys.lrx.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import cn.examsys.adapters.DaoAdapter;
import cn.examsys.bean.User;
import cn.examsys.lrx.dao.PersonalDao;

@Repository("personalDao")
public class PersonalDaoImpl extends DaoAdapter implements PersonalDao {

	@Override
	public List<?> findExams() {
		return null;
	}

}
