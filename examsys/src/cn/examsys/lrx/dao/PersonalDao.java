package cn.examsys.lrx.dao;

import java.util.List;

import cn.examsys.bean.User;

public interface PersonalDao {
	
	List<?> findExams();

	void updateEntityFields(Class<User> class1, Object[] fields, Object[] values);
	
}
