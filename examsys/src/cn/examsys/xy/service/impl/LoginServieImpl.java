package cn.examsys.xy.service.impl;

import java.io.Serializable;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.examsys.bean.User;
import cn.examsys.xy.service.XyService;
import cn.examsys.xy.dao.LoginDao;
import cn.examsys.xy.service.LoginService;
@Service("loginService")
@Transactional
public class LoginServieImpl implements LoginService {
	@Resource(name="loginDao")
	private LoginDao userDao;
	
	@Override
	public User login(User user) throws Exception {
		// TODO Auto-generated method stub
		return (User) userDao.saveEntity(user);
	}
	
}
