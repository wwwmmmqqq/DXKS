package cn.examsys.xy.dao.impl;

import java.io.Serializable;

import org.springframework.stereotype.Repository;

import cn.examsys.adapters.DaoAdapter;
import cn.examsys.adapters.IDaoAdapter;
import cn.examsys.bean.User;
import cn.examsys.xy.dao.LoginDao;


@Repository(value="loginDao")
public class LoginDaoImpl extends DaoAdapter implements LoginDao {

	@Override
	public Serializable saveEntity(User user) throws Exception {
		// TODO Auto-generated method stub
		return super.saveEntity(user);
	}
	/*@Override
	public User add(User user) {
		// TODO Auto-generated method stub
		return null;
	}*/

	
}
