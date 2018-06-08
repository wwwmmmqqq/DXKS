package cn.examsys.xy.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.examsys.bean.User;
import cn.examsys.xy.dao.LoginDao;
import cn.examsys.xy.service.LoginService;

@Service(value="loginService")
@Transactional
public class LoginServiceImpl implements LoginService{

	@Autowired
	LoginDao loginDao;
	
	@Override
	public User login(String userId) {
		// TODO Auto-generated method stub
		
		return  loginDao.login(userId);
	}
	
}
