package cn.examsys.xy.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.examsys.bean.User;
import cn.examsys.xy.dao.UserDao;
import cn.examsys.xy.service.UserService;
@Service(value="userService")
@Transactional
public class UserServiceImpl implements UserService{
	@Autowired
	UserDao userDao;
	
	/*创建用户*/
	@Override
	public boolean createUser(User user) {
		// TODO Auto-generated method stub
		userDao.saveEntity(user);
		return true;
	}
	/*删除用户*/
	@Override
	public boolean deleteUser(String userId) {
		// TODO Auto-generated method stub
		User user=userDao.findOneUser(userId);
		userDao.deleteEntity(user);
		return true;
	}
	/*查询用户列表*/
	public List<User> SelectUserList(String type,int page) {
		// TODO Auto-generated method stub
		List<User> userList=userDao.selectUserList(type,page);
		return userList;
	}
	/*查询用户列表总页数*/
	@Override
	public int SelectUserListCount(String type) {
		// TODO Auto-generated method stub
		return userDao.selectUserListCount(type);
	}
	/*编辑用户信息*/
	@Override
	public boolean editUser(User user) {
		// TODO Auto-generated method stub
		userDao.editUser(user);
		return true;
	}
	/*显示一个用户信息*/
	@Override
	public User SelectOneUser(String userId) {
		// TODO Auto-generated method stub
		User user=userDao.findOneUser(userId);
		return user;
	}

}
