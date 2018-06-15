package cn.examsys.xy.dao.impl;

import org.springframework.stereotype.Repository;

import cn.examsys.adapters.DaoAdapter;
import cn.examsys.bean.User;
import cn.examsys.xy.dao.LoginDao;

@Repository("loginDao")
public class LoginDaoImpl extends DaoAdapter implements LoginDao {

	@Override
	public User login(String userId){
		// TODO Auto-generated method stub
		try {
			return findOneByHql("from User where userId=?",new Object[]{userId});
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}


	
}
